// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionEntityStates _$MissionEntityStatesFromJson(Map<String, dynamic> json) {
  return _MissionEntityStates.fromJson(json);
}

/// @nodoc
mixin _$MissionEntityStates {
  List<MissionEntity> get missionEntities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionEntityStatesCopyWith<MissionEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionEntityStatesCopyWith<$Res> {
  factory $MissionEntityStatesCopyWith(
          MissionEntityStates value, $Res Function(MissionEntityStates) then) =
      _$MissionEntityStatesCopyWithImpl<$Res, MissionEntityStates>;
  @useResult
  $Res call({List<MissionEntity> missionEntities});
}

/// @nodoc
class _$MissionEntityStatesCopyWithImpl<$Res, $Val extends MissionEntityStates>
    implements $MissionEntityStatesCopyWith<$Res> {
  _$MissionEntityStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionEntities = null,
  }) {
    return _then(_value.copyWith(
      missionEntities: null == missionEntities
          ? _value.missionEntities
          : missionEntities // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionEntityStatesCopyWith<$Res>
    implements $MissionEntityStatesCopyWith<$Res> {
  factory _$$_MissionEntityStatesCopyWith(_$_MissionEntityStates value,
          $Res Function(_$_MissionEntityStates) then) =
      __$$_MissionEntityStatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MissionEntity> missionEntities});
}

/// @nodoc
class __$$_MissionEntityStatesCopyWithImpl<$Res>
    extends _$MissionEntityStatesCopyWithImpl<$Res, _$_MissionEntityStates>
    implements _$$_MissionEntityStatesCopyWith<$Res> {
  __$$_MissionEntityStatesCopyWithImpl(_$_MissionEntityStates _value,
      $Res Function(_$_MissionEntityStates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionEntities = null,
  }) {
    return _then(_$_MissionEntityStates(
      missionEntities: null == missionEntities
          ? _value._missionEntities
          : missionEntities // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MissionEntityStates
    with DiagnosticableTreeMixin
    implements _MissionEntityStates {
  const _$_MissionEntityStates(
      {required final List<MissionEntity> missionEntities})
      : _missionEntities = missionEntities;

  factory _$_MissionEntityStates.fromJson(Map<String, dynamic> json) =>
      _$$_MissionEntityStatesFromJson(json);

  final List<MissionEntity> _missionEntities;
  @override
  List<MissionEntity> get missionEntities {
    if (_missionEntities is EqualUnmodifiableListView) return _missionEntities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missionEntities);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MissionEntityStates(missionEntities: $missionEntities)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MissionEntityStates'))
      ..add(DiagnosticsProperty('missionEntities', missionEntities));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionEntityStates &&
            const DeepCollectionEquality()
                .equals(other._missionEntities, _missionEntities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_missionEntities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionEntityStatesCopyWith<_$_MissionEntityStates> get copyWith =>
      __$$_MissionEntityStatesCopyWithImpl<_$_MissionEntityStates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionEntityStatesToJson(
      this,
    );
  }
}

abstract class _MissionEntityStates implements MissionEntityStates {
  const factory _MissionEntityStates(
          {required final List<MissionEntity> missionEntities}) =
      _$_MissionEntityStates;

  factory _MissionEntityStates.fromJson(Map<String, dynamic> json) =
      _$_MissionEntityStates.fromJson;

  @override
  List<MissionEntity> get missionEntities;
  @override
  @JsonKey(ignore: true)
  _$$_MissionEntityStatesCopyWith<_$_MissionEntityStates> get copyWith =>
      throw _privateConstructorUsedError;
}
