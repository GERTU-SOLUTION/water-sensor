// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageResponse _$StorageResponseFromJson(Map<String, dynamic> json) {
  return _StorageResponse.fromJson(json);
}

/// @nodoc
mixin _$StorageResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeletedAt')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_code')
  String get storageCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_name')
  String get storageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sensor_status')
  bool get sensorStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageResponseCopyWith<StorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageResponseCopyWith<$Res> {
  factory $StorageResponseCopyWith(
          StorageResponse value, $Res Function(StorageResponse) then) =
      _$StorageResponseCopyWithImpl<$Res, StorageResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CreatedAt') String createdAt,
      @JsonKey(name: 'UpdatedAt') String updatedAt,
      @JsonKey(name: 'DeletedAt') String? deletedAt,
      @JsonKey(name: 'storage_code') String storageCode,
      @JsonKey(name: 'storage_name') String storageName,
      @JsonKey(name: 'sensor_status') bool sensorStatus});
}

/// @nodoc
class _$StorageResponseCopyWithImpl<$Res, $Val extends StorageResponse>
    implements $StorageResponseCopyWith<$Res> {
  _$StorageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? storageCode = null,
    Object? storageName = null,
    Object? sensorStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      storageCode: null == storageCode
          ? _value.storageCode
          : storageCode // ignore: cast_nullable_to_non_nullable
              as String,
      storageName: null == storageName
          ? _value.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String,
      sensorStatus: null == sensorStatus
          ? _value.sensorStatus
          : sensorStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageResponseImplCopyWith<$Res>
    implements $StorageResponseCopyWith<$Res> {
  factory _$$StorageResponseImplCopyWith(_$StorageResponseImpl value,
          $Res Function(_$StorageResponseImpl) then) =
      __$$StorageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CreatedAt') String createdAt,
      @JsonKey(name: 'UpdatedAt') String updatedAt,
      @JsonKey(name: 'DeletedAt') String? deletedAt,
      @JsonKey(name: 'storage_code') String storageCode,
      @JsonKey(name: 'storage_name') String storageName,
      @JsonKey(name: 'sensor_status') bool sensorStatus});
}

/// @nodoc
class __$$StorageResponseImplCopyWithImpl<$Res>
    extends _$StorageResponseCopyWithImpl<$Res, _$StorageResponseImpl>
    implements _$$StorageResponseImplCopyWith<$Res> {
  __$$StorageResponseImplCopyWithImpl(
      _$StorageResponseImpl _value, $Res Function(_$StorageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? storageCode = null,
    Object? storageName = null,
    Object? sensorStatus = null,
  }) {
    return _then(_$StorageResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      storageCode: null == storageCode
          ? _value.storageCode
          : storageCode // ignore: cast_nullable_to_non_nullable
              as String,
      storageName: null == storageName
          ? _value.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String,
      sensorStatus: null == sensorStatus
          ? _value.sensorStatus
          : sensorStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageResponseImpl implements _StorageResponse {
  const _$StorageResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CreatedAt') required this.createdAt,
      @JsonKey(name: 'UpdatedAt') required this.updatedAt,
      @JsonKey(name: 'DeletedAt') this.deletedAt,
      @JsonKey(name: 'storage_code') required this.storageCode,
      @JsonKey(name: 'storage_name') required this.storageName,
      @JsonKey(name: 'sensor_status') required this.sensorStatus});

  factory _$StorageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CreatedAt')
  final String createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  final String updatedAt;
  @override
  @JsonKey(name: 'DeletedAt')
  final String? deletedAt;
  @override
  @JsonKey(name: 'storage_code')
  final String storageCode;
  @override
  @JsonKey(name: 'storage_name')
  final String storageName;
  @override
  @JsonKey(name: 'sensor_status')
  final bool sensorStatus;

  @override
  String toString() {
    return 'StorageResponse(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, storageCode: $storageCode, storageName: $storageName, sensorStatus: $sensorStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.storageCode, storageCode) ||
                other.storageCode == storageCode) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName) &&
            (identical(other.sensorStatus, sensorStatus) ||
                other.sensorStatus == sensorStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      deletedAt, storageCode, storageName, sensorStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageResponseImplCopyWith<_$StorageResponseImpl> get copyWith =>
      __$$StorageResponseImplCopyWithImpl<_$StorageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageResponseImplToJson(
      this,
    );
  }
}

abstract class _StorageResponse implements StorageResponse {
  const factory _StorageResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CreatedAt') required final String createdAt,
          @JsonKey(name: 'UpdatedAt') required final String updatedAt,
          @JsonKey(name: 'DeletedAt') final String? deletedAt,
          @JsonKey(name: 'storage_code') required final String storageCode,
          @JsonKey(name: 'storage_name') required final String storageName,
          @JsonKey(name: 'sensor_status') required final bool sensorStatus}) =
      _$StorageResponseImpl;

  factory _StorageResponse.fromJson(Map<String, dynamic> json) =
      _$StorageResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CreatedAt')
  String get createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  String get updatedAt;
  @override
  @JsonKey(name: 'DeletedAt')
  String? get deletedAt;
  @override
  @JsonKey(name: 'storage_code')
  String get storageCode;
  @override
  @JsonKey(name: 'storage_name')
  String get storageName;
  @override
  @JsonKey(name: 'sensor_status')
  bool get sensorStatus;
  @override
  @JsonKey(ignore: true)
  _$$StorageResponseImplCopyWith<_$StorageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
