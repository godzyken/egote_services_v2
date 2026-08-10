import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/entities_extension.dart';
import '../../features/auth/presentation/views/screens/auth_screens.dart';
import '../../features/avis/presentation/view/avis_box_page.dart';
import '../../features/devis/presentation/views/screens/devis_edit_screen.dart';
import '../../features/devis/presentation/views/screens/devis_list_screen.dart';
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
          TypedGoRoute<DrawingRoute>(
              path: DrawingRoute.path, name: 'drawingRoute'),
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
    TypedGoRoute<DevisEditRoute>(
      path: DevisEditRoute.path,
      name: 'devis',
    ),
    TypedGoRoute<DevisListRoute>(
      path: DevisListRoute.path,
      name: 'devisList',
    ),
    TypedGoRoute<ChatRoute>(path: ChatRoute.path, name: 'chat', routes: [
      TypedGoRoute<SelectDialogRoute>(
          path: SelectDialogRoute.path,
          name: 'select_dialog',
          routes: [
            TypedGoRoute<ChatDialogRoute>(
                path: ChatDialogRoute.path, name: 'chat_dialog')
          ])
    ]),
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
class HomeRoute extends GoRouteData with $HomeRoute {
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

class UserHomeRoute extends GoRouteData with $UserHomeRoute {
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

class PersonRoute extends GoRouteData with $PersonRoute {
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

class UserListRoute extends GoRouteData with $UserListRoute {
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

class AddUserFormRoute extends GoRouteData with $AddUserFormRoute {
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
class AuthRoute extends GoRouteData with $AuthRoute {
  static const path = '/authRoute';

  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthScreen(
      key: state.pageKey,
    );
  }
}

class LoginRoute extends GoRouteData with $LoginRoute {
  static const path = 'loginRoute';

  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(
      key: state.pageKey,
    );
  }
}

class SignUpRoute extends GoRouteData with $SignUpRoute {
  static const path = 'signUpRoute';

  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpScreen(
      key: state.pageKey,
    );
  }
}

class ListMfaRoute extends GoRouteData with $ListMfaRoute {
  static const path = 'mfaListRoute';

  const ListMfaRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListMfaScreen(key: state.pageKey);
  }
}

class MFAEnrollRoute extends GoRouteData with $MFAEnrollRoute {
  static const path = 'enrollRoute';

  const MFAEnrollRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final params = state.extra as VerificationScreenParams?;

    if (params == null) {
      throw 'Missing `VerificationScreenParams` object';
    }
    return MFAEnrollScreen(key: state.pageKey, params: params);
  }
}

class VerificationRoute extends GoRouteData with $VerificationRoute {
  static const path = 'verificationRoute';

  const VerificationRoute();

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
class SettingsUiRoute extends GoRouteData with $SettingsUiRoute {
  static const path = 'settingsRoute';

  const SettingsUiRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsUiPage(
      key: state.pageKey,
    );
  }
}

class CrossPlatformSettingsRoute extends GoRouteData with $CrossPlatformSettingsRoute {
  static const path = 'crossPlatformRoute';

  const CrossPlatformSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CrossPlatformSettingsScreen(
      key: state.pageKey,
    );
  }
}

class WebChromeAddressesRoute extends GoRouteData with $WebChromeAddressesRoute {
  static const path = 'webChromeAddressesRoute';

  const WebChromeAddressesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebChromeAddressesScreen(
      key: state.pageKey,
    );
  }
}

class AndroidNotificationsRoute extends GoRouteData with $AndroidNotificationsRoute {
  static const path = 'androidNotificationsRoute';

  const AndroidNotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AndroidNotificationsScreen(
      key: state.pageKey,
    );
  }
}

class WebChromeSettingsRoute extends GoRouteData with $WebChromeSettingsRoute {
  static const path = 'webChromeSettingsRoute';

  const WebChromeSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebChromeSettings(
      key: state.pageKey,
    );
  }
}

class DrawingRoute extends GoRouteData with $DrawingRoute {
  static const path = 'drawingRoute';

  const DrawingRoute({required this.pid});

  final String pid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DrawingPage();
  }
}


class ThemeShowcaseRoute extends GoRouteData with $ThemeShowcaseRoute {
  static const path = 'themeshowcase';

  const ThemeShowcaseRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ThemeShowcasePage(
      key: state.pageKey,
    );
  }
}

class ChatRoute extends GoRouteData with $ChatRoute {
  static const path = 'chatRoute';

  const ChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginOnChat(
      key: state.pageKey,
    );
  }
}

class SelectDialogRoute extends GoRouteData with $SelectDialogRoute {
  static const path = 'selectDialogRoute:cid';

  int cid;

  SelectDialogRoute({required this.cid});

  CubeUser? currentUser;

  int? get _cid => cid = currentUser!.id!;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (_cid != cid) {
      return const LoginScreen();
    }

    return SelectDialogScreen(
      key: state.pageKey,
      currentUser: currentUser!,
    );
  }
}

class ChatDialogRoute extends GoRouteData with $ChatDialogRoute {
  static const path = 'chatDialogRoute:cdid';

  ChatDialogRoute({required this.cid, required this.cdid});

  int cid;
  CubeUser? currentUser;

  int? get _cid => cid = currentUser!.id!;

  int cdid;
  CubeDialog? cubeDialog;

  int? get _cdid => cdid = cubeDialog!.type!;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (_cid != cid && _cdid != cdid) {
      return const LoginScreen();
    }

    return ChatDialogScreen(
      key: state.pageKey,
      cubeUser: currentUser!,
      cubeDialog: cubeDialog!,
    );
  }
}

/// [Other Pages Routes]
class DevisEditRoute extends GoRouteData with $DevisEditRoute {
  static const path = 'edit_devis/:devisId';

  const DevisEditRoute({required this.devisId});

  final int devisId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final devisId = state.pathParameters['devisId'] as String;
    return DevisEditScreen(key: state.pageKey, devisId: devisId);
  }
}

class DevisListRoute extends GoRouteData with $DevisListRoute {
  static const path = 'devisList';

  const DevisListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevisListScreen(key: state.pageKey);
  }
}

class GodzyLogoRoute extends GoRouteData with $GodzyLogoRoute {
  static const path = 'godzyRoute';

  const GodzyLogoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Godzylogo(
      key: state.pageKey,
    );
  }
}

class AvisBoxRoute extends GoRouteData with $AvisBoxRoute {
  static const path = 'avisRoute';

  const AvisBoxRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AvisBoxPage(
      key: state.pageKey,
    );
  }
}
