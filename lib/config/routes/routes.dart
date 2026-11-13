import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/features/artisans/presentation/pages/artisans_page.dart';
import 'package:egote_services_v2/features/atelier/presentation/pages/atelier_page.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/avis/presentation/view/avis_box_page.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_edit_screen.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_list_screen.dart';
import 'package:egote_services_v2/features/home/presentation/view/home_screen.dart';
import 'package:egote_services_v2/features/home/presentation/view/mosaic_hub_screen.dart';
import 'package:egote_services_v2/features/home/presentation/widget/godzylogo_screen.dart';
import 'package:egote_services_v2/features/settings/presentation/view/gallery/gallery.dart';
import 'package:egote_services_v2/features/settings/presentation/view/settings_ui_page.dart';
import 'package:egote_services_v2/features/sketch/presentation/view/sketch_my_wishes_screen.dart';
import 'package:egote_services_v2/features/theme/views/screen/theme_showcase_screen.dart';
import 'package:go_router/go_router.dart';

/// Core module for the main egote_services app
class CoreModule extends AppModule {
  @override
  List<RouteBase> get routes => [
    // Main Home Route (Mosaic Hub Construction 4.0)
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const MosaicHubScreen(),
      routes: [
        GoRoute(
          path: 'legacy_home',
          name: 'legacy_home',
          builder: (context, state) => HomeScreen(key: state.pageKey),
        ),
        // User Home and sub-routes
        GoRoute(
          path: 'user_home/:pid',
          name: 'user_home',
          builder: (context, state) => UserHomeScreen(
            key: state.pageKey,
            pid: state.pathParameters['pid']!,
          ),
          routes: [
            GoRoute(
              path: 'person/:uid',
              name: 'person',
              builder: (context, state) => ProfileScreen(
                key: state.pageKey,
                uid: state.pathParameters['uid']!,
                pid: state.pathParameters['pid']!,
              ),
            ),
            GoRoute(
              path: 'drawingRoute',
              name: 'drawingRoute',
              builder: (context, state) => const SketchMyWishesScreen(),
            ),
            GoRoute(
              path: 'userList/:uid',
              name: 'userList',
              builder: (context, state) => UserListScreen(key: state.pageKey),
              routes: [
                GoRoute(
                  path: 'userForm',
                  name: 'userForm',
                  builder: (context, state) => AddUserFormScreen(
                    key: state.pageKey,
                    userEntityModel: state.extra is UserEntityModel
                        ? state.extra as UserEntityModel
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    // Auth Routes
    GoRoute(
      path: '/authRoute',
      name: 'auth',
      builder: (context, state) => AuthScreen(key: state.pageKey),
      routes: [
        GoRoute(
          path: 'loginRoute',
          name: 'login',
          builder: (context, state) => LoginScreen(key: state.pageKey),
        ),
        GoRoute(
          path: 'signUpRoute',
          name: 'sign_up',
          builder: (context, state) => SignUpScreen(key: state.pageKey),
          routes: [
            GoRoute(
              path: 'enrollRoute',
              name: 'enroll',
              builder: (context, state) {
                final params = state.extra is VerificationScreenParams
                    ? state.extra as VerificationScreenParams
                    : const VerificationScreenParams(
                        email: '',
                        password: '',
                        name: '',
                      );
                return MFAEnrollScreen(key: state.pageKey, params: params);
              },
            ),
            GoRoute(
              path: 'verificationRoute',
              name: 'verify',
              builder: (context, state) {
                final params = state.extra is VerificationScreenParams
                    ? state.extra as VerificationScreenParams
                    : const VerificationScreenParams(
                        email: '',
                        password: '',
                        name: '',
                      );
                return VerificationScreen(key: state.pageKey, params: params);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'mfaListRoute',
          name: 'mfaList',
          builder: (context, state) => ListMfaScreen(key: state.pageKey),
        ),
      ],
    ),

    // Settings Routes
    GoRoute(
      path: '/settingsRoute',
      name: 'settingsRoute',
      builder: (context, state) => SettingsUiPage(key: state.pageKey),
      routes: [
        GoRoute(
          path: 'crossPlatformRoute',
          name: 'crossPlatformRoute',
          builder: (context, state) =>
              CrossPlatformSettingsScreen(key: state.pageKey),
        ),
        GoRoute(
          path: 'webChromeAddressesRoute',
          name: 'webChromeAddressesRoute',
          builder: (context, state) =>
              WebChromeAddressesScreen(key: state.pageKey),
        ),
        GoRoute(
          path: 'androidNotificationsRoute',
          name: 'androidNotificationsRoute',
          builder: (context, state) =>
              AndroidNotificationsScreen(key: state.pageKey),
        ),
        GoRoute(
          path: 'webChromeSettingsRoute',
          name: 'webChromeSettingsRoute',
          builder: (context, state) => WebChromeSettings(key: state.pageKey),
        ),
      ],
    ),

    // Devis Routes
    GoRoute(
      path: '/devisList',
      name: 'devisList',
      builder: (context, state) => DevisListScreen(key: state.pageKey),
    ),
    GoRoute(
      path: '/edit_devis/:devisId',
      name: 'devis',
      builder: (context, state) => DevisEditScreen(
        key: state.pageKey,
        devisId: state.pathParameters['devisId']!,
      ),
    ),

    // Chat Routes
    GoRoute(
      path: '/chatRoute',
      name: 'chat',
      builder: (context, state) => LoginOnChat(key: state.pageKey),
      routes: [
        GoRoute(
          path: 'selectDialogRoute/:cid',
          name: 'select_dialog',
          builder: (context, state) {
            final currentUser = state.extra is CubeUser
                ? state.extra as CubeUser
                : CubeUser(login: 'Guest', fullName: 'Guest User');
            return SelectDialogScreen(
              key: state.pageKey,
              currentUser: currentUser,
            );
          },
          routes: [
            GoRoute(
              path: 'chatDialogRoute/:cdid',
              name: 'chat_dialog',
              builder: (context, state) {
                final extras = state.extra is Map<String, dynamic>
                    ? state.extra as Map<String, dynamic>
                    : <String, dynamic>{};
                return ChatDialogScreen(
                  key: state.pageKey,
                  cubeUser: extras['cubeUser'] as CubeUser? ?? CubeUser(),
                  cubeDialog:
                      extras['cubeDialog'] as CubeDialog? ??
                      CubeDialog(CubeDialogType.PRIVATE),
                );
              },
            ),
          ],
        ),
      ],
    ),

    // Misc & Phase 2 / Phase 3 Modules
    GoRoute(
      path: '/sketch',
      name: 'sketch',
      builder: (context, state) => const SketchMyWishesScreen(),
    ),
    GoRoute(
      path: '/atelier',
      name: 'atelier',
      builder: (context, state) => const AtelierPage(),
    ),
    GoRoute(
      path: '/artisans',
      name: 'artisans',
      builder: (context, state) => const ArtisansPage(),
    ),
    GoRoute(
      path: '/godzyRoute',
      name: 'godzyRoute',
      builder: (context, state) => GodzyLogoScreen(key: state.pageKey),
    ),
    GoRoute(
      path: '/avisRoute',
      name: 'avisRoute',
      builder: (context, state) => AvisBoxPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/themeshowcase',
      name: 'themes',
      builder: (context, state) => ThemeShowcasePage(key: state.pageKey),
    ),
  ];
}
