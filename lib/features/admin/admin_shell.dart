import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/routes.dart';

class AdminShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AdminShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);
    if (user.role != 'admin') {
      return const Scaffold(
        body: Center(child: ErrorScreen(error: 'Accès refusé')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _getSelectedIndex(context),
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  const AdminDashboardRoute().go(context);
                  break;
                case 1:
                  const AdminUsersRoute().go(context);
                  break;
                case 2:
                  const AdminProductsRoute().go(context);
                  break;
                case 3:
                  const AdminOrdersRoute().go(context);
                  break;
                case 4:
                  const AdminReviewsRoute().go(context);
                  break;
                case 5:
                  const AdminCategoriesRoute().go(context);
                  break;
                case 6:
                  const AdminSettingsRoute().go(context);
                  break;
                case 7:
                  const AdminSupportRoute().go(context);
                  break;
              }
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(
                  icon: Icon(Icons.people), label: Text('Users')),
              NavigationRailDestination(
                  icon: Icon(Icons.shopping_bag), label: Text('Products')),
              NavigationRailDestination(
                  icon: Icon(Icons.receipt), label: Text('Orders')),
              NavigationRailDestination(
                  icon: Icon(Icons.reviews), label: Text('Reviews')),
              NavigationRailDestination(
                  icon: Icon(Icons.category), label: Text('Categories')),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text('Settings')),
              NavigationRailDestination(
                  icon: Icon(Icons.support_agent), label: Text('Support')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.contains('dashboard')) return 0;
    if (location.contains('users')) return 1;
    if (location.contains('products')) return 2;
    if (location.contains('orders')) return 3;
    if (location.contains('reviews')) return 4;
    if (location.contains('categories')) return 5;
    if (location.contains('settings')) return 6;
    if (location.contains('support')) return 7;
    return 0;
  }
}
