import 'dart:convert';

import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/config/routes/ecosystem_modules.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MosaicHubState {
  final List<AppModule> modules;
  final bool isEditing;
  final Map<String, bool> pinnedStatus;
  final List<String> customOrder;

  MosaicHubState({
    required this.modules,
    required this.isEditing,
    required this.pinnedStatus,
    required this.customOrder,
  });

  MosaicHubState copyWith({
    List<AppModule>? modules,
    bool? isEditing,
    Map<String, bool>? pinnedStatus,
    List<String>? customOrder,
  }) {
    return MosaicHubState(
      modules: modules ?? this.modules,
      isEditing: isEditing ?? this.isEditing,
      pinnedStatus: pinnedStatus ?? this.pinnedStatus,
      customOrder: customOrder ?? this.customOrder,
    );
  }
}

class MosaicHubController extends Notifier<MosaicHubState> {
  static const String _prefsKeyPinned = 'mosaic_pinned_modules_v1';
  static const String _prefsKeyOrder = 'mosaic_module_order_v1';

  @override
  MosaicHubState build() {
    _loadPreferences();
    final defaultModules = List<AppModule>.from(EcosystemRegistry.modules);
    return MosaicHubState(
      modules: defaultModules,
      isEditing: false,
      pinnedStatus: {for (var m in defaultModules) m.id: m.isPinnedByDefault},
      customOrder: defaultModules.map((m) => m.id).toList(),
    );
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load pinned status
      final pinnedJson = prefs.getString(_prefsKeyPinned);
      Map<String, bool> pinned = {};
      if (pinnedJson != null) {
        final Map<String, dynamic> decoded = jsonDecode(pinnedJson);
        pinned = decoded.map((key, value) => MapEntry(key, value as bool));
      } else {
        for (var m in EcosystemRegistry.modules) {
          pinned[m.id] = m.isPinnedByDefault;
        }
      }

      // Load custom order
      final orderList = prefs.getStringList(_prefsKeyOrder);
      List<AppModule> allModules = List.from(EcosystemRegistry.modules);

      if (orderList != null && orderList.isNotEmpty) {
        allModules.sort((a, b) {
          final indexA = orderList.indexOf(a.id);
          final indexB = orderList.indexOf(b.id);
          if (indexA != -1 && indexB != -1) {
            return indexA.compareTo(indexB);
          }
          if (indexA != -1) return -1;
          if (indexB != -1) return 1;
          return a.sortOrder.compareTo(b.sortOrder);
        });
      } else {
        allModules.sort((a, b) {
          final pA = pinned[a.id] ?? a.isPinnedByDefault;
          final pB = pinned[b.id] ?? b.isPinnedByDefault;
          if (pA != pB) return pA ? -1 : 1;
          return a.sortOrder.compareTo(b.sortOrder);
        });
      }

      state = MosaicHubState(
        modules: allModules,
        isEditing: false,
        pinnedStatus: pinned,
        customOrder: allModules.map((m) => m.id).toList(),
      );
    } catch (_) {}
  }

  Future<void> _savePreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKeyPinned, jsonEncode(state.pinnedStatus));
      await prefs.setStringList(_prefsKeyOrder, state.customOrder);
    } catch (_) {}
  }

  void toggleEditMode() {
    state = state.copyWith(isEditing: !state.isEditing);
  }

  void setEditing(bool editing) {
    state = state.copyWith(isEditing: editing);
  }

  void togglePin(String moduleId) {
    final currentPinned = state.pinnedStatus[moduleId] ?? false;
    final newPinned = !currentPinned;
    final updatedPinned = Map<String, bool>.from(state.pinnedStatus);
    updatedPinned[moduleId] = newPinned;

    // Re-sort modules: pinned first, then custom order
    final sortedModules = List<AppModule>.from(state.modules);
    sortedModules.sort((a, b) {
      final pA = updatedPinned[a.id] ?? a.isPinnedByDefault;
      final pB = updatedPinned[b.id] ?? b.isPinnedByDefault;
      if (pA != pB) return pA ? -1 : 1;
      final idxA = state.customOrder.indexOf(a.id);
      final idxB = state.customOrder.indexOf(b.id);
      if (idxA != -1 && idxB != -1) return idxA.compareTo(idxB);
      return a.sortOrder.compareTo(b.sortOrder);
    });

    state = state.copyWith(
      modules: sortedModules,
      pinnedStatus: updatedPinned,
      customOrder: sortedModules.map((m) => m.id).toList(),
    );
    _savePreferences();
  }

  void reorderModules(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final list = List<AppModule>.from(state.modules);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    state = state.copyWith(
      modules: list,
      customOrder: list.map((m) => m.id).toList(),
    );
    _savePreferences();
  }
}

final mosaicHubProvider = NotifierProvider<MosaicHubController, MosaicHubState>(
  () => MosaicHubController(),
);
