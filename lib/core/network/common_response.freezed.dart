// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return _CommonResponse.fromJson(json);
}

/// @nodoc
mixin _$CommonResponse {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonResponseCopyWith<CommonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResponseCopyWith<$Res> {
  factory $CommonResponseCopyWith(
          CommonResponse value, $Res Function(CommonResponse) then) =
      _$CommonResponseCopyWithImpl<$Res, CommonResponse>;
  @useResult
  $Res call({int status, String message, dynamic data});
}

/// @nodoc
class _$CommonResponseCopyWithImpl<$Res, $Val extends CommonResponse>
    implements $CommonResponseCopyWith<$Res> {
  _$CommonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonResponseImplCopyWith<$Res>
    implements $CommonResponseCopyWith<$Res> {
  factory _$$CommonResponseImplCopyWith(_$CommonResponseImpl value,
          $Res Function(_$CommonResponseImpl) then) =
      __$$CommonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String message, dynamic data});
}

/// @nodoc
class __$$CommonResponseImplCopyWithImpl<$Res>
    extends _$CommonResponseCopyWithImpl<$Res, _$CommonResponseImpl>
    implements _$$CommonResponseImplCopyWith<$Res> {
  __$$CommonResponseImplCopyWithImpl(
      _$CommonResponseImpl _value, $Res Function(_$CommonResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$CommonResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonResponseImpl implements _CommonResponse {
  const _$CommonResponseImpl(
      {required this.status, required this.message, required this.data});

  factory _$CommonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonResponseImplFromJson(json);

  @override
  final int status;
  @override
  final String message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'CommonResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonResponseImplCopyWith<_$CommonResponseImpl> get copyWith =>
      __$$CommonResponseImplCopyWithImpl<_$CommonResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonResponseImplToJson(
      this,
    );
  }
}

abstract class _CommonResponse implements CommonResponse {
  const factory _CommonResponse(
      {required final int status,
      required final String message,
      required final dynamic data}) = _$CommonResponseImpl;

  factory _CommonResponse.fromJson(Map<String, dynamic> json) =
      _$CommonResponseImpl.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$CommonResponseImplCopyWith<_$CommonResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
