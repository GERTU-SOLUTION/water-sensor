import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:water_sensor/services/mqtt_service.dart';

class IoModule {
  final String ip;
  final int addr;
  IoModule({required this.ip, required this.addr});
}

class _TxItem {
  final String topic;
  final String hex;
  _TxItem(this.topic, this.hex);
}

class IoPollingController {
  final MqttService mqtt;
  final List<IoModule> modules;

  IoPollingController({required this.mqtt, required this.modules});

  // 1 queue — зөвхөн AUTO
  final Queue<_TxItem> _queue = Queue<_TxItem>();

  Timer? _pollTimer;
  bool _pollRunning = false;

  bool _txLoopRunning = false;
  bool _disposed = false;

  Completer<void>? _waiter;

  // ------------------------
  // START POLLING
  // ------------------------
  void start() {
    if (_pollTimer != null) return;

    // 5 секунд тутам polling
    _pollTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _processIOModules(),
    );

    _ensureTxLoop();
  }

  void stop() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void dispose() {
    _disposed = true;
    stop();
    _signalNewItem();
  }

  // ------------------------
  // PROCESS MODULES (poll)
  // ------------------------
  Future<void> _processIOModules() async {
    if (_pollRunning) return;
    _pollRunning = true;
    try {
      if (!mqtt.isConnected) return;

      for (final m in modules) {
        final hex = buildReadInputsHex(deviceId: m.addr);

        final topic = 'devices/sensor01/da';
        _queue.add(_TxItem(topic, hex));

        print("[POLL] enqueue -> $topic");
      }

      _signalNewItem();
      _ensureTxLoop();
    } finally {
      _pollRunning = false;
    }
  }

  // ------------------------
  // TX LOOP
  // ------------------------
  void _ensureTxLoop() {
    if (_txLoopRunning) return;
    _txLoopRunning = true;
    _txLoop();
  }

  void _signalNewItem() {
    if (_waiter != null && !_waiter!.isCompleted) {
      _waiter!.complete();
    }
    _waiter = null;
  }

  Future<void> _txLoop() async {
    print("[TX] loop started");
    try {
      while (!_disposed) {
        // queue хоосон биш бол нэгийг явуулна
        if (_queue.isNotEmpty) {
          final item = _queue.removeFirst();
          print("[TX] sending -> ${item.topic}  ${item.hex}");

          mqtt.publishHex(item.topic, item.hex);
          await Future.delayed(const Duration(milliseconds: 1000));
          continue;
        }

        // хоосон бол хүлээнэ
        print("[TX] waiting...");
        _waiter = Completer<void>();
        await _waiter!.future;
      }
    } finally {
      print("[TX] loop stopped");
      _txLoopRunning = false;
    }
  }
}

// MODBUS
String buildReadInputsHex({required int deviceId}) {
  final base = Uint8List.fromList([
    deviceId & 0xFF,
    0x02,
    0x00, 0x00, // start 0000
    0x00, 0x08, // qty 0008
  ]);

  final crc = computeModbusCrc(base);

  final list = <int>[...base, (crc & 0xFF), ((crc >> 8) & 0xFF)];

  return list
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join(' ')
      .toUpperCase();
}

int computeModbusCrc(Uint8List data) {
  int crc = 0xFFFF;
  for (final b in data) {
    crc ^= b;
    for (int i = 0; i < 8; i++) {
      if ((crc & 0x0001) != 0) {
        crc = (crc >> 1) ^ 0xA001;
      } else {
        crc >>= 1;
      }
    }
  }
  return crc & 0xFFFF;
}
