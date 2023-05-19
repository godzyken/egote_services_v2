import 'package:sentry_flutter/sentry_flutter.dart';

final SentryNavigatorObserver sentryNavigatorObserver = SentryNavigatorObserver(
  autoFinishAfter: const Duration(seconds: 5),
  enableAutoTransactions: false,
  setRouteNameAsTransaction: true,
);
