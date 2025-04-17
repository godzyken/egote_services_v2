import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/routes/app_router_observer.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/config/routes/sentry_navigator_observer.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_controller_state.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/common/presentation/views/widgets/router_refresh_stream.dart';
import '../providers/watchdog/datadog_service.dart';

part 'router.g.dart';

final rootRouterKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

// final _shellRouterKey = GlobalKey<NavigatorState>(debugLabel: 'shellRouterKey');

// <---------------- RunViewInfo Provider --------------------> //
final observer = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance, viewInfoExtractor: infoExtractor);
final appRouterObserver = AppRouterObserver(datadogService: DatadogService());

RumViewInfo? infoExtractor(Route<dynamic> route) {
  var name = route.settings.name;
  if (name == 'my_named_route') {
    return RumViewInfo(
        name: 'MyDifferentName',
        attributes: {'extra_attribue': 'attribute_value'});
  }

  return defaultViewInfoExtractor(route);
}

@riverpod
// ignore: prefer-static-class
GoRouter router(Ref ref) {
  //final notifier = ref.watch(routerProvider).configuration;

  return GoRouter(
      routes: [
        homeShellRoute,
        authShellRoute,
        adminShellRoute,
        supportShellRoute,
        /*StatefulShellRoute(
          builder: (context, state, navigationShell) {
            final preload = state.extra as bool? ?? false;

            return SharedAppData(
                child: AppBarConnection(
                    preload: preload,
                    child: AdminShell(navigationShell: navigationShell)));
          },
          pageBuilder: (context, state, child) {
            final preload = state.extra as bool? ?? false;
            return NoTransitionPage(
                child: AppBarConnection(preload: preload, child: child));
          },
          branches: <StatefulShellBranch>[
            // Branche 1 : /home
            StatefulShellBranch(
                routes: homeShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/home',
                restorationScopeId: 'shell_branch_1'),
            // Branche 2 : /auth
            StatefulShellBranch(
                routes: authShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/auth',
                restorationScopeId: 'shell_branch_2'),
            // Branche 3 : /admin
            StatefulShellBranch(
                routes: adminShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/admin',
                restorationScopeId: 'shell_branch_3'),
            // Branche 3 : /support
            StatefulShellBranch(
                routes: supportShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/support',
                restorationScopeId: 'shell_branch_3'),
          ],
          navigatorContainerBuilder: (BuildContext context,
              StatefulNavigationShell navigationShell, List<Widget> children) {
            return Scaffold(
              body: navigationShell,
            );
          },
        ),*/
      ],
      refreshListenable: GoRouterRefreshStream(
          ref.watch(authStateProvider.notifier).listenToUserChanges),
      redirect: (context, state) {
        final user = ref.read(authStateProvider);
        final userState = ref.read(userControllerStateProvider);

        final isLoggedIn = user != null;
        final isAdmin = userState.value?.role == 'admin';
        final isSupport = userState.value?.role == 'support';
        final path = state.uri.path;
        final isOnLogin = state.path == '/auth';
        final isOnCompleteProfile = state.path == '/complete-profile';

        if (!isLoggedIn) return isOnLogin ? null : '/auth';

        final isComplete = userState.maybeWhen(
          data: (data) => data.isComplete,
          orElse: () => false,
        );

        if (!isComplete && !isOnCompleteProfile) {
          return '/complete-profile';
        }

        // Redirection basée sur le rôle après profil complété
        final role = userState.maybeWhen(
          data: (data) => data.role,
          orElse: () => null,
        );

        // Empêche de boucler si déjà à la bonne route
        if (state.path == '/') {
          switch (role) {
            case 'admin':
              return '/admin/dashboard';
            case 'client':
              return '/user_home';
            case 'agent':
              return '/support';
            default:
              return '/user_home'; // fallback route
          }
        }

        if (path.startsWith('/admin') && !isAdmin) return '/not-authorized';

        if (path.startsWith('/support') && !isSupport) return '/not-authorized';

        return null;
      },
      initialLocation: '/home',
      debugLogDiagnostics: true,
      navigatorKey: rootRouterKey,
      observers: [observer, appRouterObserver, sentryNavigatorObserver],
      overridePlatformDefaultLocation: true,
      onException: (context, state, router) => GoExceptionHandler,
      requestFocus: true);
}
