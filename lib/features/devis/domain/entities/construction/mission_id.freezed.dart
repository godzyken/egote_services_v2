// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionId _$MissionIdFromJson(Map<String, dynamic> json) {
  return _MissionId.fromJson(json);
}

/// @nodoc
mixin _$MissionId {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionIdCopyWith<MissionId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionIdCopyWith<$Res> {
  factory $MissionIdCopyWith(MissionId value, $Res Function(MissionId) then) =
      _$MissionIdCopyWithImpl<$Res, MissionId>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$MissionIdCopyWithImpl<$Res, $Val extends MissionId>
    implements $MissionIdCopyWith<$Res> {
  _$MissionIdCopyWithImpl(this._value, this._then);

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
abstract class _$$_MissionIdCopyWith<$Res> implements $MissionIdCopyWith<$Res> {
  factory _$$_MissionIdCopyWith(
          _$_MissionId value, $Res Function(_$_MissionId) then) =
      __$$_MissionIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_MissionIdCopyWithImpl<$Res>
    extends _$MissionIdCopyWithImpl<$Res, _$_MissionId>
    implements _$$_MissionIdCopyWith<$Res> {
  __$$_MissionIdCopyWithImpl(
      _$_MissionId _value, $Res Function(_$_MissionId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_MissionId(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MissionId with DiagnosticableTreeMixin implements _MissionId {
  const _$_MissionId({required this.id});

  factory _$_MissionId.fromJson(Map<String, dynamic> json) =>
      _$$_MissionIdFromJson(json);

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MissionId(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MissionId'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionId &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionIdCopyWith<_$_MissionId> get copyWith =>
      __$$_MissionIdCopyWithImpl<_$_MissionId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionIdToJson(
      this,
    );
  }
}

abstract class _MissionId implements MissionId {
  const factory _MissionId({required final int id}) = _$_MissionId;

  factory _MissionId.fromJson(Map<String, dynamic> json) =
      _$_MissionId.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_MissionIdCopyWith<_$_MissionId> get copyWith =>
      throw _privateConstructorUsedError;
}
