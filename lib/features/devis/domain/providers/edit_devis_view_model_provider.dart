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

final editDeviViewModelProvider = StateNotifierProvider<
        EditDeviViewModelController, State<AsyncValue<DevisModelEntity>>>(
    (ref) => EditDeviViewModelController());

class EditDeviViewModelController
    extends StateNotifier<State<AsyncValue<DevisModelEntity>>> {
  EditDeviViewModelController([DevisModelEntity? devisModelEntity])
      : super(const State.init());

  DevisModelEntity initial = DevisModelEntity.empty();
  SuperficieEntity initialSup =
      const SuperficieEntity.initialize(longueur: 0, largeur: 0, hauteur: 0);
  TravauxEntity initialTra = const TravauxEntity(
      id: TravauId(id: 0),
      denomination: 'denomination',
      typesOfWorks: [],
      areaOfServices: [],
      missionEntity: []);
  ContactOwnerEntity initialContact = const ContactOwnerEntity.empty();
  MissionEntity initialMission =
      const MissionEntity(id: MissionId(id: 0), denomination: 'denomination');

  bool get edit => initial.toJson().isNotEmpty;

  DevisModelEntity get devis => initial.when(
        approved: (id, createdAt, validity, client, pro, travauxEntity,
            quantity, unitPrice, vatRates, amountHt, amountTtc, approval) {
          try {
            state = const State.loading();

            if (id != 0 && approval != false) {
              final DevisModelEntity newDevis = DevisModelEntity.approved(
                  id: id,
                  createdAt: createdAt,
                  validity: validity,
                  client: client,
                  pro: pro,
                  travauxEntity: travauxEntity,
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
            return DevisModelEntity.initialize(id: id, createdAt: createdAt);
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

  int? _long;

  int get longueur => _long!;

  set long(int value) {
    _long = value;
  }

  int? _larg;

  int get largeur => _larg!;

  set larg(int value) {
    _larg = value;
  }

  int? _haut;

  int get hauteur => _haut!;

  set haut(int value) {
    _haut = value;
  }

  SuperficieEntity? _superficieEntity;

  SuperficieEntity get superficieEntity =>
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
      );

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
        (id, firstName, lastName, phone, email) => ContactOwnerEntity(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            email: email),
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
        (id, denomination) => MissionEntity(id: id, denomination: denomination),
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
        init: (MissionId id) => MissionEntity.init(id: id),
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
