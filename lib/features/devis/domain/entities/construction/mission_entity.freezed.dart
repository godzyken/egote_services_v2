// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MissionEntity _$MissionEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _MissionEntity.fromJson(json);
    case 'init':
      return _MissionEntityInit.fromJson(json);
    case 'done':
      return _MissionEntityDone.fromJson(json);
    case 'progress':
      return _MissionEntityProgress.fromJson(json);
    case 'abandon':
      return _MissionEntityAbandon.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MissionEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MissionEntity {
  MissionId get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionEntityCopyWith<MissionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionEntityCopyWith<$Res> {
  factory $MissionEntityCopyWith(
          MissionEntity value, $Res Function(MissionEntity) then) =
      _$MissionEntityCopyWithImpl<$Res, MissionEntity>;
  @useResult
  $Res call({MissionId id});

  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MissionEntityCopyWithImpl<$Res, $Val extends MissionEntity>
    implements $MissionEntityCopyWith<$Res> {
  _$MissionEntityCopyWithImpl(this._value, this._then);

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
              as MissionId,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MissionEntityImplCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$MissionEntityImplCopyWith(
          _$MissionEntityImpl value, $Res Function(_$MissionEntityImpl) then) =
      __$$MissionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MissionId id, String denomination});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MissionEntityImplCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$MissionEntityImpl>
    implements _$$MissionEntityImplCopyWith<$Res> {
  __$$MissionEntityImplCopyWithImpl(
      _$MissionEntityImpl _value, $Res Function(_$MissionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
  }) {
    return _then(_$MissionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$MissionEntityImpl implements _MissionEntity {
  const _$MissionEntityImpl(
      {required this.id, required this.denomination, final String? $type})
      : $type = $type ?? 'default';

  factory _$MissionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityImplFromJson(json);

  @override
  final MissionId id;
  @override
  final String denomination;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity(id: $id, denomination: $denomination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, denomination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionEntityImplCopyWith<_$MissionEntityImpl> get copyWith =>
      __$$MissionEntityImplCopyWithImpl<_$MissionEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return $default(id, denomination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) {
    return $default?.call(id, denomination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, denomination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityImplToJson(
      this,
    );
  }
}

abstract class _MissionEntity implements MissionEntity {
  const factory _MissionEntity(
      {required final MissionId id,
      required final String denomination}) = _$MissionEntityImpl;

  factory _MissionEntity.fromJson(Map<String, dynamic> json) =
      _$MissionEntityImpl.fromJson;

  @override
  MissionId get id;
  String get denomination;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityImplCopyWith<_$MissionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissionEntityInitImplCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$MissionEntityInitImplCopyWith(_$MissionEntityInitImpl value,
          $Res Function(_$MissionEntityInitImpl) then) =
      __$$MissionEntityInitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MissionId id});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MissionEntityInitImplCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$MissionEntityInitImpl>
    implements _$$MissionEntityInitImplCopyWith<$Res> {
  __$$MissionEntityInitImplCopyWithImpl(_$MissionEntityInitImpl _value,
      $Res Function(_$MissionEntityInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MissionEntityInitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionEntityInitImpl implements _MissionEntityInit {
  const _$MissionEntityInitImpl({required this.id, final String? $type})
      : $type = $type ?? 'init';

  factory _$MissionEntityInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityInitImplFromJson(json);

  @override
  final MissionId id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity.init(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityInitImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionEntityInitImplCopyWith<_$MissionEntityInitImpl> get copyWith =>
      __$$MissionEntityInitImplCopyWithImpl<_$MissionEntityInitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return init(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) {
    return init?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityInitImplToJson(
      this,
    );
  }
}

abstract class _MissionEntityInit implements MissionEntity {
  const factory _MissionEntityInit({required final MissionId id}) =
      _$MissionEntityInitImpl;

  factory _MissionEntityInit.fromJson(Map<String, dynamic> json) =
      _$MissionEntityInitImpl.fromJson;

  @override
  MissionId get id;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityInitImplCopyWith<_$MissionEntityInitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissionEntityDoneImplCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$MissionEntityDoneImplCopyWith(_$MissionEntityDoneImpl value,
          $Res Function(_$MissionEntityDoneImpl) then) =
      __$$MissionEntityDoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MissionId id,
      String denomination,
      DateTime startedAt,
      DateTime finishedAt,
      bool doneOk});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MissionEntityDoneImplCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$MissionEntityDoneImpl>
    implements _$$MissionEntityDoneImplCopyWith<$Res> {
  __$$MissionEntityDoneImplCopyWithImpl(_$MissionEntityDoneImpl _value,
      $Res Function(_$MissionEntityDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? startedAt = null,
    Object? finishedAt = null,
    Object? doneOk = null,
  }) {
    return _then(_$MissionEntityDoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: null == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      doneOk: null == doneOk
          ? _value.doneOk
          : doneOk // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionEntityDoneImpl implements _MissionEntityDone {
  const _$MissionEntityDoneImpl(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      required this.finishedAt,
      required this.doneOk,
      final String? $type})
      : $type = $type ?? 'done';

  factory _$MissionEntityDoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityDoneImplFromJson(json);

  @override
  final MissionId id;
  @override
  final String denomination;
  @override
  final DateTime startedAt;
  @override
  final DateTime finishedAt;
  @override
  final bool doneOk;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity.done(id: $id, denomination: $denomination, startedAt: $startedAt, finishedAt: $finishedAt, doneOk: $doneOk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityDoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.doneOk, doneOk) || other.doneOk == doneOk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, denomination, startedAt, finishedAt, doneOk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionEntityDoneImplCopyWith<_$MissionEntityDoneImpl> get copyWith =>
      __$$MissionEntityDoneImplCopyWithImpl<_$MissionEntityDoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return done(id, denomination, startedAt, finishedAt, doneOk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) {
    return done?.call(id, denomination, startedAt, finishedAt, doneOk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(id, denomination, startedAt, finishedAt, doneOk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityDoneImplToJson(
      this,
    );
  }
}

abstract class _MissionEntityDone implements MissionEntity {
  const factory _MissionEntityDone(
      {required final MissionId id,
      required final String denomination,
      required final DateTime startedAt,
      required final DateTime finishedAt,
      required final bool doneOk}) = _$MissionEntityDoneImpl;

  factory _MissionEntityDone.fromJson(Map<String, dynamic> json) =
      _$MissionEntityDoneImpl.fromJson;

  @override
  MissionId get id;
  String get denomination;
  DateTime get startedAt;
  DateTime get finishedAt;
  bool get doneOk;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityDoneImplCopyWith<_$MissionEntityDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissionEntityProgressImplCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$MissionEntityProgressImplCopyWith(
          _$MissionEntityProgressImpl value,
          $Res Function(_$MissionEntityProgressImpl) then) =
      __$$MissionEntityProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MissionId id, String denomination, DateTime startedAt});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MissionEntityProgressImplCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$MissionEntityProgressImpl>
    implements _$$MissionEntityProgressImplCopyWith<$Res> {
  __$$MissionEntityProgressImplCopyWithImpl(_$MissionEntityProgressImpl _value,
      $Res Function(_$MissionEntityProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? startedAt = null,
  }) {
    return _then(_$MissionEntityProgressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionEntityProgressImpl implements _MissionEntityProgress {
  const _$MissionEntityProgressImpl(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      final String? $type})
      : $type = $type ?? 'progress';

  factory _$MissionEntityProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityProgressImplFromJson(json);

  @override
  final MissionId id;
  @override
  final String denomination;
  @override
  final DateTime startedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity.progress(id: $id, denomination: $denomination, startedAt: $startedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, denomination, startedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionEntityProgressImplCopyWith<_$MissionEntityProgressImpl>
      get copyWith => __$$MissionEntityProgressImplCopyWithImpl<
          _$MissionEntityProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return progress(id, denomination, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) {
    return progress?.call(id, denomination, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(id, denomination, startedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityProgressImplToJson(
      this,
    );
  }
}

abstract class _MissionEntityProgress implements MissionEntity {
  const factory _MissionEntityProgress(
      {required final MissionId id,
      required final String denomination,
      required final DateTime startedAt}) = _$MissionEntityProgressImpl;

  factory _MissionEntityProgress.fromJson(Map<String, dynamic> json) =
      _$MissionEntityProgressImpl.fromJson;

  @override
  MissionId get id;
  String get denomination;
  DateTime get startedAt;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityProgressImplCopyWith<_$MissionEntityProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissionEntityAbandonImplCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$MissionEntityAbandonImplCopyWith(_$MissionEntityAbandonImpl value,
          $Res Function(_$MissionEntityAbandonImpl) then) =
      __$$MissionEntityAbandonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MissionId id,
      String denomination,
      String reason,
      DateTime left,
      bool isLeft});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MissionEntityAbandonImplCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$MissionEntityAbandonImpl>
    implements _$$MissionEntityAbandonImplCopyWith<$Res> {
  __$$MissionEntityAbandonImplCopyWithImpl(_$MissionEntityAbandonImpl _value,
      $Res Function(_$MissionEntityAbandonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? reason = null,
    Object? left = null,
    Object? isLeft = null,
  }) {
    return _then(_$MissionEntityAbandonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLeft: null == isLeft
          ? _value.isLeft
          : isLeft // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionEntityAbandonImpl implements _MissionEntityAbandon {
  const _$MissionEntityAbandonImpl(
      {required this.id,
      required this.denomination,
      required this.reason,
      required this.left,
      required this.isLeft,
      final String? $type})
      : $type = $type ?? 'abandon';

  factory _$MissionEntityAbandonImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionEntityAbandonImplFromJson(json);

  @override
  final MissionId id;
  @override
  final String denomination;
  @override
  final String reason;
  @override
  final DateTime left;
  @override
  final bool isLeft;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity.abandon(id: $id, denomination: $denomination, reason: $reason, left: $left, isLeft: $isLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionEntityAbandonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.isLeft, isLeft) || other.isLeft == isLeft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, denomination, reason, left, isLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionEntityAbandonImplCopyWith<_$MissionEntityAbandonImpl>
      get copyWith =>
          __$$MissionEntityAbandonImplCopyWithImpl<_$MissionEntityAbandonImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MissionId id, String denomination) $default, {
    required TResult Function(MissionId id) init,
    required TResult Function(MissionId id, String denomination,
            DateTime startedAt, DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(
            MissionId id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return abandon(id, denomination, reason, left, isLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MissionId id, String denomination)? $default, {
    TResult? Function(MissionId id)? init,
    TResult? Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
  }) {
    return abandon?.call(id, denomination, reason, left, isLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MissionId id, String denomination)? $default, {
    TResult Function(MissionId id)? init,
    TResult Function(MissionId id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(MissionId id, String denomination, DateTime startedAt)?
        progress,
    TResult Function(MissionId id, String denomination, String reason,
            DateTime left, bool isLeft)?
        abandon,
    required TResult orElse(),
  }) {
    if (abandon != null) {
      return abandon(id, denomination, reason, left, isLeft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    return abandon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    return abandon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    if (abandon != null) {
      return abandon(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionEntityAbandonImplToJson(
      this,
    );
  }
}

abstract class _MissionEntityAbandon implements MissionEntity {
  const factory _MissionEntityAbandon(
      {required final MissionId id,
      required final String denomination,
      required final String reason,
      required final DateTime left,
      required final bool isLeft}) = _$MissionEntityAbandonImpl;

  factory _MissionEntityAbandon.fromJson(Map<String, dynamic> json) =
      _$MissionEntityAbandonImpl.fromJson;

  @override
  MissionId get id;
  String get denomination;
  String get reason;
  DateTime get left;
  bool get isLeft;
  @override
  @JsonKey(ignore: true)
  _$$MissionEntityAbandonImplCopyWith<_$MissionEntityAbandonImpl>
      get copyWith => throw _privateConstructorUsedError;
}
