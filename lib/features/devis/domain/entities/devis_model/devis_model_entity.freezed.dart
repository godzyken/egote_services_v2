// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_model_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevisModelEntity _$DevisModelEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'approved':
      return _DevisModelEntity.fromJson(json);
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
mixin _$DevisModelEntity {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisModelEntity value) approved,
    required TResult Function(_DevisModelEntityInitialize value) initialize,
    required TResult Function(_DevisModelEntityEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisModelEntity value)? approved,
    TResult? Function(_DevisModelEntityInitialize value)? initialize,
    TResult? Function(_DevisModelEntityEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisModelEntity value)? approved,
    TResult Function(_DevisModelEntityInitialize value)? initialize,
    TResult Function(_DevisModelEntityEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisModelEntityCopyWith<$Res> {
  factory $DevisModelEntityCopyWith(
          DevisModelEntity value, $Res Function(DevisModelEntity) then) =
      _$DevisModelEntityCopyWithImpl<$Res, DevisModelEntity>;
}

/// @nodoc
class _$DevisModelEntityCopyWithImpl<$Res, $Val extends DevisModelEntity>
    implements $DevisModelEntityCopyWith<$Res> {
  _$DevisModelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DevisModelEntityImplCopyWith<$Res> {
  factory _$$DevisModelEntityImplCopyWith(_$DevisModelEntityImpl value,
          $Res Function(_$DevisModelEntityImpl) then) =
      __$$DevisModelEntityImplCopyWithImpl<$Res>;
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
class __$$DevisModelEntityImplCopyWithImpl<$Res>
    extends _$DevisModelEntityCopyWithImpl<$Res, _$DevisModelEntityImpl>
    implements _$$DevisModelEntityImplCopyWith<$Res> {
  __$$DevisModelEntityImplCopyWithImpl(_$DevisModelEntityImpl _value,
      $Res Function(_$DevisModelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
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
    return _then(_$DevisModelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as DevisId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validity: null == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ContactOwnerEntity,
      pro: null == pro
          ? _value.pro
          : pro // ignore: cast_nullable_to_non_nullable
              as ContactOwnerEntity,
      travauxEntity: null == travauxEntity
          ? _value._travauxEntity
          : travauxEntity // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      vatRates: null == vatRates
          ? _value.vatRates
          : vatRates // ignore: cast_nullable_to_non_nullable
              as double,
      amountHt: null == amountHt
          ? _value.amountHt
          : amountHt // ignore: cast_nullable_to_non_nullable
              as double,
      amountTtc: null == amountTtc
          ? _value.amountTtc
          : amountTtc // ignore: cast_nullable_to_non_nullable
              as double,
      approval: null == approval
          ? _value.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DevisIdCopyWith<$Res> get id {
    return $DevisIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactOwnerEntityCopyWith<$Res> get client {
    return $ContactOwnerEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactOwnerEntityCopyWith<$Res> get pro {
    return $ContactOwnerEntityCopyWith<$Res>(_value.pro, (value) {
      return _then(_value.copyWith(pro: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DevisModelEntityImpl
    with DiagnosticableTreeMixin
    implements _DevisModelEntity {
  const _$DevisModelEntityImpl(
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

  factory _$DevisModelEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevisModelEntityImplFromJson(json);

  @override
  final DevisId id;
  @override
  final DateTime createdAt;
  @override
  final DateTime validity;
  @override
  final ContactOwnerEntity client;
  @override
  final ContactOwnerEntity pro;
  final List<TravauxEntity> _travauxEntity;
  @override
  List<TravauxEntity> get travauxEntity {
    if (_travauxEntity is EqualUnmodifiableListView) return _travauxEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travauxEntity);
  }

  @override
  final int quantity;
  @override
  final int unitPrice;
  @override
  final double vatRates;
  @override
  final double amountHt;
  @override
  final double amountTtc;
  @override
  final bool approval;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.approved(id: $id, createdAt: $createdAt, validity: $validity, client: $client, pro: $pro, travauxEntity: $travauxEntity, quantity: $quantity, unitPrice: $unitPrice, vatRates: $vatRates, amountHt: $amountHt, amountTtc: $amountTtc, approval: $approval)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
            other is _$DevisModelEntityImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevisModelEntityImplCopyWith<_$DevisModelEntityImpl> get copyWith =>
      __$$DevisModelEntityImplCopyWithImpl<_$DevisModelEntityImpl>(
          this, _$identity);

  @override
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
    return approved(id, createdAt, validity, client, pro, travauxEntity,
        quantity, unitPrice, vatRates, amountHt, amountTtc, approval);
  }

  @override
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
    return approved?.call(id, createdAt, validity, client, pro, travauxEntity,
        quantity, unitPrice, vatRates, amountHt, amountTtc, approval);
  }

  @override
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
    if (approved != null) {
      return approved(id, createdAt, validity, client, pro, travauxEntity,
          quantity, unitPrice, vatRates, amountHt, amountTtc, approval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisModelEntity value) approved,
    required TResult Function(_DevisModelEntityInitialize value) initialize,
    required TResult Function(_DevisModelEntityEmpty value) empty,
  }) {
    return approved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisModelEntity value)? approved,
    TResult? Function(_DevisModelEntityInitialize value)? initialize,
    TResult? Function(_DevisModelEntityEmpty value)? empty,
  }) {
    return approved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisModelEntity value)? approved,
    TResult Function(_DevisModelEntityInitialize value)? initialize,
    TResult Function(_DevisModelEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (approved != null) {
      return approved(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DevisModelEntityImplToJson(
      this,
    );
  }
}

abstract class _DevisModelEntity implements DevisModelEntity {
  const factory _DevisModelEntity(
      {required final DevisId id,
      required final DateTime createdAt,
      required final DateTime validity,
      required final ContactOwnerEntity client,
      required final ContactOwnerEntity pro,
      required final List<TravauxEntity> travauxEntity,
      required final int quantity,
      required final int unitPrice,
      required final double vatRates,
      required final double amountHt,
      required final double amountTtc,
      required final bool approval}) = _$DevisModelEntityImpl;

  factory _DevisModelEntity.fromJson(Map<String, dynamic> json) =
      _$DevisModelEntityImpl.fromJson;

  DevisId get id;
  DateTime get createdAt;
  DateTime get validity;
  ContactOwnerEntity get client;
  ContactOwnerEntity get pro;
  List<TravauxEntity> get travauxEntity;
  int get quantity;
  int get unitPrice;
  double get vatRates;
  double get amountHt;
  double get amountTtc;
  bool get approval;
  @JsonKey(ignore: true)
  _$$DevisModelEntityImplCopyWith<_$DevisModelEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DevisModelEntityInitializeImplCopyWith<$Res> {
  factory _$$DevisModelEntityInitializeImplCopyWith(
          _$DevisModelEntityInitializeImpl value,
          $Res Function(_$DevisModelEntityInitializeImpl) then) =
      __$$DevisModelEntityInitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DevisId id, DateTime createdAt});

  $DevisIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$DevisModelEntityInitializeImplCopyWithImpl<$Res>
    extends _$DevisModelEntityCopyWithImpl<$Res,
        _$DevisModelEntityInitializeImpl>
    implements _$$DevisModelEntityInitializeImplCopyWith<$Res> {
  __$$DevisModelEntityInitializeImplCopyWithImpl(
      _$DevisModelEntityInitializeImpl _value,
      $Res Function(_$DevisModelEntityInitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_$DevisModelEntityInitializeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as DevisId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DevisIdCopyWith<$Res> get id {
    return $DevisIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DevisModelEntityInitializeImpl
    with DiagnosticableTreeMixin
    implements _DevisModelEntityInitialize {
  _$DevisModelEntityInitializeImpl(
      {required this.id, required this.createdAt, final String? $type})
      : $type = $type ?? 'initialize';

  factory _$DevisModelEntityInitializeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DevisModelEntityInitializeImplFromJson(json);

  @override
  final DevisId id;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.initialize(id: $id, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DevisModelEntity.initialize'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevisModelEntityInitializeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevisModelEntityInitializeImplCopyWith<_$DevisModelEntityInitializeImpl>
      get copyWith => __$$DevisModelEntityInitializeImplCopyWithImpl<
          _$DevisModelEntityInitializeImpl>(this, _$identity);

  @override
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
    return initialize(id, createdAt);
  }

  @override
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
    return initialize?.call(id, createdAt);
  }

  @override
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
    if (initialize != null) {
      return initialize(id, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisModelEntity value) approved,
    required TResult Function(_DevisModelEntityInitialize value) initialize,
    required TResult Function(_DevisModelEntityEmpty value) empty,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisModelEntity value)? approved,
    TResult? Function(_DevisModelEntityInitialize value)? initialize,
    TResult? Function(_DevisModelEntityEmpty value)? empty,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisModelEntity value)? approved,
    TResult Function(_DevisModelEntityInitialize value)? initialize,
    TResult Function(_DevisModelEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DevisModelEntityInitializeImplToJson(
      this,
    );
  }
}

abstract class _DevisModelEntityInitialize implements DevisModelEntity {
  factory _DevisModelEntityInitialize(
      {required final DevisId id,
      required final DateTime createdAt}) = _$DevisModelEntityInitializeImpl;

  factory _DevisModelEntityInitialize.fromJson(Map<String, dynamic> json) =
      _$DevisModelEntityInitializeImpl.fromJson;

  DevisId get id;
  DateTime get createdAt;
  @JsonKey(ignore: true)
  _$$DevisModelEntityInitializeImplCopyWith<_$DevisModelEntityInitializeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DevisModelEntityEmptyImplCopyWith<$Res> {
  factory _$$DevisModelEntityEmptyImplCopyWith(
          _$DevisModelEntityEmptyImpl value,
          $Res Function(_$DevisModelEntityEmptyImpl) then) =
      __$$DevisModelEntityEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DevisModelEntityEmptyImplCopyWithImpl<$Res>
    extends _$DevisModelEntityCopyWithImpl<$Res, _$DevisModelEntityEmptyImpl>
    implements _$$DevisModelEntityEmptyImplCopyWith<$Res> {
  __$$DevisModelEntityEmptyImplCopyWithImpl(_$DevisModelEntityEmptyImpl _value,
      $Res Function(_$DevisModelEntityEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DevisModelEntityEmptyImpl
    with DiagnosticableTreeMixin
    implements _DevisModelEntityEmpty {
  _$DevisModelEntityEmptyImpl({final String? $type}) : $type = $type ?? 'empty';

  factory _$DevisModelEntityEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevisModelEntityEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DevisModelEntity.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DevisModelEntity.empty'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevisModelEntityEmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return empty();
  }

  @override
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
    return empty?.call();
  }

  @override
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
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisModelEntity value) approved,
    required TResult Function(_DevisModelEntityInitialize value) initialize,
    required TResult Function(_DevisModelEntityEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisModelEntity value)? approved,
    TResult? Function(_DevisModelEntityInitialize value)? initialize,
    TResult? Function(_DevisModelEntityEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisModelEntity value)? approved,
    TResult Function(_DevisModelEntityInitialize value)? initialize,
    TResult Function(_DevisModelEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DevisModelEntityEmptyImplToJson(
      this,
    );
  }
}

abstract class _DevisModelEntityEmpty implements DevisModelEntity {
  factory _DevisModelEntityEmpty() = _$DevisModelEntityEmptyImpl;

  factory _DevisModelEntityEmpty.fromJson(Map<String, dynamic> json) =
      _$DevisModelEntityEmptyImpl.fromJson;
}
