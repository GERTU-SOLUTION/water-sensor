// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonResponseImpl _$$CommonResponseImplFromJson(Map<String, dynamic> json) =>
    _$CommonResponseImpl(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$CommonResponseImplToJson(
        _$CommonResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
