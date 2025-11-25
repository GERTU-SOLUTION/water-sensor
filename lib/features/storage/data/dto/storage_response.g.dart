// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageResponseImpl _$$StorageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StorageResponseImpl(
      id: (json['ID'] as num).toInt(),
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
      deletedAt: json['DeletedAt'] as String?,
      storageCode: json['storage_code'] as String,
      storageName: json['storage_name'] as String,
      sensorStatus: json['sensor_status'] as bool,
    );

Map<String, dynamic> _$$StorageResponseImplToJson(
        _$StorageResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'storage_code': instance.storageCode,
      'storage_name': instance.storageName,
      'sensor_status': instance.sensorStatus,
    };
