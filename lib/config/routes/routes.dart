import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/screens/auth_screens.dart';
import '../../features/avis/presentation/view/avis_box_page.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/widget/godzylogo.dart';
import '../../features/settings/presentation/view/gallery/gallery.dart';
import '../../features/settings/presentation/view/settings_ui_page.dart';
import '../../features/sketch/presentation/view/drawing_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  name: 'home',
  routes: [
    TypedGoRoute<UserHomeRoute>(
        path: UserHomeRoute.path,
        name: 'user_home',
        routes: [
          TypedGoRoute<PersonRoute>(
              path: PersonRoute.path, name: 'person', routes: []),
          TypedGoRoute<UserListRoute>(
              path: UserListRoute.path, name: 'userList', routes: []),
        ]),
    TypedGoRoute<GodzyLogoRoute>(
        path: GodzyLogoRoute.path,
        name: 'godzyRoute',),
    TypedGoRoute<AvisBoxRoute>(
        path: AvisBoxRoute.path,
        name: 'avisRoute',),
    TypedGoRoute<SettingsUiRoute>(
        path: SettingsUiRoute.path,
        name: 'settingsRoute',
        routes: [
          TypedGoRoute<CrossPlatformSettingsRoute>(
            path: CrossPlatformSettingsRoute.path,
            name: 'crossPlatformRoute',),
          TypedGoRoute<WebChromeAddressesRoute>(
            path: WebChromeAddressesRoute.path,
            name: 'webChromeAddressesRoute',),
          TypedGoRoute<AndroidNotificationsRoute>(
            path: AndroidNotificationsRoute.path,
            name: 'androidNotificationsRoute',),
          TypedGoRoute<WebChromeSettingsRoute>(
            path: WebChromeSettingsRoute.path,
            name: 'webChromeSettingsRoute',),
        ]
    ),
  ],
)
class HomeRoute extends GoRouteData {
  static const path = '/';
  const HomeRoute();

/*  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final userRole = await ProviderScope.containerOf(context).read(permissionsProvider.future);
    return userRole
  } */
  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener


  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class UserHomeRoute extends GoRouteData {
  static const path = 'user_home/:pid';
  const UserHomeRoute({required this.pid});

  final String pid;

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserHomeScreen(pid: pid);
  }
}

class PersonRoute extends GoRouteData {
  static const path = 'person/:uid';
  const PersonRoute({required this.uid, required this.pid});

  final String uid;
  final String pid;
  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileScreen(uid: uid, pid: pid);
  }
}

class UserListRoute extends GoRouteData {
  static const path = 'person/:uid';
  const UserListRoute({required this.uid, required this.pid});

  final String uid;
  final String pid;
  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserListScreen(uid: uid, pid: pid);
  }
}

@TypedGoRoute<AuthRoute>(path: AuthRoute.path, name: 'auth', routes: [
  TypedGoRoute<LoginRoute>(
      path: LoginRoute.path,
      name: 'loginRoute',
  ),
  TypedGoRoute<SignUpRoute>(
      path: SignUpRoute.path,
      name: 'signUpRoute',
  ),
])
class AuthRoute extends GoRouteData {
  static const path = 'authRoute';
  const AuthRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthScreen();
  }
}

class LoginRoute extends GoRouteData {
  static const path = 'loginRoute';
  const LoginRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

class SignUpRoute extends GoRouteData {
  static const path = 'signUpRoute';
  const SignUpRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

class DevisEditRoute extends GoRouteData {
  static const path = 'edit_devis:did';
  const DevisEditRoute({required this.did});

  final int did;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevisEditScreen(did: did);
  }
}

class GodzyLogoRoute extends GoRouteData {
  static const path = 'godzyRoute';
  const GodzyLogoRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Godzylogo();
  }
}

class AvisBoxRoute extends GoRouteData {
  static const path = 'avisRoute';
  const AvisBoxRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AvisBoxPage();
  }
}

class SettingsUiRoute extends GoRouteData {
  static const path = 'settingsRoute';
  const SettingsUiRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsUiPage();
  }
}

class CrossPlatformSettingsRoute extends GoRouteData {
  static const path = 'crossPlatformRoute';
  const CrossPlatformSettingsRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CrossPlatformSettingsScreen();
  }
}

class WebChromeAddressesRoute extends GoRouteData {
  static const path = 'webChromeAddressesRoute';
  const WebChromeAddressesRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WebChromeAddressesScreen();
  }
}

class AndroidNotificationsRoute extends GoRouteData {
  static const path = 'androidNotificationsRoute';
  const AndroidNotificationsRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AndroidNotificationsScreen();
  }
}

class WebChromeSettingsRoute extends GoRouteData {
  static const path = 'webChromeSettingsRoute';
  const WebChromeSettingsRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WebChromeSettings();
  }
}

class DrawingRoute extends GoRouteData {
  static const path = 'drawingRoute';
  const DrawingRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DrawingPage();
  }
}
