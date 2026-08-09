// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_model_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DevisModelEntity _$DevisModelEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'approved':
      return _DevisModelEntityDefault.fromJson(json);
    case 'initialize':
      return _DevisModelEntityInitialize.fromJson(json);
    case 'empty':
      return _DevisModelEntityEmpty.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DevisModelEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DevisModelEntity implements DiagnosticableTreeMixin {
  /// Serializes this DevisModelEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DevisModelEntity'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DevisModelEntity);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity()';
  }
}

/// @nodoc
class $DevisModelEntityCopyWith<$Res> {
  $DevisModelEntityCopyWith(
      DevisModelEntity _, $Res Function(DevisModelEntity) __);
}

/// Adds pattern-matching-related methods to [DevisModelEntity].
extension DevisModelEntityPatterns on DevisModelEntity {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisModelEntityDefault value)? approved,
    TResult Function(_DevisModelEntityInitialize value)? initialize,
    TResult Function(_DevisModelEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault() when approved != null:
        return approved(_that);
      case _DevisModelEntityInitialize() when initialize != null:
        return initialize(_that);
      case _DevisModelEntityEmpty() when empty != null:
        return empty(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisModelEntityDefault value) approved,
    required TResult Function(_DevisModelEntityInitialize value) initialize,
    required TResult Function(_DevisModelEntityEmpty value) empty,
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault():
        return approved(_that);
      case _DevisModelEntityInitialize():
        return initialize(_that);
      case _DevisModelEntityEmpty():
        return empty(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisModelEntityDefault value)? approved,
    TResult? Function(_DevisModelEntityInitialize value)? initialize,
    TResult? Function(_DevisModelEntityEmpty value)? empty,
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault() when approved != null:
        return approved(_that);
      case _DevisModelEntityInitialize() when initialize != null:
        return initialize(_that);
      case _DevisModelEntityEmpty() when empty != null:
        return empty(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DevisId id,
            DateTime createdAt,
            DateTime validity,
            ContactOwnerEntity client,
            ContactOwnerEntity pro,
            List<TravauxEntity> travauxEntity,
            int quantity,
            int unitPrice,
            double vatRates,
            double amountHt,
            double amountTtc,
            bool approval)?
        approved,
    TResult Function(DevisId id, DateTime createdAt)? initialize,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault() when approved != null:
        return approved(
            _that.id,
            _that.createdAt,
            _that.validity,
            _that.client,
            _that.pro,
            _that.travauxEntity,
            _that.quantity,
            _that.unitPrice,
            _that.vatRates,
            _that.amountHt,
            _that.amountTtc,
            _that.approval);
      case _DevisModelEntityInitialize() when initialize != null:
        return initialize(_that.id, _that.createdAt);
      case _DevisModelEntityEmpty() when empty != null:
        return empty();
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            DevisId id,
            DateTime createdAt,
            DateTime validity,
            ContactOwnerEntity client,
            ContactOwnerEntity pro,
            List<TravauxEntity> travauxEntity,
            int quantity,
            int unitPrice,
            double vatRates,
            double amountHt,
            double amountTtc,
            bool approval)
        approved,
    required TResult Function(DevisId id, DateTime createdAt) initialize,
    required TResult Function() empty,
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault():
        return approved(
            _that.id,
            _that.createdAt,
            _that.validity,
            _that.client,
            _that.pro,
            _that.travauxEntity,
            _that.quantity,
            _that.unitPrice,
            _that.vatRates,
            _that.amountHt,
            _that.amountTtc,
            _that.approval);
      case _DevisModelEntityInitialize():
        return initialize(_that.id, _that.createdAt);
      case _DevisModelEntityEmpty():
        return empty();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DevisId id,
            DateTime createdAt,
            DateTime validity,
            ContactOwnerEntity client,
            ContactOwnerEntity pro,
            List<TravauxEntity> travauxEntity,
            int quantity,
            int unitPrice,
            double vatRates,
            double amountHt,
            double amountTtc,
            bool approval)?
        approved,
    TResult? Function(DevisId id, DateTime createdAt)? initialize,
    TResult? Function()? empty,
  }) {
    final _that = this;
    switch (_that) {
      case _DevisModelEntityDefault() when approved != null:
        return approved(
            _that.id,
            _that.createdAt,
            _that.validity,
            _that.client,
            _that.pro,
            _that.travauxEntity,
            _that.quantity,
            _that.unitPrice,
            _that.vatRates,
            _that.amountHt,
            _that.amountTtc,
            _that.approval);
      case _DevisModelEntityInitialize() when initialize != null:
        return initialize(_that.id, _that.createdAt);
      case _DevisModelEntityEmpty() when empty != null:
        return empty();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DevisModelEntityDefault
    with DiagnosticableTreeMixin
    implements DevisModelEntity {
  const _DevisModelEntityDefault(
      {required this.id,
      required this.createdAt,
      required this.validity,
      required this.client,
      required this.pro,
      required final List<TravauxEntity> travauxEntity,
      required this.quantity,
      required this.unitPrice,
      required this.vatRates,
      required this.amountHt,
      required this.amountTtc,
      required this.approval,
      final String? $type})
      : _travauxEntity = travauxEntity,
        $type = $type ?? 'approved';
  factory _DevisModelEntityDefault.fromJson(Map<String, dynamic> json) =>
      _$DevisModelEntityDefaultFromJson(json);

  final DevisId id;
  final DateTime createdAt;
  final DateTime validity;
  final ContactOwnerEntity client;
  final ContactOwnerEntity pro;
  final List<TravauxEntity> _travauxEntity;
  List<TravauxEntity> get travauxEntity {
    if (_travauxEntity is EqualUnmodifiableListView) return _travauxEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travauxEntity);
  }

  final int quantity;
  final int unitPrice;
  final double vatRates;
  final double amountHt;
  final double amountTtc;
  final bool approval;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DevisModelEntityDefaultCopyWith<_DevisModelEntityDefault> get copyWith =>
      __$DevisModelEntityDefaultCopyWithImpl<_DevisModelEntityDefault>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DevisModelEntityDefaultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DevisModelEntity.approved'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('validity', validity))
      ..add(DiagnosticsProperty('client', client))
      ..add(DiagnosticsProperty('pro', pro))
      ..add(DiagnosticsProperty('travauxEntity', travauxEntity))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('unitPrice', unitPrice))
      ..add(DiagnosticsProperty('vatRates', vatRates))
      ..add(DiagnosticsProperty('amountHt', amountHt))
      ..add(DiagnosticsProperty('amountTtc', amountTtc))
      ..add(DiagnosticsProperty('approval', approval));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DevisModelEntityDefault &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.validity, validity) ||
                other.validity == validity) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.pro, pro) || other.pro == pro) &&
            const DeepCollectionEquality()
                .equals(other._travauxEntity, _travauxEntity) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.vatRates, vatRates) ||
                other.vatRates == vatRates) &&
            (identical(other.amountHt, amountHt) ||
                other.amountHt == amountHt) &&
            (identical(other.amountTtc, amountTtc) ||
                other.amountTtc == amountTtc) &&
            (identical(other.approval, approval) ||
                other.approval == approval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      validity,
      client,
      pro,
      const DeepCollectionEquality().hash(_travauxEntity),
      quantity,
      unitPrice,
      vatRates,
      amountHt,
      amountTtc,
      approval);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.approved(id: $id, createdAt: $createdAt, validity: $validity, client: $client, pro: $pro, travauxEntity: $travauxEntity, quantity: $quantity, unitPrice: $unitPrice, vatRates: $vatRates, amountHt: $amountHt, amountTtc: $amountTtc, approval: $approval)';
  }
}

/// @nodoc
abstract mixin class _$DevisModelEntityDefaultCopyWith<$Res>
    implements $DevisModelEntityCopyWith<$Res> {
  factory _$DevisModelEntityDefaultCopyWith(_DevisModelEntityDefault value,
          $Res Function(_DevisModelEntityDefault) _then) =
      __$DevisModelEntityDefaultCopyWithImpl;
  @useResult
  $Res call(
      {DevisId id,
      DateTime createdAt,
      DateTime validity,
      ContactOwnerEntity client,
      ContactOwnerEntity pro,
      List<TravauxEntity> travauxEntity,
      int quantity,
      int unitPrice,
      double vatRates,
      double amountHt,
      double amountTtc,
      bool approval});

  $DevisIdCopyWith<$Res> get id;
  $ContactOwnerEntityCopyWith<$Res> get client;
  $ContactOwnerEntityCopyWith<$Res> get pro;
}

/// @nodoc
class __$DevisModelEntityDefaultCopyWithImpl<$Res>
    implements _$DevisModelEntityDefaultCopyWith<$Res> {
  __$DevisModelEntityDefaultCopyWithImpl(this._self, this._then);

  final _DevisModelEntityDefault _self;
  final $Res Function(_DevisModelEntityDefault) _then;

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? validity = null,
    Object? client = null,
    Object? pro = null,
    Object? travauxEntity = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? vatRates = null,
    Object? amountHt = null,
    Object? amountTtc = null,
    Object? approval = null,
  }) {
    return _then(_DevisModelEntityDefault(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as DevisId,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validity: null == validity
          ? _self.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _self.client
          : client // ignore: cast_nullable_to_non_nullable
              as ContactOwnerEntity,
      pro: null == pro
          ? _self.pro
          : pro // ignore: cast_nullable_to_non_nullable
              as ContactOwnerEntity,
      travauxEntity: null == travauxEntity
          ? _self._travauxEntity
          : travauxEntity // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      vatRates: null == vatRates
          ? _self.vatRates
          : vatRates // ignore: cast_nullable_to_non_nullable
              as double,
      amountHt: null == amountHt
          ? _self.amountHt
          : amountHt // ignore: cast_nullable_to_non_nullable
              as double,
      amountTtc: null == amountTtc
          ? _self.amountTtc
          : amountTtc // ignore: cast_nullable_to_non_nullable
              as double,
      approval: null == approval
          ? _self.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DevisIdCopyWith<$Res> get id {
    return $DevisIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactOwnerEntityCopyWith<$Res> get client {
    return $ContactOwnerEntityCopyWith<$Res>(_self.client, (value) {
      return _then(_self.copyWith(client: value));
    });
  }

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactOwnerEntityCopyWith<$Res> get pro {
    return $ContactOwnerEntityCopyWith<$Res>(_self.pro, (value) {
      return _then(_self.copyWith(pro: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DevisModelEntityInitialize
    with DiagnosticableTreeMixin
    implements DevisModelEntity {
  _DevisModelEntityInitialize(
      {required this.id, required this.createdAt, final String? $type})
      : $type = $type ?? 'initialize';
  factory _DevisModelEntityInitialize.fromJson(Map<String, dynamic> json) =>
      _$DevisModelEntityInitializeFromJson(json);

  final DevisId id;
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DevisModelEntityInitializeCopyWith<_DevisModelEntityInitialize>
      get copyWith => __$DevisModelEntityInitializeCopyWithImpl<
          _DevisModelEntityInitialize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DevisModelEntityInitializeToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DevisModelEntity.initialize'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DevisModelEntityInitialize &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.initialize(id: $id, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DevisModelEntityInitializeCopyWith<$Res>
    implements $DevisModelEntityCopyWith<$Res> {
  factory _$DevisModelEntityInitializeCopyWith(
          _DevisModelEntityInitialize value,
          $Res Function(_DevisModelEntityInitialize) _then) =
      __$DevisModelEntityInitializeCopyWithImpl;
  @useResult
  $Res call({DevisId id, DateTime createdAt});

  $DevisIdCopyWith<$Res> get id;
}

/// @nodoc
class __$DevisModelEntityInitializeCopyWithImpl<$Res>
    implements _$DevisModelEntityInitializeCopyWith<$Res> {
  __$DevisModelEntityInitializeCopyWithImpl(this._self, this._then);

  final _DevisModelEntityInitialize _self;
  final $Res Function(_DevisModelEntityInitialize) _then;

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_DevisModelEntityInitialize(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as DevisId,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of DevisModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DevisIdCopyWith<$Res> get id {
    return $DevisIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DevisModelEntityEmpty
    with DiagnosticableTreeMixin
    implements DevisModelEntity {
  _DevisModelEntityEmpty({final String? $type}) : $type = $type ?? 'empty';
  factory _DevisModelEntityEmpty.fromJson(Map<String, dynamic> json) =>
      _$DevisModelEntityEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$DevisModelEntityEmptyToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DevisModelEntity.empty'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DevisModelEntityEmpty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.empty()';
  }
}

// dart format on
