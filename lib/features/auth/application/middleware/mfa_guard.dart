import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_profile_providers.dart';

class MfaGuard {
  final Ref ref;
  MfaGuard(this.ref);

  bool get isVerified =>
      ref.read(userProfileProvider).valueOrNull?.isGuest ?? false;
}
