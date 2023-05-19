import 'package:egote_services_v2/config/environements/bootstrap.dart';
import 'package:egote_services_v2/config/environements/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  F.appFlavor = Flavor.local;

  runApp(UncontrolledProviderScope(
    container: await bootstrap(),
    child: const MyApp(),
  ));
}
