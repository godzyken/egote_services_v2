import 'dart:convert';

import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../environements/flavors.dart';

final environmentProvider = Provider<Environment>((ref) {
  throw UnimplementedError('Override required for environmentProvider');
});

class EnvironmentReader {
  static Future<(Flavor, Environment)> load(Flavor flavor) async {
    final envPath = flavor.enFilePath;

    final envString = await rootBundle.loadString(envPath);

    final Map<String, dynamic> jsonMap = jsonDecode(envString);

    final env = Environment.fromJson(jsonMap);

    return (flavor, env);
  }
}
