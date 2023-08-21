// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travaux_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravauxEntityStates _$TravauxEntityStatesFromJson(Map<String, dynamic> json) {
  return _TravauxEntityStates.fromJson(json);
}

/// @nodoc
mixin _$TravauxEntityStates {
  List<TravauxEntity> get travaux => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravauxEntityStatesCopyWith<TravauxEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravauxEntityStatesCopyWith<$Res> {
  factory $TravauxEntityStatesCopyWith(
          TravauxEntityStates value, $Res Function(TravauxEntityStates) then) =
      _$TravauxEntityStatesCopyWithImpl<$Res, TravauxEntityStates>;
  @useResult
  $Res call({List<TravauxEntity> travaux});
}

/// @nodoc
class _$TravauxEntityStatesCopyWithImpl<$Res, $Val extends TravauxEntityStates>
    implements $TravauxEntityStatesCopyWith<$Res> {
  _$TravauxEntityStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travaux = null,
  }) {
    return _then(_value.copyWith(
      travaux: null == travaux
          ? _value.travaux
          : travaux // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravauxEntityStatesCopyWith<$Res>
    implements $TravauxEntityStatesCopyWith<$Res> {
  factory _$$_TravauxEntityStatesCopyWith(_$_TravauxEntityStates value,
          $Res Function(_$_TravauxEntityStates) then) =
      __$$_TravauxEntityStatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravauxEntity> travaux});
}

/// @nodoc
class __$$_TravauxEntityStatesCopyWithImpl<$Res>
    extends _$TravauxEntityStatesCopyWithImpl<$Res, _$_TravauxEntityStates>
    implements _$$_TravauxEntityStatesCopyWith<$Res> {
  __$$_TravauxEntityStatesCopyWithImpl(_$_TravauxEntityStates _value,
      $Res Function(_$_TravauxEntityStates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travaux = null,
  }) {
    return _then(_$_TravauxEntityStates(
      travaux: null == travaux
          ? _value._travaux
          : travaux // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_TravauxEntityStates
    with DiagnosticableTreeMixin
    implements _TravauxEntityStates {
  const _$_TravauxEntityStates({required final List<TravauxEntity> travaux})
      : _travaux = travaux;

  factory _$_TravauxEntityStates.fromJson(Map<String, dynamic> json) =>
      _$$_TravauxEntityStatesFromJson(json);

  final List<TravauxEntity> _travaux;
  @override
  List<TravauxEntity> get travaux {
    if (_travaux is EqualUnmodifiableListView) return _travaux;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travaux);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntityStates(travaux: $travaux)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntityStates'))
      ..add(DiagnosticsProperty('travaux', travaux));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravauxEntityStates &&
            const DeepCollectionEquality().equals(other._travaux, _travaux));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_travaux));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravauxEntityStatesCopyWith<_$_TravauxEntityStates> get copyWith =>
      __$$_TravauxEntityStatesCopyWithImpl<_$_TravauxEntityStates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravauxEntityStatesToJson(
      this,
    );
  }
}

abstract class _TravauxEntityStates implements TravauxEntityStates {
  const factory _TravauxEntityStates(
      {required final List<TravauxEntity> travaux}) = _$_TravauxEntityStates;

  factory _TravauxEntityStates.fromJson(Map<String, dynamic> json) =
      _$_TravauxEntityStates.fromJson;

  @override
  List<TravauxEntity> get travaux;
  @override
  @JsonKey(ignore: true)
  _$$_TravauxEntityStatesCopyWith<_$_TravauxEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}
