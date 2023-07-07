import 'package:egote_services_v2/features/chat/presentation/views/screens/login_on_chat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/entities_extension.dart';
import '../../features/auth/presentation/views/screens/auth_screens.dart';
import '../../features/avis/presentation/view/avis_box_page.dart';
import '../../features/devis/presentation/views/screens/devis_edit_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/widget/godzylogo.dart';
import '../../features/settings/presentation/view/gallery/gallery.dart';
import '../../features/settings/presentation/view/settings_ui_page.dart';
import '../../features/sketch/presentation/view/drawing_page.dart';
import '../../features/theme/views/screen/theme_showcase_screen.dart';

part 'routes.g.dart';

/// [Route required Authentication]
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
              path: UserListRoute.path,
              name: 'userList',
              routes: [
                TypedGoRoute<AddUserFormRoute>(
                    path: AddUserFormRoute.path, name: 'userForm'),
              ]),
        ]),
    TypedGoRoute<GodzyLogoRoute>(
      path: GodzyLogoRoute.path,
      name: 'godzyRoute',
    ),
    TypedGoRoute<AvisBoxRoute>(
      path: AvisBoxRoute.path,
      name: 'avisRoute',
    ),
    TypedGoRoute<ChatRoute>(
      path: ChatRoute.path,
      name: 'chat',
    ),
    TypedGoRoute<SettingsUiRoute>(
        path: SettingsUiRoute.path,
        name: 'settingsRoute',
        routes: [
          TypedGoRoute<CrossPlatformSettingsRoute>(
            path: CrossPlatformSettingsRoute.path,
            name: 'crossPlatformRoute',
          ),
          TypedGoRoute<WebChromeAddressesRoute>(
            path: WebChromeAddressesRoute.path,
            name: 'webChromeAddressesRoute',
          ),
          TypedGoRoute<AndroidNotificationsRoute>(
            path: AndroidNotificationsRoute.path,
            name: 'androidNotificationsRoute',
          ),
          TypedGoRoute<WebChromeSettingsRoute>(
            path: WebChromeSettingsRoute.path,
            name: 'webChromeSettingsRoute',
          ),
        ]),
    TypedGoRoute<ThemeShowcaseRoute>(
        path: ThemeShowcaseRoute.path, name: 'themes')
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
    return HomeScreen(
      key: state.pageKey,
    );
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
    return UserHomeScreen(key: state.pageKey, pid: pid);
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
    return ProfileScreen(key: state.pageKey, uid: uid, pid: pid);
  }
}

class UserListRoute extends GoRouteData {
  static const path = 'userList/:uid';

  const UserListRoute({required this.pid, required this.uid});

  final String uid;
  final String pid;

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserListScreen(key: state.pageKey);
  }
}

class AddUserFormRoute extends GoRouteData {
  static const path = 'userForm/:uid&:pid';

  AddUserFormRoute({required this.uid, required this.pid});

  final String uid;
  final String pid;
  UserEntityModel? userEntityModel;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddUserFormScreen(
        key: state.pageKey, userEntityModel: userEntityModel);
  }
}

/// [Authentication Routes]
@TypedGoRoute<AuthRoute>(
  path: AuthRoute.path,
  name: 'auth',
  routes: <TypedGoRoute>[
    TypedGoRoute<LoginRoute>(
      path: LoginRoute.path,
      name: 'login',
    ),
    TypedGoRoute<SignUpRoute>(
      path: SignUpRoute.path,
      name: 'sign_up',
      routes: [
        TypedGoRoute<MFAEnrollRoute>(
          path: MFAEnrollRoute.path,
          name: 'enroll',
        ),
        TypedGoRoute<VerificationRoute>(
          path: VerificationRoute.path,
          name: 'verify',
        ),
      ],
    ),
    TypedGoRoute<ListMfaRoute>(
      path: ListMfaRoute.path,
      name: 'mfaList',
    ),
  ],
)
class AuthRoute extends GoRouteData {
  static const path = 'authRoute';

  const AuthRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthScreen(
      key: state.pageKey,
    );
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
    return LoginScreen(
      key: state.pageKey,
    );
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
    return SignUpScreen(
      key: state.pageKey,
    );
  }
}

class ListMfaRoute extends GoRouteData {
  static const path = 'mfaListRoute';

  const ListMfaRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListMfaScreen(key: state.pageKey);
  }
}

class MFAEnrollRoute extends GoRouteData {
  static const path = 'enrollRoute';

  const MFAEnrollRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final params = state.extra as VerificationScreenParams?;

    if (params == null) {
      throw 'Missing `VerificationScreenParams` object';
    }
    return MFAEnrollScreen(key: state.pageKey, params: params);
  }
}

class VerificationRoute extends GoRouteData {
  static const path = 'verificationRoute';

  const VerificationRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final params = state.extra as VerificationScreenParams?;

    if (params == null) {
      throw 'Missing `VerificationScreenParams` object';
    }
    return VerificationScreen(key: state.pageKey, params: params);
  }
}

/// [Themes Settings Pages Routes]
class SettingsUiRoute extends GoRouteData {
  static const path = 'settingsRoute';

  const SettingsUiRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsUiPage(
      key: state.pageKey,
    );
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
    return CrossPlatformSettingsScreen(
      key: state.pageKey,
    );
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
    return WebChromeAddressesScreen(
      key: state.pageKey,
    );
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
    return AndroidNotificationsScreen(
      key: state.pageKey,
    );
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
    return WebChromeSettings(
      key: state.pageKey,
    );
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
    return DrawingPage(
      key: state.pageKey,
    );
  }
}

class ThemeShowcaseRoute extends GoRouteData {
  static const path = 'themeshowcase';

  const ThemeShowcaseRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ThemeShowcasePage(
      key: state.pageKey,
    );
  }
}


class ChatRoute extends GoRouteData {
  static const path = 'chatRoute';

  const ChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginOnChat(key: state.pageKey,);
  }
}

/// [Other Pages Routes]
class DevisEditRoute extends GoRouteData {
  static const path = 'edit_devis:did';

  const DevisEditRoute({required this.did});

  final int did;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevisEditScreen(key: state.pageKey, did: did);
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
    return Godzylogo(
      key: state.pageKey,
    );
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
    return AvisBoxPage(
      key: state.pageKey,
    );
  }
}
