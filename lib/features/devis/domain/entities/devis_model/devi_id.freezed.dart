// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devi_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DevisId _$DevisIdFromJson(Map<String, dynamic> json) {
  return _DevisId.fromJson(json);
}

/// @nodoc
mixin _$DevisId {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevisIdCopyWith<DevisId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisIdCopyWith<$Res> {
  factory $DevisIdCopyWith(DevisId value, $Res Function(DevisId) then) =
      _$DevisIdCopyWithImpl<$Res, DevisId>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DevisIdCopyWithImpl<$Res, $Val extends DevisId>
    implements $DevisIdCopyWith<$Res> {
  _$DevisIdCopyWithImpl(this._value, this._then);

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
abstract class _$$_DevisIdCopyWith<$Res> implements $DevisIdCopyWith<$Res> {
  factory _$$_DevisIdCopyWith(
          _$_DevisId value, $Res Function(_$_DevisId) then) =
      __$$_DevisIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_DevisIdCopyWithImpl<$Res>
    extends _$DevisIdCopyWithImpl<$Res, _$_DevisId>
    implements _$$_DevisIdCopyWith<$Res> {
  __$$_DevisIdCopyWithImpl(_$_DevisId _value, $Res Function(_$_DevisId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DevisId(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DevisId with DiagnosticableTreeMixin implements _DevisId {
  const _$_DevisId({required this.id});

  factory _$_DevisId.fromJson(Map<String, dynamic> json) =>
      _$$_DevisIdFromJson(json);

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisId(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DevisId'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevisId &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DevisIdCopyWith<_$_DevisId> get copyWith =>
      __$$_DevisIdCopyWithImpl<_$_DevisId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevisIdToJson(
      this,
    );
  }
}

abstract class _DevisId implements DevisId {
  const factory _DevisId({required final int id}) = _$_DevisId;

  factory _DevisId.fromJson(Map<String, dynamic> json) = _$_DevisId.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DevisIdCopyWith<_$_DevisId> get copyWith =>
      throw _privateConstructorUsedError;
}
