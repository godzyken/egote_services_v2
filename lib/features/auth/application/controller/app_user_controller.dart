import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/firebase/firebase_providers.dart';
import '../model/user_app_role.dart';
import '../wrapper/adapter/app_user.dart';

class AppUserController extends StateNotifier<AppUser?> {
  AppUserController(this._ref) : super(null);

  final Ref _ref;

  Future<void> loadUser() async {
    final uid = getCurrentUserId();
    final data = await _ref
        .read(supabaseClientProvider)
        .from('users')
        .select()
        .eq('id', uid)
        .single();
    state = AppUser(
      uid: uid,
      email: data['email'],
      level: parseUserRole(data['role']),
    );
  }

  getCurrentUserId() {
    final user = _ref.read(authStateChangesProvider).value;
    if (user == null) {
      throw Exception('Aucun utilisateur connecté');
    }
    return user.uid;
  }
}
