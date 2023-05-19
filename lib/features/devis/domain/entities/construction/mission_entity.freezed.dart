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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionEntity _$MissionEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _MissionEntity.fromJson(json);
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
  int get id => throw _privateConstructorUsedError;
  String get denomination => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String denomination) $default, {
    required TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(int id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(int id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String denomination)? $default, {
    TResult? Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(int id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String denomination)? $default, {
    TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(int id, String denomination, DateTime startedAt)? progress,
    TResult Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntity value) $default, {
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntity value)? $default, {
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntity value)? $default, {
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
  $Res call({int id, String denomination});
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
    Object? denomination = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionEntityCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$_MissionEntityCopyWith(
          _$_MissionEntity value, $Res Function(_$_MissionEntity) then) =
      __$$_MissionEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String denomination});
}

/// @nodoc
class __$$_MissionEntityCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$_MissionEntity>
    implements _$$_MissionEntityCopyWith<$Res> {
  __$$_MissionEntityCopyWithImpl(
      _$_MissionEntity _value, $Res Function(_$_MissionEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
  }) {
    return _then(_$_MissionEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MissionEntity implements _MissionEntity {
  const _$_MissionEntity(
      {required this.id, required this.denomination, final String? $type})
      : $type = $type ?? 'default';

  factory _$_MissionEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MissionEntityFromJson(json);

  @override
  final int id;
  @override
  final String denomination;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MissionEntity(id: $id, denomination: $denomination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionEntity &&
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
  _$$_MissionEntityCopyWith<_$_MissionEntity> get copyWith =>
      __$$_MissionEntityCopyWithImpl<_$_MissionEntity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String denomination) $default, {
    required TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(int id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(int id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return $default(id, denomination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String denomination)? $default, {
    TResult? Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(int id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
  }) {
    return $default?.call(id, denomination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String denomination)? $default, {
    TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(int id, String denomination, DateTime startedAt)? progress,
    TResult Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
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
    return _$$_MissionEntityToJson(
      this,
    );
  }
}

abstract class _MissionEntity implements MissionEntity {
  const factory _MissionEntity(
      {required final int id,
      required final String denomination}) = _$_MissionEntity;

  factory _MissionEntity.fromJson(Map<String, dynamic> json) =
      _$_MissionEntity.fromJson;

  @override
  int get id;
  @override
  String get denomination;
  @override
  @JsonKey(ignore: true)
  _$$_MissionEntityCopyWith<_$_MissionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MissionEntityDoneCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$_MissionEntityDoneCopyWith(_$_MissionEntityDone value,
          $Res Function(_$_MissionEntityDone) then) =
      __$$_MissionEntityDoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String denomination,
      DateTime startedAt,
      DateTime finishedAt,
      bool doneOk});
}

/// @nodoc
class __$$_MissionEntityDoneCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$_MissionEntityDone>
    implements _$$_MissionEntityDoneCopyWith<$Res> {
  __$$_MissionEntityDoneCopyWithImpl(
      _$_MissionEntityDone _value, $Res Function(_$_MissionEntityDone) _then)
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
    return _then(_$_MissionEntityDone(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_MissionEntityDone implements _MissionEntityDone {
  const _$_MissionEntityDone(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      required this.finishedAt,
      required this.doneOk,
      final String? $type})
      : $type = $type ?? 'done';

  factory _$_MissionEntityDone.fromJson(Map<String, dynamic> json) =>
      _$$_MissionEntityDoneFromJson(json);

  @override
  final int id;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionEntityDone &&
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
  _$$_MissionEntityDoneCopyWith<_$_MissionEntityDone> get copyWith =>
      __$$_MissionEntityDoneCopyWithImpl<_$_MissionEntityDone>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String denomination) $default, {
    required TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(int id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(int id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return done(id, denomination, startedAt, finishedAt, doneOk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String denomination)? $default, {
    TResult? Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(int id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
  }) {
    return done?.call(id, denomination, startedAt, finishedAt, doneOk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String denomination)? $default, {
    TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(int id, String denomination, DateTime startedAt)? progress,
    TResult Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
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
    return _$$_MissionEntityDoneToJson(
      this,
    );
  }
}

abstract class _MissionEntityDone implements MissionEntity {
  const factory _MissionEntityDone(
      {required final int id,
      required final String denomination,
      required final DateTime startedAt,
      required final DateTime finishedAt,
      required final bool doneOk}) = _$_MissionEntityDone;

  factory _MissionEntityDone.fromJson(Map<String, dynamic> json) =
      _$_MissionEntityDone.fromJson;

  @override
  int get id;
  @override
  String get denomination;
  DateTime get startedAt;
  DateTime get finishedAt;
  bool get doneOk;
  @override
  @JsonKey(ignore: true)
  _$$_MissionEntityDoneCopyWith<_$_MissionEntityDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MissionEntityProgressCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$_MissionEntityProgressCopyWith(_$_MissionEntityProgress value,
          $Res Function(_$_MissionEntityProgress) then) =
      __$$_MissionEntityProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String denomination, DateTime startedAt});
}

/// @nodoc
class __$$_MissionEntityProgressCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$_MissionEntityProgress>
    implements _$$_MissionEntityProgressCopyWith<$Res> {
  __$$_MissionEntityProgressCopyWithImpl(_$_MissionEntityProgress _value,
      $Res Function(_$_MissionEntityProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? startedAt = null,
  }) {
    return _then(_$_MissionEntityProgress(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_MissionEntityProgress implements _MissionEntityProgress {
  const _$_MissionEntityProgress(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      final String? $type})
      : $type = $type ?? 'progress';

  factory _$_MissionEntityProgress.fromJson(Map<String, dynamic> json) =>
      _$$_MissionEntityProgressFromJson(json);

  @override
  final int id;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionEntityProgress &&
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
  _$$_MissionEntityProgressCopyWith<_$_MissionEntityProgress> get copyWith =>
      __$$_MissionEntityProgressCopyWithImpl<_$_MissionEntityProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String denomination) $default, {
    required TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(int id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(int id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return progress(id, denomination, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String denomination)? $default, {
    TResult? Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(int id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
  }) {
    return progress?.call(id, denomination, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String denomination)? $default, {
    TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(int id, String denomination, DateTime startedAt)? progress,
    TResult Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
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
    return _$$_MissionEntityProgressToJson(
      this,
    );
  }
}

abstract class _MissionEntityProgress implements MissionEntity {
  const factory _MissionEntityProgress(
      {required final int id,
      required final String denomination,
      required final DateTime startedAt}) = _$_MissionEntityProgress;

  factory _MissionEntityProgress.fromJson(Map<String, dynamic> json) =
      _$_MissionEntityProgress.fromJson;

  @override
  int get id;
  @override
  String get denomination;
  DateTime get startedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MissionEntityProgressCopyWith<_$_MissionEntityProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MissionEntityAbandonCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$$_MissionEntityAbandonCopyWith(_$_MissionEntityAbandon value,
          $Res Function(_$_MissionEntityAbandon) then) =
      __$$_MissionEntityAbandonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String denomination, String reason, DateTime left, bool isLeft});
}

/// @nodoc
class __$$_MissionEntityAbandonCopyWithImpl<$Res>
    extends _$MissionEntityCopyWithImpl<$Res, _$_MissionEntityAbandon>
    implements _$$_MissionEntityAbandonCopyWith<$Res> {
  __$$_MissionEntityAbandonCopyWithImpl(_$_MissionEntityAbandon _value,
      $Res Function(_$_MissionEntityAbandon) _then)
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
    return _then(_$_MissionEntityAbandon(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_MissionEntityAbandon implements _MissionEntityAbandon {
  const _$_MissionEntityAbandon(
      {required this.id,
      required this.denomination,
      required this.reason,
      required this.left,
      required this.isLeft,
      final String? $type})
      : $type = $type ?? 'abandon';

  factory _$_MissionEntityAbandon.fromJson(Map<String, dynamic> json) =>
      _$$_MissionEntityAbandonFromJson(json);

  @override
  final int id;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionEntityAbandon &&
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
  _$$_MissionEntityAbandonCopyWith<_$_MissionEntityAbandon> get copyWith =>
      __$$_MissionEntityAbandonCopyWithImpl<_$_MissionEntityAbandon>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String denomination) $default, {
    required TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)
        done,
    required TResult Function(int id, String denomination, DateTime startedAt)
        progress,
    required TResult Function(int id, String denomination, String reason,
            DateTime left, bool isLeft)
        abandon,
  }) {
    return abandon(id, denomination, reason, left, isLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String denomination)? $default, {
    TResult? Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult? Function(int id, String denomination, DateTime startedAt)?
        progress,
    TResult? Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
        abandon,
  }) {
    return abandon?.call(id, denomination, reason, left, isLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String denomination)? $default, {
    TResult Function(int id, String denomination, DateTime startedAt,
            DateTime finishedAt, bool doneOk)?
        done,
    TResult Function(int id, String denomination, DateTime startedAt)? progress,
    TResult Function(int id, String denomination, String reason, DateTime left,
            bool isLeft)?
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
    return _$$_MissionEntityAbandonToJson(
      this,
    );
  }
}

abstract class _MissionEntityAbandon implements MissionEntity {
  const factory _MissionEntityAbandon(
      {required final int id,
      required final String denomination,
      required final String reason,
      required final DateTime left,
      required final bool isLeft}) = _$_MissionEntityAbandon;

  factory _MissionEntityAbandon.fromJson(Map<String, dynamic> json) =
      _$_MissionEntityAbandon.fromJson;

  @override
  int get id;
  @override
  String get denomination;
  String get reason;
  DateTime get left;
  bool get isLeft;
  @override
  @JsonKey(ignore: true)
  _$$_MissionEntityAbandonCopyWith<_$_MissionEntityAbandon> get copyWith =>
      throw _privateConstructorUsedError;
}
