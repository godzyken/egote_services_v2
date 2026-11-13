import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/bat_track_page.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/chantier_dashboard_page.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/construction_plan_page.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/planned_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Module suivi de chantier & Bat Track (Phase 2).
class ChantierModule extends AppModule {
  @override
  String get id => 'chantiers';

  @override
  String get name => 'Chantiers & Bat Track';

  @override
  String get description =>
      'Suivi d’avancement, plans et journal photos certifié';

  @override
  IconData get icon => Icons.construction;

  @override
  Color get accentColor => Colors.orange;

  @override
  int get sortOrder => 1;

  @override
  bool get isPinnedByDefault => true;

  @override
  String get initialRoute => '/chantiers';

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: '/chantiers',
      name: 'chantiers',
      builder: (context, state) => const ChantierDashboardPage(),
      routes: [
        GoRoute(
          path: ':id/plan',
          name: 'chantier_plan',
          builder: (context, state) =>
              ConstructionPlanPage(chantierId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: ':id/progress',
          name: 'chantier_progress',
          builder: (context, state) =>
              PlannedProgressPage(chantierId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: ':id/bat_track',
          name: 'chantier_bat_track',
          builder: (context, state) =>
              BatTrackPage(chantierId: state.pathParameters['id']!),
        ),
      ],
    ),
  ];
}
