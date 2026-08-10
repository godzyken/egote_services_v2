import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/avis/presentation/view/avis_box_page.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_edit_screen.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_list_screen.dart';
import 'package:egote_services_v2/features/home/presentation/view/home_screen.dart';
import 'package:egote_services_v2/features/home/presentation/widget/godzylogo.dart';
import 'package:egote_services_v2/features/settings/presentation/view/gallery/gallery.dart';
import 'package:egote_services_v2/features/settings/presentation/view/settings_ui_page.dart';
import 'package:egote_services_v2/features/sketch/presentation/view/drawing_page.dart';
import 'package:egote_services_v2/features/theme/views/screen/theme_showcase_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Core module for the main egote_services app
class CoreModule extends AppModule {
  @override
  List<RouteBase> get routes => [
        // Main Home Route
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomeScreen(key: state.pageKey),
          routes: [
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
                  builder: (context, state) => const DrawingPage(),
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
                        userEntityModel: state.extra as UserEntityModel?,
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
                  builder: (context, state) => MFAEnrollScreen(
                    key: state.pageKey,
                    params: state.extra as VerificationScreenParams,
                  ),
                ),
                GoRoute(
                  path: 'verificationRoute',
                  name: 'verify',
                  builder: (context, state) => VerificationScreen(
                    key: state.pageKey,
                    params: state.extra as VerificationScreenParams,
                  ),
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
              builder: (context, state) => CrossPlatformSettingsScreen(key: state.pageKey),
            ),
            GoRoute(
              path: 'webChromeAddressesRoute',
              name: 'webChromeAddressesRoute',
              builder: (context, state) => WebChromeAddressesScreen(key: state.pageKey),
            ),
            GoRoute(
              path: 'androidNotificationsRoute',
              name: 'androidNotificationsRoute',
              builder: (context, state) => AndroidNotificationsScreen(key: state.pageKey),
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
              builder: (context, state) => SelectDialogScreen(
                key: state.pageKey,
                currentUser: state.extra as CubeUser,
              ),
              routes: [
                GoRoute(
                  path: 'chatDialogRoute/:cdid',
                  name: 'chat_dialog',
                  builder: (context, state) {
                    final extras = state.extra as Map<String, dynamic>;
                    return ChatDialogScreen(
                      key: state.pageKey,
                      cubeUser: extras['cubeUser'] as CubeUser,
                      cubeDialog: extras['cubeDialog'] as CubeDialog,
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        // Misc
        GoRoute(
          path: '/godzyRoute',
          name: 'godzyRoute',
          builder: (context, state) => Godzylogo(key: state.pageKey),
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
