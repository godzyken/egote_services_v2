import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/views/screens/error_screen.dart';

part 'error_route.g.dart';

@TypedGoRoute<ErrorRoute>(path: ErrorRoute.path, name: '404', routes: [])
class ErrorRoute extends GoRouteData {
  static const path = 'unknownedRoute/:message';
  ErrorRoute({required this.message});
  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorScreen(error: message.toString());
}
