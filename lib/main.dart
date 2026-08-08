import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';

/// Main entry point for egote_services_v2
/// 
/// This file serves as the default entry point.
/// For flavor-specific configurations, see:
/// - main_development.dart (with Datadog monitoring)
/// - main_production.dart (production optimized)
/// - main_local.dart (local development)
/// 
/// To run with flavors:
/// flutter run --flavor development -t lib/main_development.dart
/// flutter run --flavor production -t lib/main_production.dart
void main() async {
  // Default to development flavor if no flavor is set
  F.appFlavor ??= Flavor.development;
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const MyApp(),
    ),
  );
}
