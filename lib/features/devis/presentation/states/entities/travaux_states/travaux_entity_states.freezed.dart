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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$TravauxEntityStatesImplCopyWith<$Res>
    implements $TravauxEntityStatesCopyWith<$Res> {
  factory _$$TravauxEntityStatesImplCopyWith(_$TravauxEntityStatesImpl value,
          $Res Function(_$TravauxEntityStatesImpl) then) =
      __$$TravauxEntityStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravauxEntity> travaux});
}

/// @nodoc
class __$$TravauxEntityStatesImplCopyWithImpl<$Res>
    extends _$TravauxEntityStatesCopyWithImpl<$Res, _$TravauxEntityStatesImpl>
    implements _$$TravauxEntityStatesImplCopyWith<$Res> {
  __$$TravauxEntityStatesImplCopyWithImpl(_$TravauxEntityStatesImpl _value,
      $Res Function(_$TravauxEntityStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travaux = null,
  }) {
    return _then(_$TravauxEntityStatesImpl(
      travaux: null == travaux
          ? _value._travaux
          : travaux // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$TravauxEntityStatesImpl
    with DiagnosticableTreeMixin
    implements _TravauxEntityStates {
  const _$TravauxEntityStatesImpl({required final List<TravauxEntity> travaux})
      : _travaux = travaux;

  factory _$TravauxEntityStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravauxEntityStatesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravauxEntityStatesImpl &&
            const DeepCollectionEquality().equals(other._travaux, _travaux));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_travaux));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravauxEntityStatesImplCopyWith<_$TravauxEntityStatesImpl> get copyWith =>
      __$$TravauxEntityStatesImplCopyWithImpl<_$TravauxEntityStatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravauxEntityStatesImplToJson(
      this,
    );
  }
}

abstract class _TravauxEntityStates implements TravauxEntityStates {
  const factory _TravauxEntityStates(
      {required final List<TravauxEntity> travaux}) = _$TravauxEntityStatesImpl;

  factory _TravauxEntityStates.fromJson(Map<String, dynamic> json) =
      _$TravauxEntityStatesImpl.fromJson;

  @override
  List<TravauxEntity> get travaux;
  @override
  @JsonKey(ignore: true)
  _$$TravauxEntityStatesImplCopyWith<_$TravauxEntityStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
