// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateStorageRequestImpl _$$UpdateStorageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateStorageRequestImpl(
      storageCode: json['storage_code'] as String,
      storageName: json['storage_name'] as String?,
      sensorStatus: json['sensor_status'] as bool?,
    );

Map<String, dynamic> _$$UpdateStorageRequestImplToJson(
        _$UpdateStorageRequestImpl instance) =>
    <String, dynamic>{
      'storage_code': instance.storageCode,
      'storage_name': instance.storageName,
      'sensor_status': instance.sensorStatus,
    };

_$StorageListRequestImpl _$$StorageListRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StorageListRequestImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$StorageListRequestImplToJson(
        _$StorageListRequestImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
