import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:typed_data/typed_buffers.dart';

const String brokerHost = '103.50.205.187';
const int wsPort = 9001;

class MqttService {
  late final MqttBrowserClient client;

  final _messagesController = StreamController<AppMqttMessage>.broadcast();
  Stream<AppMqttMessage> get messages => _messagesController.stream;

  bool _listeningUpdates = false;

  bool get isConnected =>
      client.connectionStatus?.state == MqttConnectionState.connected;

  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>? _updatesSub;

  MqttService() {
    if (!kIsWeb) {
      throw Exception('Энэ MqttService зөвхөн Flutter Web-д зориулагдсан');
    }

    client = MqttBrowserClient(
      'ws://$brokerHost',
      'flutter_web_${DateTime.now().millisecondsSinceEpoch}',
    );

    client.port = wsPort;
    client.websocketProtocols = MqttClientConstants.protocolsSingleDefault;
    client.keepAlivePeriod = 30;
    // client.logging(on: true);

    final connMsg = MqttConnectMessage()
        .withClientIdentifier(client.clientIdentifier ?? 'flutter_web_client')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce)
        .authenticateAs('sensor01', 'gertu123');

    client.connectionMessage = connMsg;

    client.onConnected = () =>
        print('✅ MQTT onConnected, status=${client.connectionStatus}');
    client.onDisconnected = () =>
        print('⚠️ MQTT onDisconnected, status=${client.connectionStatus}');
  }

  Future<void> connect() async {
    if (isConnected) {
      print('ℹ️ already connected');
      return;
    }

    print('MQTT: connecting to ws://$brokerHost:$wsPort ...');

    try {
      await client.connect();

      if (!isConnected) {
        print('❌ MQTT failed: ${client.connectionStatus}');
        return;
      }

      print('✅ MQTT connected: ${client.connectionStatus}');

      // updates.listen-ийяг нэг л удаа бүртгэнэ
      if (!_listeningUpdates) {
        _listeningUpdates = true;

        _updatesSub = client.updates?.listen(
          (events) {
            if (events.isEmpty) return;

            for (final rec in events) {
              final msg = rec.payload;
              if (msg is! MqttPublishMessage) continue;

              // Uint8Buffer -> Uint8List
              final bytes = Uint8List.fromList(msg.payload.message);

              // mosquitto_sub -F '%x' шиг HEX (space-тай)
              final hexSpaced = bytes
                  .map((b) => b.toRadixString(16).padLeft(2, '0'))
                  .join(' ')
                  .toUpperCase();

              print('📩 RX topic=${rec.topic}');
              print('    HEX: $hexSpaced');

              _messagesController.add(
                AppMqttMessage(topic: rec.topic, hex: hexSpaced),
              );
            }
          },
          onError: (Object error, StackTrace st) {
            print('⚠️ MQTT updates error: $error');
          },
          onDone: () {
            print('ℹ️ MQTT updates stream closed');
            _listeningUpdates = false;
          },
          cancelOnError: false,
        );
      }
    } on NoConnectionException catch (e) {
      print('❌ NoConnectionException: $e');
      client.disconnect();
    } on Exception catch (e) {
      print('❌ Connect error: $e');
      client.disconnect();
    }
  }

  void subscribe(String topic, {MqttQos qos = MqttQos.atLeastOnce}) {
    if (!isConnected) {
      print('⚠️ subscribe() called while disconnected');
      return;
    }
    print('🔔 Subscribing to $topic ...');
    client.subscribe(topic, qos);
  }

  void publishHex(
    String topic,
    String hex, {
    MqttQos qos = MqttQos.atLeastOnce,
  }) {
    if (!isConnected) {
      print('⚠️ publishHex() called while disconnected');
      return;
    }
    final bytes = hexToBytes(hex);
    final Uint8Buffer buffer = Uint8Buffer()..addAll(bytes);

    final builder = MqttClientPayloadBuilder()..addBuffer(buffer);
    client.publishMessage(topic, qos, builder.payload!);

    final hexLog = bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join(' ')
        .toUpperCase();
    print('📤 TX $topic [${bytes.length}B]: $hexLog');
  }

  void disconnect() {
    if (!isConnected) return;
    client.disconnect();
  }

  void dispose() {
    _messagesController.close();
    if (isConnected) client.disconnect();
  }

  Uint8List hexToBytes(String hex) {
    var s = hex.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');
    if (s.length.isOdd) {
      throw FormatException('HEX string length must be even: $s');
    }
    final bytes = <int>[];
    for (var i = 0; i < s.length; i += 2) {
      bytes.add(int.parse(s.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(bytes);
  }
}

class AppMqttMessage {
  final String topic;
  final String hex;

  const AppMqttMessage({required this.topic, required this.hex});
}
