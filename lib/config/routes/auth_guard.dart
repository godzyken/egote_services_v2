import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/providers/user_profile_providers.dart';
import '../../features/home/domain/entities/notifier/application_state.dart';

class AuthGuard {
  final Ref ref;

  AuthGuard(this.ref);

  bool get isAuthenticated => ref.read(authStateProvider) != null;

  bool get hasMfaVerified =>
      ref.read(userProfileProvider).valueOrNull?.isGuest ?? false;

  bool get isCubeUserComplete =>
      ref.read(userProfileProvider).valueOrNull?.isGuest ?? false;

  /// Garde logique principale
  String? handleRedirect(GoRouterState state) {
    final path = state.fullPath ?? '';

    // 🔓 Routes toujours publiques
    const publicPaths = [
      '/',
      '/avisRoute',
      '/user_home'
          '/user_home/person'
          '/user_home/userList'
          '/chat'
          '/documents',
      '/documents/devis',
      '/documents/devisList',
      '/documents/produitList',
      '/documents/produitEdit',
      '/documents/produitDétails',
      '/godzyRoute'
          '/settingsRoute',
      '/settingsRoute/crossPlatformRoute',
      '/settingsRoute/webChromeAddressesRoute',
      '/settingsRoute/androidNotificationsRoute',
      '/settingsRoute/webChromeSettingsRoute',
      '/settingsRoute/drawingRoute',
      '/settingsRoute/permissionRoute',
      '/settingsRoute/networkRoute',
      '/settingsRoute/devicesRoute',
      '/settingsRoute/notificationRoute',
      '/themes',
    ];

    if (publicPaths.any((public) => path.startsWith(public))) {
      return null;
    }

    // 🔐 Pages de modification utilisateur ou documents
    final needsAuthPaths = [
      '/users',
      '/documents',
    ];
    final needsAuth = needsAuthPaths.any((p) => path.startsWith(p));
    if (needsAuth && !isAuthenticated) {
      return '/auth';
    }

    // 🧱 Chat + Vidéo => Auth + MFA + profil complet
    if (path.startsWith('/chat')) {
      if (!isAuthenticated) return '/auth';
      if (!hasMfaVerified) return '/mfa-verification';
      if (!isCubeUserComplete) return '/profile/setup';
    }

    return null; // ✅ autorisé
  }
}
