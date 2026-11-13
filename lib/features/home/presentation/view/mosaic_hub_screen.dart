import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/config/routes/ecosystem_modules.dart';
import 'package:egote_services_v2/features/home/presentation/widgets/ai_btp_assistant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MosaicHubScreen extends ConsumerStatefulWidget {
  const MosaicHubScreen({super.key});

  @override
  ConsumerState<MosaicHubScreen> createState() => _MosaicHubScreenState();
}

class _MosaicHubScreenState extends ConsumerState<MosaicHubScreen> {
  late List<AppModule> _modules;

  @override
  void initState() {
    super.initState();
    _modules = List.from(EcosystemRegistry.modules);
    // Sort: pinned first, then by sortOrder
    _modules.sort((a, b) {
      if (a.isPinnedByDefault != b.isPinnedByDefault) {
        return a.isPinnedByDefault ? -1 : 1;
      }
      return a.sortOrder.compareTo(b.sortOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.business_center_rounded,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HUB CONSTRUCTION 4.0',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  'Cockpit Unique',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: 'Recherche globale',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Recherche globale BTP en cours...'),
                ),
              );
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                tooltip: 'Notifications',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Aucune nouvelle notification'),
                    ),
                  );
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                'EG',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 900) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 3;
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: AiBtpAssistantWidget()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Modules Actifs',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.tune_rounded, size: 16),
                        label: const Text('Personnaliser'),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.15,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final module = _modules[index];
                    return HubTile(
                      module: module,
                      isDark: isDark,
                      onTap: () {
                        if (module.initialRoute.isNotEmpty) {
                          context.go(module.initialRoute);
                        }
                      },
                      onLongPress: () {
                        _showModuleOptions(context, module);
                      },
                    );
                  }, childCount: _modules.length),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickMenu(context),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 4,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Action Rapide'),
      ),
    );
  }

  void _showModuleOptions(BuildContext context, AppModule module) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(module.icon, color: module.accentColor, size: 28),
                const SizedBox(width: 12),
                Text(
                  module.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(module.description),
            const Divider(height: 24),
            ListTile(
              leading: Icon(
                module.isPinnedByDefault
                    ? Icons.push_pin
                    : Icons.push_pin_outlined,
              ),
              title: Text(
                module.isPinnedByDefault
                    ? 'Désépingler du Hub'
                    : 'Épingler en haut',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_new_rounded),
              title: const Text('Ouvrir le module'),
              onTap: () {
                Navigator.pop(context);
                if (module.initialRoute.isNotEmpty) {
                  context.go(module.initialRoute);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showQuickMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Création Rapide',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sélectionnez l’action à lancer immédiatement :',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.green.withValues(alpha: 0.1),
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.trending_up, color: Colors.white),
              ),
              title: const Text(
                'Nouveau Lead',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Enregistrer une opportunité BTP'),
              onTap: () {
                Navigator.pop(context);
                context.go('/devisList');
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.orange.withValues(alpha: 0.1),
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.construction, color: Colors.white),
              ),
              title: const Text(
                'Nouveau Chantier',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Créer un projet de construction'),
              onTap: () {
                Navigator.pop(context);
                context.go('/chantiers');
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.indigo.withValues(alpha: 0.1),
              leading: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Icon(Icons.brush, color: Colors.white),
              ),
              title: const Text(
                'Nouvelle Esquisse',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Lancer SketchMyWishes v1'),
              onTap: () {
                Navigator.pop(context);
                context.go('/avisRoute');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HubTile extends StatelessWidget {
  const HubTile({
    super.key,
    required this.module,
    required this.isDark,
    required this.onTap,
    required this.onLongPress,
  });

  final AppModule module;
  final bool isDark;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark
        ? module.accentColor.withValues(alpha: 0.15)
        : module.accentColor.withValues(alpha: 0.08);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: module.accentColor.withValues(alpha: 0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: module.accentColor.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: module.accentColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(module.icon, color: module.accentColor, size: 28),
                ),
                if (module.isPinnedByDefault)
                  Icon(
                    Icons.push_pin_rounded,
                    size: 16,
                    color: module.accentColor,
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  module.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  module.description,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
