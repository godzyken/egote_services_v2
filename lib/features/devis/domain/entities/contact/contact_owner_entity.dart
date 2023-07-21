import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_owner_entity.freezed.dart';
part 'contact_owner_entity.g.dart';

@freezed
class ContactOwnerEntity with _$ContactOwnerEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ContactOwnerEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) = _ContactOwnerEntity;

  const factory ContactOwnerEntity.empty() = _ContactOwnerEntityEmpty;

  const factory ContactOwnerEntity.client({
    required int id,
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) = _ContactOwnerEntityClient;

  const factory ContactOwnerEntity.pro(
      int id,
      String companyName,
      String phone,
      String email,
      Professions professions
      ) = _ContactOwnerEntityPro;

  factory ContactOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityFromJson(json);
}

//Metiers {
//   inconnue,
//   vitrierMiroitier,
//   CouvreursCharpentiers,
//   Peintres,
//   Plombiers,
//   Ebenistes,
//   Menuisiers,
//   Electriciens,
//   Architectes,
//   ArchitectesInterrieur,
//   EntrepriseRenovation,
//   EntrepriseBatiment,
//   Facadiers,
//   FerroniersMetalliersZingueurs,
//   Macons,
//   Plaquistes,
//   JardiniersPaysagistes,
//   Piscinistes,
//   Terrassiers,
//   Frigoristes,
//   Chauffagistes,
//   Fumistes,
//   EntrepriseNettoyage,
//   ProfSecuEntreprise,
//   Cuisinistes,
//   Diagnostiqueurq,
//   Carreleurs,
//   MarbriresTailleursPierre,
//   EntrepriseRevetementSol,
//   EntrepriseDemolitionEvacutaion,
//   Ascensoristes,
//   ProfTraitementNuisibles,
//   EtancheursEntrepriseisolation,
//   Bricoleurs,
//   Serruriers
//}
@JsonEnum()
enum Professions {
  unknown,
  glazierMirrorMaker,
  roofersCarpenters,
  painters,
  plumbers,
  woodworkers,
  joiners,
  electricians,
  architects,
  interiorArchitects,
  companyRenovation,
  companyConstruction,
  facadeManufacturers,
  ironmongersMetalworkersZincworkers,
  bricklayers,
  plasterers,
  landscapeGardeners,
  swimmingPoolSpecialists,
  earthWorkers,
  refrigerationContractors,
  heatingSpecialists,
  smokers,
  cleaningCompany,
  corporateSecurityProfessional,
  kitchenSpecialists,
  diagnosticSpecialist,
  tilers,
  marbleMasonsStoneMasons,
  floorCoveringCompany,
  demolitionEvacuationCompany,
  liftOperators,
  profPestControl,
  waterproofingInsulationCompany,
  dIYers,
  locksmiths
}