import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_profile_providers.dart';

class ProfileCompletionGuard {
  final Ref ref;
  ProfileCompletionGuard(this.ref);

  bool get isComplete =>
      ref.read(userProfileProvider).valueOrNull?.isGuest ?? false;
}
