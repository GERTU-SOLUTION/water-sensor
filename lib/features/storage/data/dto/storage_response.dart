import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_response.freezed.dart';
part 'storage_response.g.dart';

@freezed
class StorageResponse with _$StorageResponse {
  const factory StorageResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CreatedAt') required String createdAt,
    @JsonKey(name: 'UpdatedAt') required String updatedAt,
    @JsonKey(name: 'DeletedAt') String? deletedAt,
    @JsonKey(name: 'storage_code') required String storageCode,
    @JsonKey(name: 'storage_name') required String storageName,
    @JsonKey(name: 'sensor_status') required bool sensorStatus,
  }) = _StorageResponse;

  factory StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseFromJson(json);
}
