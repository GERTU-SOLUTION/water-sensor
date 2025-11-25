// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateStorageRequest _$UpdateStorageRequestFromJson(Map<String, dynamic> json) {
  return _UpdateStorageRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateStorageRequest {
  @JsonKey(name: 'storage_code')
  String get storageCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_name')
  String? get storageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sensor_status')
  bool? get sensorStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStorageRequestCopyWith<UpdateStorageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStorageRequestCopyWith<$Res> {
  factory $UpdateStorageRequestCopyWith(UpdateStorageRequest value,
          $Res Function(UpdateStorageRequest) then) =
      _$UpdateStorageRequestCopyWithImpl<$Res, UpdateStorageRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'storage_code') String storageCode,
      @JsonKey(name: 'storage_name') String? storageName,
      @JsonKey(name: 'sensor_status') bool? sensorStatus});
}

/// @nodoc
class _$UpdateStorageRequestCopyWithImpl<$Res,
        $Val extends UpdateStorageRequest>
    implements $UpdateStorageRequestCopyWith<$Res> {
  _$UpdateStorageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageCode = null,
    Object? storageName = freezed,
    Object? sensorStatus = freezed,
  }) {
    return _then(_value.copyWith(
      storageCode: null == storageCode
          ? _value.storageCode
          : storageCode // ignore: cast_nullable_to_non_nullable
              as String,
      storageName: freezed == storageName
          ? _value.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorStatus: freezed == sensorStatus
          ? _value.sensorStatus
          : sensorStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStorageRequestImplCopyWith<$Res>
    implements $UpdateStorageRequestCopyWith<$Res> {
  factory _$$UpdateStorageRequestImplCopyWith(_$UpdateStorageRequestImpl value,
          $Res Function(_$UpdateStorageRequestImpl) then) =
      __$$UpdateStorageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'storage_code') String storageCode,
      @JsonKey(name: 'storage_name') String? storageName,
      @JsonKey(name: 'sensor_status') bool? sensorStatus});
}

/// @nodoc
class __$$UpdateStorageRequestImplCopyWithImpl<$Res>
    extends _$UpdateStorageRequestCopyWithImpl<$Res, _$UpdateStorageRequestImpl>
    implements _$$UpdateStorageRequestImplCopyWith<$Res> {
  __$$UpdateStorageRequestImplCopyWithImpl(_$UpdateStorageRequestImpl _value,
      $Res Function(_$UpdateStorageRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageCode = null,
    Object? storageName = freezed,
    Object? sensorStatus = freezed,
  }) {
    return _then(_$UpdateStorageRequestImpl(
      storageCode: null == storageCode
          ? _value.storageCode
          : storageCode // ignore: cast_nullable_to_non_nullable
              as String,
      storageName: freezed == storageName
          ? _value.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorStatus: freezed == sensorStatus
          ? _value.sensorStatus
          : sensorStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateStorageRequestImpl implements _UpdateStorageRequest {
  const _$UpdateStorageRequestImpl(
      {@JsonKey(name: 'storage_code') required this.storageCode,
      @JsonKey(name: 'storage_name') this.storageName,
      @JsonKey(name: 'sensor_status') this.sensorStatus});

  factory _$UpdateStorageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateStorageRequestImplFromJson(json);

  @override
  @JsonKey(name: 'storage_code')
  final String storageCode;
  @override
  @JsonKey(name: 'storage_name')
  final String? storageName;
  @override
  @JsonKey(name: 'sensor_status')
  final bool? sensorStatus;

  @override
  String toString() {
    return 'UpdateStorageRequest(storageCode: $storageCode, storageName: $storageName, sensorStatus: $sensorStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStorageRequestImpl &&
            (identical(other.storageCode, storageCode) ||
                other.storageCode == storageCode) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName) &&
            (identical(other.sensorStatus, sensorStatus) ||
                other.sensorStatus == sensorStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, storageCode, storageName, sensorStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStorageRequestImplCopyWith<_$UpdateStorageRequestImpl>
      get copyWith =>
          __$$UpdateStorageRequestImplCopyWithImpl<_$UpdateStorageRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStorageRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateStorageRequest implements UpdateStorageRequest {
  const factory _UpdateStorageRequest(
          {@JsonKey(name: 'storage_code') required final String storageCode,
          @JsonKey(name: 'storage_name') final String? storageName,
          @JsonKey(name: 'sensor_status') final bool? sensorStatus}) =
      _$UpdateStorageRequestImpl;

  factory _UpdateStorageRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateStorageRequestImpl.fromJson;

  @override
  @JsonKey(name: 'storage_code')
  String get storageCode;
  @override
  @JsonKey(name: 'storage_name')
  String? get storageName;
  @override
  @JsonKey(name: 'sensor_status')
  bool? get sensorStatus;
  @override
  @JsonKey(ignore: true)
  _$$UpdateStorageRequestImplCopyWith<_$UpdateStorageRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StorageListRequest _$StorageListRequestFromJson(Map<String, dynamic> json) {
  return _StorageListRequest.fromJson(json);
}

/// @nodoc
mixin _$StorageListRequest {
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageListRequestCopyWith<StorageListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageListRequestCopyWith<$Res> {
  factory $StorageListRequestCopyWith(
          StorageListRequest value, $Res Function(StorageListRequest) then) =
      _$StorageListRequestCopyWithImpl<$Res, StorageListRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page, @JsonKey(name: 'limit') int limit});
}

/// @nodoc
class _$StorageListRequestCopyWithImpl<$Res, $Val extends StorageListRequest>
    implements $StorageListRequestCopyWith<$Res> {
  _$StorageListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageListRequestImplCopyWith<$Res>
    implements $StorageListRequestCopyWith<$Res> {
  factory _$$StorageListRequestImplCopyWith(_$StorageListRequestImpl value,
          $Res Function(_$StorageListRequestImpl) then) =
      __$$StorageListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page, @JsonKey(name: 'limit') int limit});
}

/// @nodoc
class __$$StorageListRequestImplCopyWithImpl<$Res>
    extends _$StorageListRequestCopyWithImpl<$Res, _$StorageListRequestImpl>
    implements _$$StorageListRequestImplCopyWith<$Res> {
  __$$StorageListRequestImplCopyWithImpl(_$StorageListRequestImpl _value,
      $Res Function(_$StorageListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$StorageListRequestImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageListRequestImpl implements _StorageListRequest {
  const _$StorageListRequestImpl(
      {@JsonKey(name: 'page') this.page = 1,
      @JsonKey(name: 'limit') this.limit = 10});

  factory _$StorageListRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageListRequestImplFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'limit')
  final int limit;

  @override
  String toString() {
    return 'StorageListRequest(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageListRequestImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageListRequestImplCopyWith<_$StorageListRequestImpl> get copyWith =>
      __$$StorageListRequestImplCopyWithImpl<_$StorageListRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageListRequestImplToJson(
      this,
    );
  }
}

abstract class _StorageListRequest implements StorageListRequest {
  const factory _StorageListRequest(
      {@JsonKey(name: 'page') final int page,
      @JsonKey(name: 'limit') final int limit}) = _$StorageListRequestImpl;

  factory _StorageListRequest.fromJson(Map<String, dynamic> json) =
      _$StorageListRequestImpl.fromJson;

  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'limit')
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$StorageListRequestImplCopyWith<_$StorageListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
