import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents the status of a synchronization operation.
enum SyncStatus { idle, syncing, success, error }

class SyncState {
  final SyncStatus status;
  final String? errorMessage;
  final DateTime? lastSyncedAt;

  const SyncState({
    this.status = SyncStatus.idle,
    this.errorMessage,
    this.lastSyncedAt,
  });

  SyncState copyWith({
    SyncStatus? status,
    String? errorMessage,
    DateTime? lastSyncedAt,
  }) {
    return SyncState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}

/// A reusable [Notifier] base class providing concurrency locking (mutex guard)
/// to prevent overlapping synchronization tasks and handle silent errors.
class SyncNotifier extends Notifier<SyncState> {
  @override
  SyncState build() {
    return const SyncState();
  }

  /// Executes a synchronization task with a concurrency guard.
  /// If a sync is already in progress, subsequent calls are ignored.
  Future<bool> executeSync(
    Future<void> Function() syncTask, {
    String name = 'Sync',
  }) async {
    if (state.status == SyncStatus.syncing) {
      debugPrint(
        '⚠️ [SyncNotifier] $name: Sync already in progress. Skipping overlapping request.',
      );
      return false;
    }

    state = state.copyWith(status: SyncStatus.syncing, errorMessage: null);
    debugPrint('🔄 [SyncNotifier] $name: Starting synchronization...');

    try {
      await syncTask();
      state = SyncState(
        status: SyncStatus.success,
        lastSyncedAt: DateTime.now(),
      );
      debugPrint(
        '✅ [SyncNotifier] $name: Synchronization completed successfully.',
      );
      return true;
    } catch (e, stackTrace) {
      debugPrint('❌ [SyncNotifier] $name: Synchronization failed: $e');
      debugPrint('$stackTrace');
      state = SyncState(
        status: SyncStatus.error,
        errorMessage: e.toString(),
        lastSyncedAt: state.lastSyncedAt,
      );
      return false;
    }
  }
}

/// Global provider for general synchronization tasks.
final syncNotifierProvider = NotifierProvider<SyncNotifier, SyncState>(
  SyncNotifier.new,
  name: 'syncNotifierProvider',
);
