import 'dart:developer' as developer;

import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/devis_states/devis_entity_states.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/travaux_states/travaux_entity_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/states/entities/mission_states/mission_entity_states.dart';

class DevisStateNotifier extends StateNotifier<DevisEntityStates> {
  DevisStateNotifier(Ref ref) : super(DevisEntityStates.initial());

  void addDevis(String item) {
    final devis = DevisModelEntity.initialize(
        id: DevisId(id: int.parse(item)), createdAt: DateTime.parse(item));
    state = state.copyWith(
      devis: state.devis..add(devis),
    );
    developer.log('[${state.devis}]');
  }

  void removeDevis(DevisId id) {
    final devis =
        DevisModelEntity.initialize(id: id, createdAt: DateTime.timestamp());
    state = state.copyWith(
      devis: state.devis..remove(devis),
    );
    developer.log('[${state.devis}]');
  }
}

final devisStateNotifierProvider =
    StateNotifierProvider<DevisStateNotifier, DevisEntityStates>(
        (ref) => DevisStateNotifier(ref));

class TravauxStateNotifier extends StateNotifier<TravauxEntityStates> {
  TravauxStateNotifier(Ref ref) : super(TravauxEntityStates.initial());

  void addTravaux(String item) {
    final travaux = TravauxEntity.Init(
      id: TravauId(id: int.parse(item)),
    );
    state = state.copyWith(travaux: state.travaux..add(travaux));

    developer.log('[${state.travaux}]');
  }

  void removedTravaux(TravauId id) {
    final travaux = TravauxEntity.Init(id: id);
    state = state.copyWith(travaux: state.travaux..remove(travaux));

    developer.log('[${state.travaux}]');
  }
}

final travauxStateNotifierProvider =
    StateNotifierProvider<TravauxStateNotifier, TravauxEntityStates>(
        (ref) => TravauxStateNotifier(ref));

class MissionStateNotifier extends StateNotifier<MissionEntityStates> {
  MissionStateNotifier(Ref ref) : super(MissionEntityStates.init());

  void addMission(String item) {
    final mission = MissionEntity.init(
      id: MissionId(id: int.parse(item)),
    );
    state =
        state.copyWith(missionEntities: state.missionEntities..add(mission));

    developer.log('[${state.missionEntities}]');
  }

  void removedMission(MissionId id) {
    final mission = MissionEntity.init(id: id);
    state =
        state.copyWith(missionEntities: state.missionEntities..remove(mission));

    developer.log('[${state.missionEntities}]');
  }
}

final missionStateNotifierProvider =
    StateNotifierProvider<MissionStateNotifier, MissionEntityStates>(
        (ref) => MissionStateNotifier(ref));

final _travaux = Provider<List<TravauxEntity>>(
    (ref) => ref.watch(travauxStateNotifierProvider).travaux);

final travauxListProvider =
    Provider<List<TravauxEntity>>((ref) => ref.watch(_travaux));

final _missions = Provider<List<MissionEntity>>(
    (ref) => ref.watch(missionStateNotifierProvider).missionEntities);

final missionsListProvider =
    Provider<List<MissionEntity>>((ref) => ref.watch(_missions));
