// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travau_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravauId _$TravauIdFromJson(Map<String, dynamic> json) {
  return _TravauId.fromJson(json);
}

/// @nodoc
mixin _$TravauId {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravauIdCopyWith<TravauId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravauIdCopyWith<$Res> {
  factory $TravauIdCopyWith(TravauId value, $Res Function(TravauId) then) =
      _$TravauIdCopyWithImpl<$Res, TravauId>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$TravauIdCopyWithImpl<$Res, $Val extends TravauId>
    implements $TravauIdCopyWith<$Res> {
  _$TravauIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravauIdImplCopyWith<$Res>
    implements $TravauIdCopyWith<$Res> {
  factory _$$TravauIdImplCopyWith(
          _$TravauIdImpl value, $Res Function(_$TravauIdImpl) then) =
      __$$TravauIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$TravauIdImplCopyWithImpl<$Res>
    extends _$TravauIdCopyWithImpl<$Res, _$TravauIdImpl>
    implements _$$TravauIdImplCopyWith<$Res> {
  __$$TravauIdImplCopyWithImpl(
      _$TravauIdImpl _value, $Res Function(_$TravauIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$TravauIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravauIdImpl implements _TravauId {
  const _$TravauIdImpl({required this.id});

  factory _$TravauIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravauIdImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'TravauId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravauIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravauIdImplCopyWith<_$TravauIdImpl> get copyWith =>
      __$$TravauIdImplCopyWithImpl<_$TravauIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravauIdImplToJson(
      this,
    );
  }
}

abstract class _TravauId implements TravauId {
  const factory _TravauId({required final int id}) = _$TravauIdImpl;

  factory _TravauId.fromJson(Map<String, dynamic> json) =
      _$TravauIdImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$TravauIdImplCopyWith<_$TravauIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
