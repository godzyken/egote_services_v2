import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;
  runApp(UncontrolledProviderScope(
      container: await bootstrap(), child: const MyApp()));
}
