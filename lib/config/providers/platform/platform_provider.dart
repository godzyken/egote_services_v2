import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final platformProvider = StateProvider<TargetPlatform>(
  (final Ref<TargetPlatform> ref) => defaultTargetPlatform,
  name: 'platformProvider',
);
