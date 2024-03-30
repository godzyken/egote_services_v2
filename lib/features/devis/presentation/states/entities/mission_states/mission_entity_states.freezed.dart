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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$MissionEntityStatesImplCopyWith<$Res>
    implements $MissionEntityStatesCopyWith<$Res> {
  factory _$$MissionEntityStatesImplCopyWith(_$MissionEntityStatesImpl value,
          $Res Function(_$MissionEntityStatesImpl) then) =
      __$$MissionEntityStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MissionEntity> missionEntities});
}

/// @nodoc
class __$$MissionEntityStatesImplCopyWithImpl<$Res>
    extends _$MissionEntityStatesCopyWithImpl<$Res, _$MissionEntityStatesImpl>
    implements _$$MissionEntityStatesImplCopyWith<$Res> {
  __$$MissionEntityStatesImplCopyWithImpl(_$MissionEntityStatesImpl _value,
      $Res Function(_$MissionEntityStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionEntities = null,
  }) {
    return _then(_$MissionEntityStatesImpl(
      missionEntities: null == missionEntities
          ? _value._missionEntities
          : missionEntities // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$MissionEntityStatesImpl
    with DiagnosticableTreeMixin
    implements _MissionEntityStates {
  const _$MissionEntityStatesImpl(
      {required final List<MissionEntity> missionEntities})
      : _missionEntities = missionEntities;

  factory _$MissionEntityStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityStatesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityStatesImpl &&
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
  _$$MissionEntityStatesImplCopyWith<_$MissionEntityStatesImpl> get copyWith =>
      __$$MissionEntityStatesImplCopyWithImpl<_$MissionEntityStatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityStatesImplToJson(
      this,
    );
  }
}

abstract class _MissionEntityStates implements MissionEntityStates {
  const factory _MissionEntityStates(
          {required final List<MissionEntity> missionEntities}) =
      _$MissionEntityStatesImpl;

  factory _MissionEntityStates.fromJson(Map<String, dynamic> json) =
      _$MissionEntityStatesImpl.fromJson;

  @override
  List<MissionEntity> get missionEntities;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityStatesImplCopyWith<_$MissionEntityStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
