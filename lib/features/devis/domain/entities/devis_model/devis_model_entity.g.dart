// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devis_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DevisModelEntityDefault _$DevisModelEntityDefaultFromJson(
  Map<String, dynamic> json,
) => _DevisModelEntityDefault(
  id: DevisId.fromJson(json['id'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  validity: DateTime.parse(json['validity'] as String),
  client: ContactOwnerEntity.fromJson(json['client'] as Map<String, dynamic>),
  pro: ContactOwnerEntity.fromJson(json['pro'] as Map<String, dynamic>),
  travauxEntity: (json['travaux_entity'] as List<dynamic>)
      .map((e) => TravauxEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num).toInt(),
  vatRates: (json['vat_rates'] as num).toDouble(),
  amountHt: (json['amount_ht'] as num).toDouble(),
  amountTtc: (json['amount_ttc'] as num).toDouble(),
  approval: json['approval'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DevisModelEntityDefaultToJson(
  _DevisModelEntityDefault instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'validity': instance.validity.toIso8601String(),
  'client': instance.client,
  'pro': instance.pro,
  'travaux_entity': instance.travauxEntity,
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'vat_rates': instance.vatRates,
  'amount_ht': instance.amountHt,
  'amount_ttc': instance.amountTtc,
  'approval': instance.approval,
  'runtimeType': instance.$type,
};

_DevisModelEntityInitialize _$DevisModelEntityInitializeFromJson(
  Map<String, dynamic> json,
) => _DevisModelEntityInitialize(
  id: DevisId.fromJson(json['id'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DevisModelEntityInitializeToJson(
  _DevisModelEntityInitialize instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'runtimeType': instance.$type,
};

_DevisModelEntityEmpty _$DevisModelEntityEmptyFromJson(
  Map<String, dynamic> json,
) => _DevisModelEntityEmpty($type: json['runtimeType'] as String?);

Map<String, dynamic> _$DevisModelEntityEmptyToJson(
  _DevisModelEntityEmpty instance,
) => <String, dynamic>{'runtimeType': instance.$type};
