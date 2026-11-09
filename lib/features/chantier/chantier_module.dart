import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/chantier_dashboard_page.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/construction_plan_page.dart';
import 'package:egote_services_v2/features/chantier/presentation/pages/planned_progress_page.dart';
import 'package:go_router/go_router.dart';

/// Module suivi de chantier (hub UI inspirée Buildexa).
class ChantierModule extends AppModule {
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
      ],
    ),
  ];
}
