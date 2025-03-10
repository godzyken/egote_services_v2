// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomData _$CustomDataFromJson(Map<String, dynamic> json) {
  return _CustomData.fromJson(json);
}

/// @nodoc
mixin _$CustomData {
  String get name => throw _privateConstructorUsedError;
  bool get testing => throw _privateConstructorUsedError;

  /// Serializes this CustomData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomDataCopyWith<CustomData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDataCopyWith<$Res> {
  factory $CustomDataCopyWith(
          CustomData value, $Res Function(CustomData) then) =
      _$CustomDataCopyWithImpl<$Res, CustomData>;
  @useResult
  $Res call({String name, bool testing});
}

/// @nodoc
class _$CustomDataCopyWithImpl<$Res, $Val extends CustomData>
    implements $CustomDataCopyWith<$Res> {
  _$CustomDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? testing = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      testing: null == testing
          ? _value.testing
          : testing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomDataImplCopyWith<$Res>
    implements $CustomDataCopyWith<$Res> {
  factory _$$CustomDataImplCopyWith(
          _$CustomDataImpl value, $Res Function(_$CustomDataImpl) then) =
      __$$CustomDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool testing});
}

/// @nodoc
class __$$CustomDataImplCopyWithImpl<$Res>
    extends _$CustomDataCopyWithImpl<$Res, _$CustomDataImpl>
    implements _$$CustomDataImplCopyWith<$Res> {
  __$$CustomDataImplCopyWithImpl(
      _$CustomDataImpl _value, $Res Function(_$CustomDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? testing = null,
  }) {
    return _then(_$CustomDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      testing: null == testing
          ? _value.testing
          : testing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$CustomDataImpl implements _CustomData {
  const _$CustomDataImpl({required this.name, required this.testing});

  factory _$CustomDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomDataImplFromJson(json);

  @override
  final String name;
  @override
  final bool testing;

  @override
  String toString() {
    return 'CustomData(name: $name, testing: $testing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.testing, testing) || other.testing == testing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, testing);

  /// Create a copy of CustomData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomDataImplCopyWith<_$CustomDataImpl> get copyWith =>
      __$$CustomDataImplCopyWithImpl<_$CustomDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomDataImplToJson(
      this,
    );
  }
}

abstract class _CustomData implements CustomData {
  const factory _CustomData(
      {required final String name,
      required final bool testing}) = _$CustomDataImpl;

  factory _CustomData.fromJson(Map<String, dynamic> json) =
      _$CustomDataImpl.fromJson;

  @override
  String get name;
  @override
  bool get testing;

  /// Create a copy of CustomData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomDataImplCopyWith<_$CustomDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
