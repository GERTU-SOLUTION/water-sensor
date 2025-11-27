import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;
  ApiService() {
    // const base = 'http://localhost:3000/api';
    const base = 'https://sensor.gertu.mn:5000/api';
    _dio = Dio(
      BaseOptions(baseUrl: base, headers: {"Content-Type": "application/json"}),
    );
    print('🔗 API baseUrl = $base');
  }
  Future<void> updateStorageStatus(String storageCode, bool status) async {
    try {
      final body = {
        "storage_code": storageCode,
        "sensor_status": status,
        "storage_name": storageCode,
      };

      print('✅ status=${storageCode} body=${status}');

      await _dio.put("/storages/update", data: body);
    } catch (e) {
      print("❌ API update error: $e");
    }
  }
}

final apiService = ApiService();
