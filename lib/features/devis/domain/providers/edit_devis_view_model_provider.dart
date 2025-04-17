import 'package:egote_services_v2/features/common/domain/entities/states/state.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/superficie_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/images/assets_images.dart';
import '../../../../config/app_shared/images/list_local.dart';
import '../entities/construction/mission_entity.dart';
import '../entities/contact/contact_owner_entity.dart';
import '../entities/products/produit_model_entity.dart';

final editDeviViewModelProvider = StateNotifierProvider<
        EditDeviViewModelController, State<AsyncValue<DevisModelEntity>>>(
    (ref) => EditDeviViewModelController());

class EditDeviViewModelController
    extends StateNotifier<State<AsyncValue<DevisModelEntity>>> {
  EditDeviViewModelController([DevisModelEntity? devisModelEntity])
      : super(const State.init());

  DevisModelEntity initial = DevisModelEntity.empty();
  SuperficieEntity initialSup = SuperficieEntity.rectangle(0, 0);
  TravauxEntity initialTra = TravauxEntity.initialize(
      id: TravauId(value: '0'),
      denomination: 'denomination',
      typesOfWorks: const [],
      areaOfServices: const [],
      missionEntity: const []);
  ContactOwnerEntity initialContact = const ContactOwnerEntity.empty();
  MissionEntity initialMission = MissionEntity.initialize(
      id: MissionId(value: '0'), denomination: 'denomination');

  bool get edit => initial.toJson().isNotEmpty;

  DevisModelEntity get devis => initial.when(
        edit: (devis, createdAt, validity, client, pro, travauxEntity, produits,
            quantity, unitPrice, vatRates, amountHt, amountTtc, approval) {
          try {
            state = const State.loading();

            if (devis.value.isNotEmpty && approval == false) {
              final DevisModelEntity newDevis = DevisModelEntity.edit(
                  id: devis,
                  createdAt: createdAt,
                  validity: validity,
                  client: client,
                  pro: pro,
                  travauxEntity: travauxEntity,
                  produits: produits,
                  quantity: quantity,
                  unitPrice: unitPrice,
                  vatRates: vatRates,
                  amountHt: amountHt,
                  amountTtc: amountTtc,
                  approval: approval);

              state = State.success(AsyncValue.data(newDevis));
              return newDevis;
            }
            return DevisModelEntity.empty();
          } on Exception catch (e) {
            state = State.error(e);
            return DevisModelEntity.initialize(id: devis, createdAt: createdAt);
          }
        },
        initialize: (id, createdAt) =>
            DevisModelEntity.initialize(id: id, createdAt: createdAt),
        empty: () => DevisModelEntity.empty(),
      );

  String? _numDevis;

  String get numDevis => _numDevis ?? '0';

  set numDevis(String value) {
    _numDevis = value;
  }

  double? _long;

  double get longueur => _long!;

  set long(double value) {
    _long = value;
  }

  double? _larg;

  double get largeur => _larg!;

  set larg(double value) {
    _larg = value;
  }

  double? _haut;

  double get hauteur => _haut!;

  set haut(double value) {
    _haut = value;
  }

  SuperficieEntity? _superficieEntity;

  /* SuperficieEntity get superficieEntity =>
      _superficieEntity ??
      initialSup.when(
        initialize: (longueur, largeur, hauteur) => SuperficieEntity.initialize(
            largeur: largeur, longueur: longueur, hauteur: hauteur),
        surface: (surface) =>
            SuperficieEntity.surface(surface: surface = _long! * largeur),
        perimetre: (perimetre) =>
            SuperficieEntity.perimetre(perimetre: perimetre = _long! + _larg!),
        volume: (volume) =>
            SuperficieEntity.volume(volume: _larg! * _long! * _haut!),
        (longueur, largeur, hauteur) => SuperficieEntity(
          longueur: longueur = _long!,
          largeur: largeur = _larg!,
          hauteur: hauteur = _haut!,
        ),
      );*/

  SuperficieEntity get superficieEntity => _superficieEntity ?? initialSup;

  set superficieEntity(SuperficieEntity value) {
    _superficieEntity = value;
  }

  TravauxEntity? _travauxEntity;

  TravauxEntity get travauxEntity => _travauxEntity ?? initialTra;

  set travauxEntity(TravauxEntity value) {
    _travauxEntity = value;
  }

  ContactOwnerEntity? _contactOwnerEntity;

  ContactOwnerEntity get contactOwnerEntity =>
      _contactOwnerEntity ??
      initialContact.when(
        empty: () => const ContactOwnerEntity.empty(),
        client: (int id, String firstName, String lastName, String phone,
                String email) =>
            ContactOwnerEntity.client(
                id: id,
                firstName: firstName,
                lastName: lastName,
                phone: phone,
                email: email),
        pro: (int id, String companyName, String phone, String email,
                professions) =>
            ContactOwnerEntity.pro(
                id: id,
                companyName: companyName,
                phone: phone,
                email: email,
                professions: professions),
      );

  set contactOwnerEntity(ContactOwnerEntity value) {
    _contactOwnerEntity = value;
  }

  MissionEntity? _missionEntity;

  MissionEntity get missionEntity =>
      _missionEntity ??
      initialMission.when(
        done: (id, denomination, startedAt, finishedAt, doneOk) =>
            MissionEntity.done(
                id: id,
                denomination: denomination,
                startedAt: startedAt,
                finishedAt: finishedAt,
                doneOk: doneOk),
        progress: (id, denomination, startedAt) => MissionEntity.progress(
            id: id, denomination: denomination, startedAt: startedAt),
        abandon: (id, denomination, reason, left, isLeft) =>
            MissionEntity.abandon(
                id: id,
                denomination: denomination,
                reason: reason,
                left: left,
                isLeft: isLeft),
        initialize: (id, denomination) =>
            MissionEntity.initialize(id: id, denomination: denomination),
      );

  set missionEntity(MissionEntity value) {
    _missionEntity = value;
  }

  List<LocalImages>? _localImages;

  List<LocalImages> get localImages => _localImages!;

  set localImages(List<LocalImages> value) {
    _localImages = value;
  }

  Images get imageLocal => Images.local(images: _localImages!);

  bool get enabled => numDevis.isNotEmpty;
}

final selectedProduitsProvider = StateProvider<List<Produit>>(
  (ref) => [],
);

final selectedTravauxProvider = StateProvider<List<TravauxEntity>>(
  (ref) => [],
);
