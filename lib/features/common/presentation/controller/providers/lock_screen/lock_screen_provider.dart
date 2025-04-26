import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/states/lock_screen_state.dart';

final lockScreenProvider = StateProvider<bool>((ref) => false);

class LockScreenNotifier extends StateNotifier<LockScreenState> {
  LockScreenNotifier()
      : super(LockScreenState(isLocked: false, lastActive: DateTime.now()));

  void lockScreen() {
    //state = state.copyWith(isLocked: true);
  }
}
