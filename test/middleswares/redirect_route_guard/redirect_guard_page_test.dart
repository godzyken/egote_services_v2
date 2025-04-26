import 'package:egote_services_v2/config/middlewares/role_base_guard.dart';
import 'package:egote_services_v2/config/providers/permissions/role_based_guard_Provider.dart';
import 'package:egote_services_v2/features/home/presentation/widget/redirect_guard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(MockGoRouterState('/'));
  });
  testWidgets('Redirects when redirectPath is returned', (tester) async {
    final state = MockGoRouterState('/');
    final testRedirectPath = '/user_home';

    // Fake guard with forced redirection
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          roleBasedGuardProvider.overriddenFamily,
        ],
        child: MaterialApp.router(
          routerConfig: GoRouter(
            initialLocation: '/',
            routes: [
              GoRoute(
                path: '/',
                name: 'root',
                builder: (context, state) => RedirectGuardPage(state),
              ),
              GoRoute(
                path: '/user_home',
                name: 'user_home',
                builder: (_, __) => const Text('User Home'),
              )
            ],
          ),
        ),
      ),
    );

    // Allow microtask to execute
    await tester.pumpAndSettle();

    expect(find.text('User Home'), findsOneWidget);
  });

/*
  testWidgets('RedirectGuardPage redirects to /user_home by default',
      (WidgetTester tester) async {
    final mockState = MockGoRouterState('/user_home');

    // Simule l'état utilisateur connecté avec profil complet et rôle client
    final container = ProviderContainer(overrides: [
      // authStateProvider.overrideWith((_) => MockUser()),
      // userControllerStateProvider.overrideWith((_) => UserControllerState()),
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: GoRouter(
            initialLocation: '/',
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => RedirectGuardPage(
                    MockGoRouterState(mockState.matchedLocation)),
              ),
              GoRoute(
                path: '/user_home',
                builder: (context, state) => const Text('User Home'),
              )
            ],
          ),
        ),
      ),
    );

    // On laisse le Future.microtask faire effet
    await tester.pumpAndSettle();

    expect(find.text('User Home'), findsOneWidget);
  });

  testWidgets('RedirectGuardPage redirects admin to /admin/dashboard',
      (WidgetTester tester) async {
    final container = ProviderContainer(overrides: [
      authStateProvider.overrideWithValue(MockUser()),
      userControllerStateProvider.overrideWith((_) {
        return AsyncData(MockAppUser(role: 'admin', isComplete: true));
      }),
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: GoRouter(
            initialLocation: '/',
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) =>
                    const RedirectGuardPage(MockGoRouterState()),
              ),
              GoRoute(
                path: '/admin/dashboard',
                builder: (context, state) => const Text('Admin Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Admin Dashboard'), findsOneWidget);
  });

  testWidgets('RedirectGuardPage redirects unauthenticated user to /auth',
          (WidgetTester tester) async {
        final container = ProviderContainer(overrides: [
          authStateProvider.overrideWithValue(null),
          userControllerStateProvider.overrideWith((ref) {
            return const AsyncData(null);
          }),
        ]);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp.router(
              routerConfig: GoRouter(
                initialLocation: '/',
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (context, state) =>
                    const RedirectGuardPage(MockGoRouterState()),
                  ),
                  GoRoute(
                    path: '/auth',
                    builder: (context, state) => const Text('Auth Page'),
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.text('Auth Page'), findsOneWidget);
      });
*/
}

// Mocks
class MockUser {}

class MockAppUser {
  final String role;
  final bool isComplete;

  MockAppUser({required this.role, required this.isComplete});
}

/// Un faux RoleBasedGuard qui retourne un chemin forcé
class RoleBasedGuardFake extends RoleBasedGuard {
  final String? returnPath;

  RoleBasedGuardFake({this.returnPath}) : super(_DummyRef());

  @override
  String? redirect(GoRouterState state) => returnPath;
}

// Un ref bidon pour satisfaire la signature de RoleBasedGuard
class _DummyRef extends Fake implements WidgetRef {}
