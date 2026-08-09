// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MissionEntity _$MissionEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _MissionEntityDefault.fromJson(json);
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
  MissionId get id;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MissionEntityCopyWith<MissionEntity> get copyWith =>
      _$MissionEntityCopyWithImpl<MissionEntity>(
          this as MissionEntity, _$identity);

  /// Serializes this MissionEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MissionEntity &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'MissionEntity(id: $id)';
  }
}

/// @nodoc
abstract mixin class $MissionEntityCopyWith<$Res> {
  factory $MissionEntityCopyWith(
          MissionEntity value, $Res Function(MissionEntity) _then) =
      _$MissionEntityCopyWithImpl;
  @useResult
  $Res call({MissionId id});

  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MissionEntityCopyWithImpl<$Res>
    implements $MissionEntityCopyWith<$Res> {
  _$MissionEntityCopyWithImpl(this._self, this._then);

  final MissionEntity _self;
  final $Res Function(MissionEntity) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MissionEntity].
extension MissionEntityPatterns on MissionEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MissionEntityDefault value)? $default, {
    TResult Function(_MissionEntityInit value)? init,
    TResult Function(_MissionEntityDone value)? done,
    TResult Function(_MissionEntityProgress value)? progress,
    TResult Function(_MissionEntityAbandon value)? abandon,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault() when $default != null:
        return $default(_that);
      case _MissionEntityInit() when init != null:
        return init(_that);
      case _MissionEntityDone() when done != null:
        return done(_that);
      case _MissionEntityProgress() when progress != null:
        return progress(_that);
      case _MissionEntityAbandon() when abandon != null:
        return abandon(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MissionEntityDefault value) $default, {
    required TResult Function(_MissionEntityInit value) init,
    required TResult Function(_MissionEntityDone value) done,
    required TResult Function(_MissionEntityProgress value) progress,
    required TResult Function(_MissionEntityAbandon value) abandon,
  }) {
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault():
        return $default(_that);
      case _MissionEntityInit():
        return init(_that);
      case _MissionEntityDone():
        return done(_that);
      case _MissionEntityProgress():
        return progress(_that);
      case _MissionEntityAbandon():
        return abandon(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MissionEntityDefault value)? $default, {
    TResult? Function(_MissionEntityInit value)? init,
    TResult? Function(_MissionEntityDone value)? done,
    TResult? Function(_MissionEntityProgress value)? progress,
    TResult? Function(_MissionEntityAbandon value)? abandon,
  }) {
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault() when $default != null:
        return $default(_that);
      case _MissionEntityInit() when init != null:
        return init(_that);
      case _MissionEntityDone() when done != null:
        return done(_that);
      case _MissionEntityProgress() when progress != null:
        return progress(_that);
      case _MissionEntityAbandon() when abandon != null:
        return abandon(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault() when $default != null:
        return $default(_that.id, _that.denomination);
      case _MissionEntityInit() when init != null:
        return init(_that.id);
      case _MissionEntityDone() when done != null:
        return done(_that.id, _that.denomination, _that.startedAt,
            _that.finishedAt, _that.doneOk);
      case _MissionEntityProgress() when progress != null:
        return progress(_that.id, _that.denomination, _that.startedAt);
      case _MissionEntityAbandon() when abandon != null:
        return abandon(_that.id, _that.denomination, _that.reason, _that.left,
            _that.isLeft);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault():
        return $default(_that.id, _that.denomination);
      case _MissionEntityInit():
        return init(_that.id);
      case _MissionEntityDone():
        return done(_that.id, _that.denomination, _that.startedAt,
            _that.finishedAt, _that.doneOk);
      case _MissionEntityProgress():
        return progress(_that.id, _that.denomination, _that.startedAt);
      case _MissionEntityAbandon():
        return abandon(_that.id, _that.denomination, _that.reason, _that.left,
            _that.isLeft);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _MissionEntityDefault() when $default != null:
        return $default(_that.id, _that.denomination);
      case _MissionEntityInit() when init != null:
        return init(_that.id);
      case _MissionEntityDone() when done != null:
        return done(_that.id, _that.denomination, _that.startedAt,
            _that.finishedAt, _that.doneOk);
      case _MissionEntityProgress() when progress != null:
        return progress(_that.id, _that.denomination, _that.startedAt);
      case _MissionEntityAbandon() when abandon != null:
        return abandon(_that.id, _that.denomination, _that.reason, _that.left,
            _that.isLeft);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _MissionEntityDefault implements MissionEntity {
  const _MissionEntityDefault(
      {required this.id, required this.denomination, final String? $type})
      : $type = $type ?? 'default';
  factory _MissionEntityDefault.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityDefaultFromJson(json);

  @override
  final MissionId id;
  final String denomination;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityDefaultCopyWith<_MissionEntityDefault> get copyWith =>
      __$MissionEntityDefaultCopyWithImpl<_MissionEntityDefault>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityDefaultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityDefault &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, denomination);

  @override
  String toString() {
    return 'MissionEntity(id: $id, denomination: $denomination)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityDefaultCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$MissionEntityDefaultCopyWith(_MissionEntityDefault value,
          $Res Function(_MissionEntityDefault) _then) =
      __$MissionEntityDefaultCopyWithImpl;
  @override
  @useResult
  $Res call({MissionId id, String denomination});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$MissionEntityDefaultCopyWithImpl<$Res>
    implements _$MissionEntityDefaultCopyWith<$Res> {
  __$MissionEntityDefaultCopyWithImpl(this._self, this._then);

  final _MissionEntityDefault _self;
  final $Res Function(_MissionEntityDefault) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? denomination = null,
  }) {
    return _then(_MissionEntityDefault(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _self.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MissionEntityInit implements MissionEntity {
  const _MissionEntityInit({required this.id, final String? $type})
      : $type = $type ?? 'init';
  factory _MissionEntityInit.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityInitFromJson(json);

  @override
  final MissionId id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityInitCopyWith<_MissionEntityInit> get copyWith =>
      __$MissionEntityInitCopyWithImpl<_MissionEntityInit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityInitToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityInit &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'MissionEntity.init(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityInitCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$MissionEntityInitCopyWith(
          _MissionEntityInit value, $Res Function(_MissionEntityInit) _then) =
      __$MissionEntityInitCopyWithImpl;
  @override
  @useResult
  $Res call({MissionId id});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$MissionEntityInitCopyWithImpl<$Res>
    implements _$MissionEntityInitCopyWith<$Res> {
  __$MissionEntityInitCopyWithImpl(this._self, this._then);

  final _MissionEntityInit _self;
  final $Res Function(_MissionEntityInit) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_MissionEntityInit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MissionEntityDone implements MissionEntity {
  const _MissionEntityDone(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      required this.finishedAt,
      required this.doneOk,
      final String? $type})
      : $type = $type ?? 'done';
  factory _MissionEntityDone.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityDoneFromJson(json);

  @override
  final MissionId id;
  final String denomination;
  final DateTime startedAt;
  final DateTime finishedAt;
  final bool doneOk;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityDoneCopyWith<_MissionEntityDone> get copyWith =>
      __$MissionEntityDoneCopyWithImpl<_MissionEntityDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityDone &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.doneOk, doneOk) || other.doneOk == doneOk));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, denomination, startedAt, finishedAt, doneOk);

  @override
  String toString() {
    return 'MissionEntity.done(id: $id, denomination: $denomination, startedAt: $startedAt, finishedAt: $finishedAt, doneOk: $doneOk)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityDoneCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$MissionEntityDoneCopyWith(
          _MissionEntityDone value, $Res Function(_MissionEntityDone) _then) =
      __$MissionEntityDoneCopyWithImpl;
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
class __$MissionEntityDoneCopyWithImpl<$Res>
    implements _$MissionEntityDoneCopyWith<$Res> {
  __$MissionEntityDoneCopyWithImpl(this._self, this._then);

  final _MissionEntityDone _self;
  final $Res Function(_MissionEntityDone) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? startedAt = null,
    Object? finishedAt = null,
    Object? doneOk = null,
  }) {
    return _then(_MissionEntityDone(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _self.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: null == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      doneOk: null == doneOk
          ? _self.doneOk
          : doneOk // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MissionEntityProgress implements MissionEntity {
  const _MissionEntityProgress(
      {required this.id,
      required this.denomination,
      required this.startedAt,
      final String? $type})
      : $type = $type ?? 'progress';
  factory _MissionEntityProgress.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityProgressFromJson(json);

  @override
  final MissionId id;
  final String denomination;
  final DateTime startedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityProgressCopyWith<_MissionEntityProgress> get copyWith =>
      __$MissionEntityProgressCopyWithImpl<_MissionEntityProgress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityProgressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, denomination, startedAt);

  @override
  String toString() {
    return 'MissionEntity.progress(id: $id, denomination: $denomination, startedAt: $startedAt)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityProgressCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$MissionEntityProgressCopyWith(_MissionEntityProgress value,
          $Res Function(_MissionEntityProgress) _then) =
      __$MissionEntityProgressCopyWithImpl;
  @override
  @useResult
  $Res call({MissionId id, String denomination, DateTime startedAt});

  @override
  $MissionIdCopyWith<$Res> get id;
}

/// @nodoc
class __$MissionEntityProgressCopyWithImpl<$Res>
    implements _$MissionEntityProgressCopyWith<$Res> {
  __$MissionEntityProgressCopyWithImpl(this._self, this._then);

  final _MissionEntityProgress _self;
  final $Res Function(_MissionEntityProgress) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? startedAt = null,
  }) {
    return _then(_MissionEntityProgress(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _self.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MissionEntityAbandon implements MissionEntity {
  const _MissionEntityAbandon(
      {required this.id,
      required this.denomination,
      required this.reason,
      required this.left,
      required this.isLeft,
      final String? $type})
      : $type = $type ?? 'abandon';
  factory _MissionEntityAbandon.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityAbandonFromJson(json);

  @override
  final MissionId id;
  final String denomination;
  final String reason;
  final DateTime left;
  final bool isLeft;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityAbandonCopyWith<_MissionEntityAbandon> get copyWith =>
      __$MissionEntityAbandonCopyWithImpl<_MissionEntityAbandon>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityAbandonToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityAbandon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.isLeft, isLeft) || other.isLeft == isLeft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, denomination, reason, left, isLeft);

  @override
  String toString() {
    return 'MissionEntity.abandon(id: $id, denomination: $denomination, reason: $reason, left: $left, isLeft: $isLeft)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityAbandonCopyWith<$Res>
    implements $MissionEntityCopyWith<$Res> {
  factory _$MissionEntityAbandonCopyWith(_MissionEntityAbandon value,
          $Res Function(_MissionEntityAbandon) _then) =
      __$MissionEntityAbandonCopyWithImpl;
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
class __$MissionEntityAbandonCopyWithImpl<$Res>
    implements _$MissionEntityAbandonCopyWith<$Res> {
  __$MissionEntityAbandonCopyWithImpl(this._self, this._then);

  final _MissionEntityAbandon _self;
  final $Res Function(_MissionEntityAbandon) _then;

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? reason = null,
    Object? left = null,
    Object? isLeft = null,
  }) {
    return _then(_MissionEntityAbandon(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as MissionId,
      denomination: null == denomination
          ? _self.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      left: null == left
          ? _self.left
          : left // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLeft: null == isLeft
          ? _self.isLeft
          : isLeft // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MissionIdCopyWith<$Res> get id {
    return $MissionIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

// dart format on
