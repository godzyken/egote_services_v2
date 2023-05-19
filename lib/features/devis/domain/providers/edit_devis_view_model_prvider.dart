import 'package:egote_services_v2/features/common/domain/entities/states/state.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/superficie_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis/devis_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/images/assets_images.dart';
import '../../../../config/app_shared/images/list_local.dart';
import '../entities/construction/mission_entity.dart';
import '../entities/contact/contact_owner_entity.dart';

final editDeviViewModelProvider = StateNotifierProvider<
    EditDeviViewModelController,
    State<AsyncValue<DevisEntity>>>((ref) => EditDeviViewModelController());

class EditDeviViewModelController
    extends StateNotifier<State<AsyncValue<DevisEntity>>> {
  EditDeviViewModelController([DevisEntity? devisEntity])
      : super(const State.init());

  DevisEntity initial = DevisEntity.empty();
  SuperficieEntity initialSup =
      const SuperficieEntity.initialize(longueur: 0, largeur: 0, hauteur: 0);
  TravauxEntity initialTra =
      const TravauxEntity(id: 0, denomination: 'denomination');
  ContactOwnerEntity initialContact = const ContactOwnerEntity.empty();
  MissionEntity initialMission =
      const MissionEntity(id: 0, denomination: 'denomination');

  bool get edit => initial.toJson().isNotEmpty;

  DevisEntity get devis => initial.when(
        complete: (id,
            numDevis,
            statusModel,
            typesConstructionModel,
            superficieEntity,
            travauxEntity,
            contactOwnerEntity,
            missionEntity) {
          try {
            state = const State.loading();

            if (id != 0 && numDevis.isNotEmpty) {
              final DevisEntity newDevis = DevisEntity.complete(
                  id: id,
                  numDevis: _numDevis!,
                  statusModel: _statusModel,
                  typesConstructionModel: _constructionModel,
                  superficieEntity: _superficieEntity,
                  travauxEntity: _travauxEntity,
                  contactOwnerEntity: _contactOwnerEntity,
                  missionEntity: _missionEntity);
              state = State.success(AsyncValue.data(newDevis));
              return newDevis;
            }
            return DevisEntity.empty();
          } on Exception catch (e) {
            state = State.error(e);
            return const DevisEntity.initialize(id: 0, numDevis: '0');
          }
        },
        initialize: (id, numDevis) {
          return DevisEntity.initialize(id: id, numDevis: numDevis);
        },
        empty: () => DevisEntity.empty(),
      );

  String? _numDevis;
  String get numDevis => _numDevis ?? '0';
  set numDevis(String value) {
    _numDevis = value;
  }

  StatusModel? _statusModel;
  StatusModel get statusModel {
    switch (_statusModel) {
      case null:
        return _statusModel!;
      case StatusModel.locataire:
        _statusModel = StatusModel.locataire;
        return _statusModel!;
      case StatusModel.proprietaire:
        _statusModel = StatusModel.proprietaire;
        return _statusModel!;
    }
  }

  set statusModel(StatusModel value) {
    _statusModel = value;
  }

  TypesConstructionModel? _constructionModel;
  TypesConstructionModel get constructionModel {
    switch (_constructionModel) {
      case TypesConstructionModel.apartment:
        _constructionModel = TypesConstructionModel.apartment;
        return _constructionModel!;
      case TypesConstructionModel.house:
        _constructionModel = TypesConstructionModel.house;
        return _constructionModel!;
      case null:
        return _constructionModel!;
    }
  }

  set constructionModel(TypesConstructionModel value) {
    _constructionModel = value;
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
  State get _loading => const State.loading();

  bool get enabled =>
      numDevis.isNotEmpty && travauxEntity.denomination.isNotEmpty;
}
