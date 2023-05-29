import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/screens/auth_screen.dart';
import '../../features/auth/presentation/views/screens/profile_screen.dart';
import '../../features/auth/presentation/views/screens/user_home_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: "/",
  name: 'home',
  routes: [
    TypedGoRoute<UserHomeRoute>(
        path: UserHomeRoute.path,
        name: 'user_home',
        routes: [
          TypedGoRoute<PersonRoute>(
              path: PersonRoute.path, name: 'person', routes: []),
        ]),
  ],
)
class HomeRoute extends GoRouteData {
  static const path = '/home';
  const HomeRoute();

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

@TypedGoRoute<AuthRoute>(path: AuthRoute.path, name: '/auth', routes: [])
class AuthRoute extends GoRouteData {
  static const path = 'auth_route';
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

class DevisEditRoute extends GoRouteData {
  static const path = '/edit_devis:did';
  const DevisEditRoute({required this.did});

  final int did;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DevisEditScreen(did: did);
  }
}
