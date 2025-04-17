import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/admin_shell.dart';
import '../../features/admin/presentation/views/screens/admin_screens.dart';
import '../../features/auth/domain/entities/user/user_entity.dart';
import '../../features/auth/presentation/views/screens/auth_screens.dart';
import '../../features/avis/presentation/view/avis_box_page.dart';
import '../../features/chat/presentation/views/screens/chat_screens.dart';
import '../../features/devis/presentation/views/screens/devis_edit_screen.dart';
import '../../features/devis/presentation/views/screens/devis_list_screen.dart';
import '../../features/devis/presentation/views/screens/document_view_screen.dart';
import '../../features/devis/presentation/views/screens/product_details_screen.dart';
import '../../features/devis/presentation/views/screens/product_edit_screen.dart';
import '../../features/devis/presentation/views/screens/product_list_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/widget/godzylogo.dart';
import '../../features/settings/presentation/view/gallery/gallery.dart';
import '../../features/settings/presentation/view/settings_ui_page.dart';
import '../../features/sketch/presentation/view/drawing_page.dart';
import '../../features/theme/views/screen/theme_showcase_screen.dart';

part 'routes.g.dart';

/// [Route required Authentication]
///
/// [Home Routes]

final homeShellRoute = StatefulShellRoute.indexedStack(branches: [
  StatefulShellBranch(initialLocation: '/home', routes: [
    GoRouteData.$route(
        path: HomeRoute.path,
        name: 'home',
        factory: (context) => const HomeRoute(),
        routes: [
          GoRouteData.$route(
              path: UserHomeRoute.path,
              name: 'user_home',
              factory: (context) => const UserHomeRoute(pid: '1'),
              routes: [
                GoRouteData.$route(
                    path: UserProfileScreenRoute.path,
                    name: 'user-profile',
                    factory: (context) {
                      final id = context.pathParameters['id']!;
                      return UserProfileScreenRoute(id: id);
                    }),
                GoRouteData.$route(
                    path: PersonRoute.path,
                    name: 'person',
                    factory: (context) {
                      final uid = context.pathParameters['uid'];
                      final personId = context.pathParameters['personId'];
                      return PersonRoute(uid: uid!, personId: personId!);
                    }),
                GoRouteData.$route(
                  path: UserListRoute.path,
                  name: 'userList',
                  factory: (context) => const UserListRoute(),
                  routes: [
                    GoRouteData.$route(
                      path: AddUserFormRoute.path,
                      name: 'userForm',
                      factory: (context) => AddUserFormRoute(),
                    ),
                    GoRouteData.$route(
                      path: UserProfileScreenRoute.path,
                      name: 'user-profile',
                      factory: (context) =>
                          const UserProfileScreenRoute(id: ''),
                    )
                  ],
                ),
              ]),
          GoRouteData.$route(
              path: ChatRoute.path,
              name: 'chat',
              factory: (context) => const GodzyLogoRoute(),
              routes: [
                GoRouteData.$route(
                    path: LoginOnChatRoute.path,
                    name: 'loginOnChat',
                    factory: (context) => const LoginOnChatRoute(),
                    routes: [
                      GoRouteData.$route(
                          path: SelectDialogRoute.path,
                          name: 'select_dialog',
                          factory: (context) => SelectDialogRoute(cid: 0),
                          routes: [
                            GoRouteData.$route(
                                path: ChatDialogRoute.path,
                                name: 'chat_dialog',
                                factory: (context) => ChatDialogRoute(),
                                routes: [
                                  GoRouteData.$route(
                                    path: ChatVideoScreenRoute.path,
                                    name: 'chat_room',
                                    factory: (context) =>
                                        ChatVideoScreenRoute(),
                                  ),
                                ])
                          ]),
                    ])
              ]),
        ]),
    GoRouteData.$route(
      path: GodzyLogoRoute.path,
      name: 'godzyRoute',
      factory: (context) => const GodzyLogoRoute(),
    ),
    GoRouteData.$route(
      path: AvisBoxRoute.path,
      name: 'avisRoute',
      factory: (context) {
        final id = int.parse(context.pathParameters['id']!);
        return AvisBoxRoute(avisId: id);
      },
    ),
    GoRouteData.$route(
        path: DocumentPreviewRoute.path,
        name: 'documents',
        factory: (context) => const DocumentPreviewRoute(),
        routes: [
          GoRouteData.$route(
            path: DevisEditRoute.path,
            name: 'devis',
            factory: (context) => const DevisEditRoute(devisId: 0),
          ),
          GoRouteData.$route(
              path: DevisListRoute.path,
              name: 'devisList',
              factory: (context) => const DevisListRoute(),
              routes: [
                GoRouteData.$route(
                  path: ProduitListRoute.path,
                  name: 'produitList',
                  factory: (context) => const ProduitListRoute(),
                ),
                GoRouteData.$route(
                  path: ProduitEditRoute.path,
                  name: 'produitEdit',
                  factory: (context) => const ProduitEditRoute(prodId: 0),
                ),
                GoRouteData.$route(
                  path: ProduitDetailsRoute.path,
                  name: 'produitDetails',
                  factory: (context) => const ProduitDetailsRoute(prodId: 0),
                )
              ]),
        ]),
    GoRouteData.$route(
        path: SettingsUiRoute.path,
        name: 'settingsRoute',
        factory: (context) => const SettingsUiRoute(),
        routes: [
          GoRouteData.$route(
            path: CrossPlatformSettingsRoute.path,
            name: 'crossPlatformRoute',
            factory: (context) => const CrossPlatformSettingsRoute(),
          ),
          GoRouteData.$route(
            path: WebChromeAddressesRoute.path,
            name: 'webChromeAddressesRoute',
            factory: (context) => const WebChromeAddressesRoute(),
          ),
          GoRouteData.$route(
            path: AndroidNotificationsRoute.path,
            name: 'androidNotificationsRoute',
            factory: (context) => const AndroidNotificationsRoute(),
          ),
          GoRouteData.$route(
            path: WebChromeSettingsRoute.path,
            name: 'webChromeSettingsRoute',
            factory: (context) => const WebChromeSettingsRoute(),
          ),
          GoRouteData.$route(
            path: DrawingRoute.path,
            name: 'drawingRoute',
            factory: (context) => const DrawingRoute(),
          ),
          GoRouteData.$route(
            path: PermissionRoute.path,
            name: 'permissionRoute',
            factory: (context) => const PermissionRoute(),
          ),
          GoRouteData.$route(
            path: NetworkScreenRoute.path,
            name: 'networkRoute',
            factory: (context) => const NetworkScreenRoute(),
          ),
          GoRouteData.$route(
            path: DevicesScreenRoute.path,
            name: 'devicesRoute',
            factory: (context) => const DevicesScreenRoute(),
          ),
          GoRouteData.$route(
            path: NotificationsScreenRoute.path,
            name: 'notificationRoute',
            factory: (context) => const NotificationsScreenRoute(),
          ),
          GoRouteData.$route(
            path: ThemeShowcaseRoute.path,
            name: 'themes',
            factory: (context) => const ThemeShowcaseRoute(),
          )
        ]),
  ])
]);

final authShellRoute = StatefulShellRoute.indexedStack(
    branches: [
      StatefulShellBranch(initialLocation: '/auth', routes: [
        GoRouteData.$route(
            path: AuthRoute.path,
            name: 'auth',
            factory: (context) => const AuthRoute(),
            routes: [
              GoRouteData.$route(
                  path: LoginRoute.path,
                  name: 'login',
                  factory: (context) => const LoginRoute()),
              GoRouteData.$route(
                path: SignUpRoute.path,
                name: 'sign_up',
                factory: (context) => const SignUpRoute(),
              ),
              GoRouteData.$route(
                  path: ListMfaRoute.path,
                  name: 'mfaList',
                  factory: (context) => const ListMfaRoute(),
                  routes: [
                    GoRouteData.$route(
                      path: MFAEnrollRoute.path,
                      name: 'enroll',
                      factory: (context) => const MFAEnrollRoute(),
                    ),
                    GoRouteData.$route(
                      path: VerificationRoute.path,
                      name: 'verify',
                      factory: (context) => const VerificationRoute(),
                    ),
                  ]),
            ]),
      ])
    ],
    builder: (context, state, navigationShell) {
      return Scaffold(
        body: navigationShell,
      );
    });

final adminShellRoute = StatefulShellRoute.indexedStack(
    branches: [
      StatefulShellBranch(
        initialLocation: '/admin',
        routes: [
          GoRouteData.$route(
              path: AdminShellRoute.path,
              name: AdminShellRoute.name,
              factory: (context) => const AdminDashboardRoute(),
              routes: [
                GoRouteData.$route(
                  path: AdminDashboardRoute.path,
                  name: AdminDashboardRoute.name,
                  factory: (context) => const AdminDashboardRoute(),
                ),
                GoRouteData.$route(
                  path: AdminUsersRoute.path,
                  name: AdminUsersRoute.name,
                  factory: (context) => const AdminUsersRoute(),
                ),
                GoRouteData.$route(
                  path: AdminProductsRoute.path,
                  name: AdminProductsRoute.name,
                  factory: (context) => const AdminProductsRoute(),
                ),
                GoRouteData.$route(
                  path: AdminOrdersRoute.path,
                  name: AdminOrdersRoute.name,
                  factory: (context) => const AdminOrdersRoute(),
                ),
                GoRouteData.$route(
                  path: AdminReviewsRoute.path,
                  name: AdminReviewsRoute.name,
                  factory: (context) => const AdminReviewsRoute(),
                ),
                GoRouteData.$route(
                  path: AdminCategoriesRoute.path,
                  name: AdminCategoriesRoute.name,
                  factory: (context) => const AdminCategoriesRoute(),
                ),
                GoRouteData.$route(
                  path: AdminSettingsRoute.path,
                  name: AdminSettingsRoute.name,
                  factory: (context) => const AdminSettingsRoute(),
                ),
                GoRouteData.$route(
                  path: AdminSupportRoute.path,
                  name: AdminSupportRoute.name,
                  factory: (context) => const AdminSupportRoute(),
                ),
              ]),
        ],
      ),
    ],
    builder: (context, state, navigationShell) {
      return AdminShell(navigationShell: navigationShell);
    });

final supportShellRoute = StatefulShellRoute.indexedStack(
    branches: [
      StatefulShellBranch(
        initialLocation: '/support',
        routes: [
          GoRouteData.$route(
            path: SupportRoute.path,
            name: SupportRoute.name,
            factory: (context) => SupportRoute(),
            routes: [
              GoRouteData.$route(
                path: SupportTicketsRoute.path,
                name: SupportTicketsRoute.name,
                factory: (context) => SupportTicketsRoute(),
              ),
              GoRouteData.$route(
                path: SupportFAQRoute.path,
                name: SupportFAQRoute.name,
                factory: (context) => SupportFAQRoute(),
              ),
            ],
          ),
        ],
      ),
    ],
    builder: (context, state, navigationShell) {
      final preload = state.extra as bool? ?? false;

      return AppBarConnection(
        preload: preload,
        child: navigationShell,
      );
    });

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
                TypedGoRoute<UserProfileScreenRoute>(
                    path: UserProfileScreenRoute.path, name: 'user-profile'),
              ]),
        ]),
    TypedGoRoute<GodzyLogoRoute>(
      path: GodzyLogoRoute.path,
      name: 'godzyRoute',
    ),
    TypedGoRoute<AvisBoxRoute>(
      path: AvisBoxRoute.path,
      name: '/avisRoute',
    ),
    TypedGoRoute<DocumentPreviewRoute>(
        path: DocumentPreviewRoute.path,
        name: 'documents',
        routes: [
          TypedGoRoute<DevisEditRoute>(
            path: DevisEditRoute.path,
            name: 'devis',
          ),
          TypedGoRoute<DevisListRoute>(
            path: DevisListRoute.path,
            name: 'devisList',
          ),
          TypedGoRoute<ProduitListRoute>(
            path: ProduitListRoute.path,
            name: 'produitList',
          ),
          TypedGoRoute<ProduitEditRoute>(
            path: ProduitEditRoute.path,
            name: 'produitEdit',
          ),
          TypedGoRoute<ProduitDetailsRoute>(
            path: ProduitDetailsRoute.path,
            name: 'produitDetails',
          ),
        ]),
    TypedGoRoute<ChatRoute>(path: ChatRoute.path, name: 'chat', routes: [
      TypedGoRoute<SelectDialogRoute>(
          path: SelectDialogRoute.path,
          name: 'select_dialog',
          routes: [
            TypedGoRoute<ChatDialogRoute>(
                path: ChatDialogRoute.path, name: 'chat_dialog')
          ])
    ]),
    TypedGoRoute<ChatVideoScreenRoute>(
        path: ChatVideoScreenRoute.path,
        name: 'chat_room',
        routes: [
          TypedGoRoute<JoinScreenRoute>(
              path: JoinScreenRoute.path,
              name: 'join_screen',
              routes: [
                TypedGoRoute<CallScreenRoute>(
                    path: CallScreenRoute.path, name: 'call_screen')
              ]),
          TypedGoRoute<AddOccupantScreenRoute>(
              path: AddOccupantScreenRoute.path,
              name: 'add_occupant_screen',
              routes: [
                TypedGoRoute<CallScreenRoute>(
                    path: CallScreenRoute.path, name: 'call_screen')
              ]),
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
          TypedGoRoute<DrawingRoute>(
            path: DrawingRoute.path,
            name: 'drawingRoute',
          ),
          TypedGoRoute<PermissionRoute>(
            path: PermissionRoute.path,
            name: 'permissionRoute',
          ),
          TypedGoRoute<NetworkScreenRoute>(
            path: NetworkScreenRoute.path,
            name: 'networkRoute',
          ),
          TypedGoRoute<DevicesScreenRoute>(
            path: DevicesScreenRoute.path,
            name: 'devicesRoute',
          ),
          TypedGoRoute<NotificationsScreenRoute>(
            path: NotificationsScreenRoute.path,
            name: 'notificationRoute',
          ),
        ]),
    TypedGoRoute<ThemeShowcaseRoute>(
        path: ThemeShowcaseRoute.path, name: 'themes'),
  ],
)
class HomeRoute extends GoRouteData {
  static const path = '/';

  const HomeRoute();

/*  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final userRole = await ProviderScope.containerOf(context)
        .read(userStreamProvider.future);
    final preload = state.extra as bool? ?? false;
    if (userRole!.isAnonymous) {
      return await Future.delayed(Duration(seconds: 1), () => '/authRoute');
    }

    return Future.delayed(
        Duration(seconds: 1), () => '/user_home/${userRole.uid}/$preload');
  }*/
  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final preload = state.extra as bool? ?? false;
    return preload == true
        ? AppBarConnection(preload: preload, child: context.widget)
        : HomeScreen(
            key: state.pageKey,
          );
  }
}

class UserProfileScreenRoute extends GoRouteData {
  static const path = '/user-profile/:id';
  final String id;
  const UserProfileScreenRoute({required this.id});

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserProfileScreen(userId: id);
  }
}

class UserHomeRoute extends GoRouteData {
  static const path = '/user-home/:pid';

  const UserHomeRoute({required this.pid});

  final String pid;

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final preload = state.extra as bool? ?? false;
    return UserHomeScreen(key: state.pageKey, pid: pid, preload: preload);
  }
}

class PersonRoute extends GoRouteData {
  static const path = '/users/:uid/:personId';

  const PersonRoute({required this.uid, required this.personId});

  final String uid;
  final String personId;

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final personId = state.pathParameters['personId'];
    return ProfileScreen(key: state.pageKey, uid: uid, pid: personId!);
  }
}

class UserListRoute extends GoRouteData {
  static const path = '/userList';

  const UserListRoute();

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserListScreen(key: state.pageKey);
  }
}

class AddUserFormRoute extends GoRouteData {
  static const path = '/userForm';

  AddUserFormRoute();

  UserEntityModel? userEntityModel;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddUserFormScreen(
        key: state.pageKey, userEntityModel: userEntityModel);
  }
}

/// [Authentication Routes]
///
/// [Auth Routes]

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
  static const path = '/authRoute';

  const AuthRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthScreen(
      key: state.pageKey,
      child: context.widget,
    );
  }
}

class LoginRoute extends GoRouteData {
  static const path = '/loginRoute';

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
  static const path = '/signUpRoute';

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
  static const path = '/mfaListRoute';

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
  static const path = '/enrollRoute';

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
  static const path = '/verificationRoute';

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
  static const path = '/settingsRoute';

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
  static const path = '/crossPlatformRoute';

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
  static const path = '/webChromeAddressesRoute';

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
  static const path = '/androidNotificationsRoute';

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
  static const path = '/webChromeSettingsRoute';

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
  static const path = '/drawingRoute';

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

class PermissionRoute extends GoRouteData {
  static const path = '/permissionRoute';

  const PermissionRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PermissionScreen(
      key: state.pageKey,
    );
  }
}

class NetworkScreenRoute extends GoRouteData {
  static const path = '/networkRoute';

  const NetworkScreenRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NetworkScreen(
      key: state.pageKey,
    );
  }
}

class DevicesScreenRoute extends GoRouteData {
  static const path = '/devicesScreenRoute';

  const DevicesScreenRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevicesScreen(
      key: state.pageKey,
    );
  }
}

class NotificationsScreenRoute extends GoRouteData {
  static const path = '/notificationRoute';

  const NotificationsScreenRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotificationsScreen(
      key: state.pageKey,
    );
  }
}

class ThemeShowcaseRoute extends GoRouteData {
  static const path = '/themeshowcase';

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

class LoginOnChatRoute extends GoRouteData {
  static const path = '/loginOnChatRoute';

  const LoginOnChatRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginOnChat(
      key: state.pageKey,
    );
  }
}

class ChatRoute extends GoRouteData {
  static const path = '/chatRoute/:cid';

  ChatRoute({required this.cid});
  int cid;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final selfCallerId = state.pathParameters['selfCallerId']!;
    final cubeDialogId = state.pathParameters['cubeDialogId']!;

    if (selfCallerId != cid.toString()) {
      return const LoginScreen();
    }

    return ChatScreen(
      key: state.pageKey,
      cubeUserId: selfCallerId,
      cubeDialogId: cubeDialogId,
    );
  }
}

class ChatVideoScreenRoute extends GoRouteData {
  static const path = '/chatVideoScreenRoute/:userId/:cubId';
  ChatVideoScreenRoute();

  String? userId;
  String? cubId;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final uid = state.pathParameters['uid'];
    final pid = state.pathParameters['pid'];

    return ChatVideoScreen(
      key: state.pageKey,
      uid: uid!,
      pid: pid!,
    );
  }
}

class SelectDialogRoute extends GoRouteData {
  static const path = '/selectDialogRoute';

  int? cid;

  SelectDialogRoute({required this.cid});

  CubeUser? currentUser;

  int? get _cid => cid = currentUser!.id!;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

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

class ChatDialogRoute extends GoRouteData {
  static const path = '/chatDialogRoute';

  ChatDialogRoute();

  CubeUser? currentUser;

  CubeDialog? cubeDialog;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (currentUser!.id == null) {
      return const LoginScreen();
    }

    return ChatDialogScreen(
      key: state.pageKey,
      cubeUser: currentUser!,
      cubeDialog: cubeDialog!,
    );
  }
}

class JoinScreenRoute extends GoRouteData {
  static const path = '/joinScreenRoute';
  JoinScreenRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final selfCallerId = state.pathParameters['selfCallerId'];

    return JoinScreen(selfCallerId: selfCallerId!);
  }
}

class CallScreenRoute extends GoRouteData {
  static const path = '/callScreenRoute';
  CallScreenRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final callerId = state.pathParameters['callerId'];
    final calleeId = state.pathParameters['calleeId'];

    return CallScreen(calleeId: calleeId!, callerId: callerId!);
  }
}

class AddOccupantScreenRoute extends GoRouteData {
  static const path = '/addOccupantScreenRoute';
  AddOccupantScreenRoute();

  CubeUser? cubeUser;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final id = state.pathParameters['id'] as int;

    if (id != cubeUser?.id) {
      return AddOccupantScreen(cubeUser: cubeUser!, id: id);
    } else {
      return const LoginScreen();
    }
  }
}

/// [Other Pages Routes]
class DevisEditRoute extends GoRouteData {
  static const path = '/edit_devis/:devisId';

  const DevisEditRoute({required this.devisId});

  final int devisId;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final devisId = state.pathParameters['userId']!;
    return DevisEditScreen(key: state.pageKey, devisId: devisId);
  }
}

class DocumentPreviewRoute extends GoRouteData {
  static const path = '/document_preview_route';

  const DocumentPreviewRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DocumentViewScreen(key: state.pageKey);
  }
}

class DevisListRoute extends GoRouteData {
  static const path = '/devisList';

  const DevisListRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevisListScreen(key: state.pageKey);
  }
}

class ProduitListRoute extends GoRouteData {
  static const path = '/produitList';

  const ProduitListRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductListScreen(key: state.pageKey);
  }
}

class ProduitEditRoute extends GoRouteData {
  static const path = '/produitEdit/:prodId';

  const ProduitEditRoute({required this.prodId});

  final int prodId;
  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final prodId = state.pathParameters['prodId']!;
    return ProductEditScreen(
      key: state.pageKey,
      produitId: prodId,
    );
  }
}

class ProduitDetailsRoute extends GoRouteData {
  static const path = '/produitDetails/:prodId';

  const ProduitDetailsRoute({required this.prodId});

  final int prodId;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final prodId = state.pathParameters['prodId']!;

    return ProduitDetails(
      key: state.pageKey,
      id: prodId,
    );
  }
}

class GodzyLogoRoute extends GoRouteData {
  static const path = '/godzyRoute';

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
  static const path = '/avisRoute/:avisId';

  int avisId;

  AvisBoxRoute({required this.avisId});

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final avisId = state.pathParameters['avisId']!;
    return AvisBoxPage(
      key: state.pageKey,
      avisId: avisId,
    );
  }
}

// [Admin Routes]
@TypedGoRoute<AdminShellRoute>(
    path: AdminShellRoute.path,
    name: AdminShellRoute.name,
    routes: <TypedGoRoute>[
      TypedGoRoute<AdminDashboardRoute>(
        path: AdminDashboardRoute.path,
        name: AdminDashboardRoute.name,
      ),
      TypedGoRoute<AdminUsersRoute>(
        path: AdminUsersRoute.path,
        name: AdminUsersRoute.name,
      ),
      TypedGoRoute<AdminProductsRoute>(
        path: AdminProductsRoute.path,
        name: AdminProductsRoute.name,
      ),
      TypedGoRoute<AdminOrdersRoute>(
        path: AdminOrdersRoute.path,
        name: AdminOrdersRoute.name,
      ),
      TypedGoRoute<AdminReviewsRoute>(
        path: AdminReviewsRoute.path,
        name: AdminReviewsRoute.name,
      ),
      TypedGoRoute<AdminCategoriesRoute>(
        path: AdminCategoriesRoute.path,
        name: AdminCategoriesRoute.name,
      ),
      TypedGoRoute<AdminSettingsRoute>(
        path: AdminSettingsRoute.path,
        name: AdminSettingsRoute.name,
      ),
      TypedGoRoute<AdminSupportRoute>(
        path: AdminSupportRoute.path,
        name: AdminSupportRoute.name,
      ),
    ])
class AdminShellRoute extends GoRouteData {
  static const path = '/admin';
  static const name = '/admin';
  const AdminShellRoute();
}

class AdminDashboardRoute extends GoRouteData {
  static const path = 'dashboard';
  static const name = 'dashboard';

  const AdminDashboardRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminDashboardScreen();
}

class AdminUsersRoute extends GoRouteData {
  static const path = 'users';
  static const name = 'users';

  const AdminUsersRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminUsersScreen();
}

class AdminProductsRoute extends GoRouteData {
  static const path = 'products';
  static const name = 'products';

  const AdminProductsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminProductsScreen();
}

class AdminOrdersRoute extends GoRouteData {
  static const path = 'orders';
  static const name = 'orders';

  const AdminOrdersRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminOrdersScreen();
}

class AdminReviewsRoute extends GoRouteData {
  static const path = 'reviews';
  static const name = 'reviews';

  const AdminReviewsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminReviewsScreen();
}

class AdminCategoriesRoute extends GoRouteData {
  static const path = 'categories';
  static const name = 'categories';

  const AdminCategoriesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminCategoriesScreen();
}

class AdminSettingsRoute extends GoRouteData {
  static const path = 'settings';
  static const name = 'settings';

  const AdminSettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminSettingsScreen();
}

class AdminSupportRoute extends GoRouteData {
  static const path = 'support';
  static const name = 'support';

  const AdminSupportRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminSupportScreen();
}

@TypedGoRoute<SupportRoute>(
  path: SupportRoute.path,
  name: SupportRoute.name,
  routes: <TypedGoRoute>[
    TypedGoRoute<SupportTicketsRoute>(
      path: SupportTicketsRoute.path,
      name: SupportTicketsRoute.name,
    ),
    TypedGoRoute<SupportFAQRoute>(
      path: SupportFAQRoute.path,
      name: SupportFAQRoute.name,
    ),
  ],
)
class SupportRoute extends GoRouteData {
  static const path = '/support';
  static const name = 'support';
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SupportScreen();
}

class SupportTicketsRoute extends GoRouteData {
  static const path = 'tickets';
  static const name = 'support_tickets';
}

class SupportFAQRoute extends GoRouteData {
  static const path = 'faq';
  static const name = 'support_faq';
}
