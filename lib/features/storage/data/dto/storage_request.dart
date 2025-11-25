import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_request.freezed.dart';
part 'storage_request.g.dart';

@freezed
class UpdateStorageRequest with _$UpdateStorageRequest {
  const factory UpdateStorageRequest({
    @JsonKey(name: 'storage_code') required String storageCode,
    @JsonKey(name: 'storage_name') String? storageName,
    @JsonKey(name: 'sensor_status') bool? sensorStatus,
  }) = _UpdateStorageRequest;

  factory UpdateStorageRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateStorageRequestFromJson(json);
}

@freezed
class StorageListRequest with _$StorageListRequest {
  const factory StorageListRequest({
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'limit') @Default(10) int limit,
  }) = _StorageListRequest;

  factory StorageListRequest.fromJson(Map<String, dynamic> json) =>
      _$StorageListRequestFromJson(json);
}
