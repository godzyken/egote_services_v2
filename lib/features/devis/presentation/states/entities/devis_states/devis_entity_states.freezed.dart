// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DevisEntityStates _$DevisEntityStatesFromJson(Map<String, dynamic> json) {
  return _DevisEntityStates.fromJson(json);
}

/// @nodoc
mixin _$DevisEntityStates {
  List<DevisModelEntity> get devis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevisEntityStatesCopyWith<DevisEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisEntityStatesCopyWith<$Res> {
  factory $DevisEntityStatesCopyWith(
          DevisEntityStates value, $Res Function(DevisEntityStates) then) =
      _$DevisEntityStatesCopyWithImpl<$Res, DevisEntityStates>;
  @useResult
  $Res call({List<DevisModelEntity> devis});
}

/// @nodoc
class _$DevisEntityStatesCopyWithImpl<$Res, $Val extends DevisEntityStates>
    implements $DevisEntityStatesCopyWith<$Res> {
  _$DevisEntityStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devis = null,
  }) {
    return _then(_value.copyWith(
      devis: null == devis
          ? _value.devis
          : devis // ignore: cast_nullable_to_non_nullable
              as List<DevisModelEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DevisEntityStatesCopyWith<$Res>
    implements $DevisEntityStatesCopyWith<$Res> {
  factory _$$_DevisEntityStatesCopyWith(_$_DevisEntityStates value,
          $Res Function(_$_DevisEntityStates) then) =
      __$$_DevisEntityStatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DevisModelEntity> devis});
}

/// @nodoc
class __$$_DevisEntityStatesCopyWithImpl<$Res>
    extends _$DevisEntityStatesCopyWithImpl<$Res, _$_DevisEntityStates>
    implements _$$_DevisEntityStatesCopyWith<$Res> {
  __$$_DevisEntityStatesCopyWithImpl(
      _$_DevisEntityStates _value, $Res Function(_$_DevisEntityStates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devis = null,
  }) {
    return _then(_$_DevisEntityStates(
      devis: null == devis
          ? _value._devis
          : devis // ignore: cast_nullable_to_non_nullable
              as List<DevisModelEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_DevisEntityStates
    with DiagnosticableTreeMixin
    implements _DevisEntityStates {
  const _$_DevisEntityStates({required final List<DevisModelEntity> devis})
      : _devis = devis;

  factory _$_DevisEntityStates.fromJson(Map<String, dynamic> json) =>
      _$$_DevisEntityStatesFromJson(json);

  final List<DevisModelEntity> _devis;
  @override
  List<DevisModelEntity> get devis {
    if (_devis is EqualUnmodifiableListView) return _devis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devis);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisEntityStates(devis: $devis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DevisEntityStates'))
      ..add(DiagnosticsProperty('devis', devis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevisEntityStates &&
            const DeepCollectionEquality().equals(other._devis, _devis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devis));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DevisEntityStatesCopyWith<_$_DevisEntityStates> get copyWith =>
      __$$_DevisEntityStatesCopyWithImpl<_$_DevisEntityStates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevisEntityStatesToJson(
      this,
    );
  }
}

abstract class _DevisEntityStates implements DevisEntityStates {
  const factory _DevisEntityStates(
      {required final List<DevisModelEntity> devis}) = _$_DevisEntityStates;

  factory _DevisEntityStates.fromJson(Map<String, dynamic> json) =
      _$_DevisEntityStates.fromJson;

  @override
  List<DevisModelEntity> get devis;
  @override
  @JsonKey(ignore: true)
  _$$_DevisEntityStatesCopyWith<_$_DevisEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}
