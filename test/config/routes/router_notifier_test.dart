import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:egote_services_v2/config/routes/router_notifier.dart';

void main() {
  group('AppRouterNotifier', () {
    test('should add and notify listeners', () {
      final container = ProviderContainer();
      final notifier = container.read(appRouterNotifierProvider.notifier);
      
      bool notified = false;
      void listener() {
        notified = true;
      }
      
      notifier.addListener(listener);
      notifier.notifyListeners();
      
      expect(notified, true);
    });

    test('should remove listeners', () {
      final container = ProviderContainer();
      final notifier = container.read(appRouterNotifierProvider.notifier);
      
      int notifiedCount = 0;
      void listener() {
        notifiedCount++;
      }
      
      notifier.addListener(listener);
      notifier.notifyListeners();
      notifier.removeListener(listener);
      notifier.notifyListeners();
      
      expect(notifiedCount, 1);
    });
  });
}
