// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_owner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactOwnerEntityDefault _$ContactOwnerEntityDefaultFromJson(
  Map<String, dynamic> json,
) => _ContactOwnerEntityDefault(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ContactOwnerEntityDefaultToJson(
  _ContactOwnerEntityDefault instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
  'runtimeType': instance.$type,
};

_ContactOwnerEntityEmpty _$ContactOwnerEntityEmptyFromJson(
  Map<String, dynamic> json,
) => _ContactOwnerEntityEmpty($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ContactOwnerEntityEmptyToJson(
  _ContactOwnerEntityEmpty instance,
) => <String, dynamic>{'runtimeType': instance.$type};

_ContactOwnerEntityClient _$ContactOwnerEntityClientFromJson(
  Map<String, dynamic> json,
) => _ContactOwnerEntityClient(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ContactOwnerEntityClientToJson(
  _ContactOwnerEntityClient instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
  'runtimeType': instance.$type,
};

_ContactOwnerEntityPro _$ContactOwnerEntityProFromJson(
  Map<String, dynamic> json,
) => _ContactOwnerEntityPro(
  id: (json['id'] as num).toInt(),
  companyName: json['company_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  professions: (json['professions'] as List<dynamic>)
      .map((e) => $enumDecode(_$ProfessionsEnumMap, e))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ContactOwnerEntityProToJson(
  _ContactOwnerEntityPro instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_name': instance.companyName,
  'phone': instance.phone,
  'email': instance.email,
  'professions': instance.professions
      .map((e) => _$ProfessionsEnumMap[e]!)
      .toList(),
  'runtimeType': instance.$type,
};

const _$ProfessionsEnumMap = {
  Professions.unknown: 'unknown',
  Professions.glazierMirrorMaker: 'glazierMirrorMaker',
  Professions.roofersCarpenters: 'roofersCarpenters',
  Professions.painters: 'painters',
  Professions.plumbers: 'plumbers',
  Professions.woodworkers: 'woodworkers',
  Professions.joiners: 'joiners',
  Professions.electricians: 'electricians',
  Professions.architects: 'architects',
  Professions.interiorArchitects: 'interiorArchitects',
  Professions.companyRenovation: 'companyRenovation',
  Professions.companyConstruction: 'companyConstruction',
  Professions.facadeManufacturers: 'facadeManufacturers',
  Professions.ironmongersMetalworkersZincworkers:
      'ironmongersMetalworkersZincworkers',
  Professions.bricklayers: 'bricklayers',
  Professions.plasterers: 'plasterers',
  Professions.landscapeGardeners: 'landscapeGardeners',
  Professions.swimmingPoolSpecialists: 'swimmingPoolSpecialists',
  Professions.earthWorkers: 'earthWorkers',
  Professions.refrigerationContractors: 'refrigerationContractors',
  Professions.heatingSpecialists: 'heatingSpecialists',
  Professions.smokers: 'smokers',
  Professions.cleaningCompany: 'cleaningCompany',
  Professions.corporateSecurityProfessional: 'corporateSecurityProfessional',
  Professions.kitchenSpecialists: 'kitchenSpecialists',
  Professions.diagnosticSpecialist: 'diagnosticSpecialist',
  Professions.tilers: 'tilers',
  Professions.marbleMasonsStoneMasons: 'marbleMasonsStoneMasons',
  Professions.floorCoveringCompany: 'floorCoveringCompany',
  Professions.demolitionEvacuationCompany: 'demolitionEvacuationCompany',
  Professions.liftOperators: 'liftOperators',
  Professions.profPestControl: 'profPestControl',
  Professions.waterproofingInsulationCompany: 'waterproofingInsulationCompany',
  Professions.dIYers: 'dIYers',
  Professions.locksmiths: 'locksmiths',
};
