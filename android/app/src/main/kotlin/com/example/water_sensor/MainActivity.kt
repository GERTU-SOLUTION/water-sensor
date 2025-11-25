mosquitto_sub -h 127.0.0.1 -p 1883 -u admin -P '123' -t 'sensors/#' -v
package com.example.water_sensor

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
