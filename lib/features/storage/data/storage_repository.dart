import '../../../core/network/common_response.dart';
import 'data_source.dart';
import 'dto/storage_request.dart';
import 'dto/storage_response.dart';

class StorageRepository {
  final StorageDataSource _dataSource;

  StorageRepository(this._dataSource);

  Future<List<StorageResponse>> getStorages({
    int page = 1,
    int limit = 20,
  }) async {
    final req = StorageListRequest(page: page, limit: limit);
    final res = await _dataSource.getStorages(req);

    // Backend чинь:
    // { status, message, data: { items: [...], page, limit, total } }
    final data = res.data as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>;

    return items
        .map((e) => StorageResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<StorageResponse> updateStorage(UpdateStorageRequest req) async {
    final res = await _dataSource.updateStorage(req);
    final data = res.data as Map<String, dynamic>;
    return StorageResponse.fromJson(data);
  }

  Future<StorageResponse> createStorage({
    required String storageCode,
    required String storageName,
    required bool sensorStatus,
  }) async {
    final res = await _dataSource.createStorage(
      storageCode: storageCode,
      storageName: storageName,
      sensorStatus: sensorStatus,
    );
    final data = res.data as Map<String, dynamic>;
    return StorageResponse.fromJson(data);
  }
}
