import 'package:egote_services_v2/config/providers/workmanager/workmanager_callback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

final workmanagerProvider = Provider<Workmanager>((ref) => Workmanager());

final workmanagerNotifierProvider =
    NotifierProvider<WorkmanagerNotifier, void>(() => WorkmanagerNotifier());

class WorkmanagerNotifier extends Notifier<void> {
  late final Workmanager _workmanager;

  @override
  void build() {
    _workmanager = Workmanager();
  }

  Future<void> initialize() async {
    await _workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  }

  Future<void> registerOneOff(
      {required String taskName,
      Map<String, dynamic>? inputData,
      bool constraintsNetwork = false}) async {
    await _workmanager.registerOneOffTask(
      taskName,
      taskName,
      inputData: inputData,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: constraintsNetwork
          ? Constraints(networkType: NetworkType.connected)
          : null,
    );
  }

  Future<void> registerPeriodic(
      {required String taskName,
      Duration frequency = const Duration(hours: 1),
      Map<String, dynamic>? inputData,
      bool constraintsNetwork = false}) async {
    await _workmanager.registerPeriodicTask(
      taskName,
      taskName,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(
        networkType: constraintsNetwork
            ? NetworkType.connected
            : NetworkType.not_required,
      ),
      frequency: frequency,
      inputData: inputData,
    );
  }

  Future<void> cancelTask(String taskName) async {
    await _workmanager.cancelByUniqueName(taskName);
  }

  Future<void> cancelAllTasks() async {
    await _workmanager.cancelAll();
  }
}
