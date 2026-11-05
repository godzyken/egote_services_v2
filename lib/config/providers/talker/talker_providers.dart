import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final talkerProvider = Provider<Talker>((ref) {
  return TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: 200,
    ),
  );
}, name: 'TalkerProvider');

final talkerObserverProvider = Provider<ProviderObserver>((ref) {
  final talker = ref.watch(talkerProvider);
  return TalkerRiverpodObserver(talker: talker);
}, name: 'TalkerObserverProvider');
