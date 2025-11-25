import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/network/common_response.dart';
import 'dto/storage_request.dart';
import 'dto/storage_response.dart';

final storageDataSourceProvider = Provider<StorageDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return StorageDataSource(dio);
});

class StorageDataSource {
  final Dio _dio;

  StorageDataSource(this._dio);

  /// POST /api/storages – шинээр үүсгэх
  Future<CommonResponse> createStorage({
    required String storageCode,
    required String storageName,
    required bool sensorStatus,
  }) async {
    final body = {
      'storage_code': storageCode,
      'storage_name': storageName,
      'sensor_status': sensorStatus,
    };

    final res = await _dio.post('/storages', data: body);
    return CommonResponse.fromJson(res.data as Map<String, dynamic>);
  }

  /// GET /api/storages/list?page=&limit=
  Future<CommonResponse> getStorages(StorageListRequest request) async {
    final res = await _dio.get(
      '/storages/list',
      queryParameters: request.toJson(),
    );
    return CommonResponse.fromJson(res.data as Map<String, dynamic>);
  }

  /// PUT /api/storages/update
  Future<CommonResponse> updateStorage(UpdateStorageRequest request) async {
    final res = await _dio.put('/storages/update', data: request.toJson());
    return CommonResponse.fromJson(res.data as Map<String, dynamic>);
  }
}
