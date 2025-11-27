import 'dart:async';

import 'package:flutter/material.dart';
import 'package:water_sensor/screens/garage_colors.dart';
import 'package:water_sensor/services/api_service.dart';
import 'package:water_sensor/services/mqtt_service.dart';
import 'package:water_sensor/services/io_polling_controller.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:water_sensor/services/notification_service.dart';
import 'package:water_sensor/services/sound_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ус мэдрэгч',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MqttService _mqtt;
  late final IoPollingController _io;
  late final List<IoModule> _modules;
  Timer? _uiDebounceTimer;

  StreamSubscription<AppMqttMessage>? _mqttSub;

  String statusText = 'Холбогдоогүй';

  Map<int, List<String>> deviceCodes = {};
  final Set<String> _activeStorageCodes = {};
  bool _showAlarmPanel = true;

  final _topicPubController = TextEditingController(
    text: 'devices/sensor01/da',
  );
  final _topicSubController = TextEditingController(
    text: 'devices/sensor01/tx',
  );

  @override
  void initState() {
    super.initState();
    initGarageColors();

    _mqtt = MqttService();

    webNotification.requestPermission();

    _modules = List<IoModule>.generate(
      3,
      (i) => IoModule(ip: 'sensor01', addr: i + 1),
    );

    _io = IoPollingController(mqtt: _mqtt, modules: _modules);

    _listenMqtt();

    Future(() async {
      setState(() => statusText = 'Холбогдож байна...');
      await _mqtt.connect();

      if (_mqtt.isConnected) {
        setState(() => statusText = 'Холбогдсон');

        final subTopic = _topicSubController.text.trim();
        _mqtt.subscribe(subTopic);

        _io.start();
      } else {
        setState(() => statusText = '❌ Холбогдож чадсангүй');
      }
    });
  }

  void _listenMqtt() {
    _mqttSub = _mqtt.messages
        .where((m) => m.topic == 'devices/sensor01/tx')
        .listen(
          (msg) { 
            final hex = msg.hex.trim();
            final parts = hex.split(RegExp(r'\s+'));

            if (parts.length < 6) {
              print(
                "⚠️ RX frame хэт богино байна (${parts.length} byte): $hex",
              );
              return;
            }

            final int addr = int.parse(parts[0], radix: 16);
            final String idStr = addr
                .toRadixString(16)
                .padLeft(2, '0')
                .toUpperCase();

            final int byteCount = int.parse(parts[2], radix: 16);

            final dataBytes = <int>[];
            for (int i = 0; i < byteCount; i++) {
              dataBytes.add(int.parse(parts[3 + i], radix: 16));
            }
            final codesForDevice = <String>[];

            for (int byteIndex = 0; byteIndex < dataBytes.length; byteIndex++) {
              final value = dataBytes[byteIndex];
              for (int bit = 0; bit < 8; bit++) {
                if ((value & (1 << bit)) != 0) {
                  final totalBit = byteIndex * 8 + bit;
                  final ch = totalBit.toString().padLeft(2, '0');
                  codesForDevice.add('$idStr$ch');
                }
              }
            }

            final existingCodes = deviceCodes[addr] ?? [];

            /// 1) шинээр асаагдсан код = true update
            for (final code in codesForDevice) {
              if (!existingCodes.contains(code)) {
                applyCodeColor(code); // UI
                _setStorageStatus(code, true); // DB + list → true
              }
            }

            /// 2) өмнө нь байсан, одоо байхгүй бол = false update
            for (final code in existingCodes) {
              final stillActive = codesForDevice.contains(code);
              if (!stillActive) {
                // UI дээр унтраах бол энд:
                // clearCodeColor(code);
                debugPrint('🔻 $addr / $code -> false');
                _setStorageStatus(code, false);
              }
            }

            // дараа нь хамгийн сүүлд массивыг шинэ утгаар хадгална
            deviceCodes[addr] = codesForDevice;

            _scheduleUiUpdate();
          },
          onError: (e, st) => print('⚠️ mqtt messages error: $e'),
          onDone: () => print('ℹ️ mqtt messages stream closed'),
        );
  }

  void _setStorageStatus(String code, bool isActive) {
    if (isActive) {
      final wasEmpty = _activeStorageCodes.isEmpty;
      _activeStorageCodes.add(code);
      if (wasEmpty) {
        soundService.start();
      }
      webNotification.show('Ус мэдрэгч', '$code дахь агуулах ус мэдэрлээ');
    } else {
      _activeStorageCodes.remove(code);
      if (_activeStorageCodes.isEmpty) {
        soundService.stop();
      }
    }

    apiService.updateStorageStatus(code, isActive);
  }

  void updateAllColors() {
    resetGarageColors();

    deviceCodes.forEach((addr, codes) {
      for (final code in codes) {
        applyCodeColor(code);
      }
    });
  }

  void _scheduleUiUpdate() {
    if (_uiDebounceTimer != null && _uiDebounceTimer!.isActive) return;

    _uiDebounceTimer = Timer(const Duration(milliseconds: 100), () {
      setState(() {
        updateAllColors();
      });
    });
  }

  @override
  void dispose() {
    _mqttSub?.cancel();
    _mqtt.dispose();
    _topicPubController.dispose();
    _topicSubController.dispose();
    super.dispose();
  }

  Widget _buildAlarmList() {
    final codes = _activeStorageCodes.toList()..sort();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 6),
            color: Colors.black12,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 78, 117, 183),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.cast_connected,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Төлөв',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    statusText,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7043),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.water_drop,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ус мэдрэгч',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Realtime alerts',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'УС МЭДРЭГДСЭН АГУУЛАХ',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 8),

          if (codes.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Одоогоор ус мэдэрсэн агуулах алга.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            )
          else ...[
            for (final code in codes) _buildAlarmItem(code),
          ],

          const SizedBox(height: 12),

          // _buildHideButton(expanded: true),
        ],
      ),
    );
  }

  Widget _buildAlarmItem(String code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 20,
            color: Color(0xFFF57C00),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$code дахь агуулах ус мэдэрлээ',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          // Жижиг “badge” тоо байж болно, одоогоор 1 гэж тавьчихъя
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text('1', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildHideButton({bool expanded = false}) {
    final label = _showAlarmPanel ? 'Мэдэгдлийг нуух' : 'Мэдэгдлийг харуулах';

    final btn = OutlinedButton.icon(
      onPressed: () {
        setState(() {
          _showAlarmPanel = !_showAlarmPanel;
        });
      },
      icon: Icon(
        _showAlarmPanel
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 18,
      ),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
    );

    if (expanded) {
      return SizedBox(width: double.infinity, child: btn);
    }
    return btn;
  }

  Widget _hideButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // ← жижигхэн булан
        boxShadow: const [
          BoxShadow(blurRadius: 6, offset: Offset(0, 3), color: Colors.black12),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.menu, size: 18),
        onPressed: () {
          setState(() {
            _showAlarmPanel = !_showAlarmPanel;
          });
        },
        padding: const EdgeInsets.all(8),
        splashRadius: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шинэ яармаг'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _hideButton(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(8.0)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Зүүн талын 3D
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 12,
                            offset: Offset(0, 6),
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: const ModelViewer(
                        src: 'assets/3d/sensor.glb',
                        alt: 'Ус мэдрэгч',
                        ar: true,
                        // cameraControls: false,
                        autoRotate: false,
                        cameraOrbit: '0deg 20deg 65%',
                        fieldOfView: '25deg',
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  if (_showAlarmPanel)
                    SizedBox(width: 250, child: _buildAlarmList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
