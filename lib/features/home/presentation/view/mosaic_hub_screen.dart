import 'package:egote_services_v2/config/routes/app_module.dart';
import 'package:egote_services_v2/features/home/application/mosaic_hub_controller.dart';
import 'package:egote_services_v2/features/home/application/mosaic_hub_metrics_provider.dart';
import 'package:egote_services_v2/features/home/presentation/widgets/ai_btp_assistant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MosaicHubScreen extends ConsumerStatefulWidget {
  const MosaicHubScreen({super.key});

  @override
  ConsumerState<MosaicHubScreen> createState() => _MosaicHubScreenState();
}

class _MosaicHubScreenState extends ConsumerState<MosaicHubScreen> {
  void _safeHaptic(VoidCallback action) {
    try {
      action();
    } catch (_) {
      // Fallback for web or unsupported platforms where haptics are not available
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hubState = ref.watch(mosaicHubProvider);
    final hubController = ref.read(mosaicHubProvider.notifier);
    final metricsMap = ref.watch(mosaicHubMetricsProvider);

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
                  hubState.isEditing
                      ? 'Mode Édition Actif'
                      : 'Cockpit Unique Mosaic',
                  style: TextStyle(
                    fontSize: 12,
                    color: hubState.isEditing
                        ? Colors.orangeAccent
                        : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: hubState.isEditing
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          if (hubState.isEditing)
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              onPressed: () {
                _safeHaptic(() => HapticFeedback.mediumImpact());
                hubController.toggleEditMode();
              },
              icon: const Icon(Icons.check, size: 18),
              label: const Text(
                'Terminé',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.tune_rounded),
              tooltip: 'Mode Édition / Personnaliser',
              onPressed: () {
                _safeHaptic(() => HapticFeedback.mediumImpact());
                hubController.toggleEditMode();
              },
            ),
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
              const SliverToBoxAdapter(child: AiBtpAssistantWidget()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Modules Actifs & Métier',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (hubState.isEditing) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Glissez pour réordonner',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {
                          _safeHaptic(() => HapticFeedback.mediumImpact());
                          hubController.toggleEditMode();
                        },
                        icon: Icon(
                          hubState.isEditing
                              ? Icons.check_circle_rounded
                              : Icons.tune_rounded,
                          size: 16,
                        ),
                        label: Text(
                          hubState.isEditing ? 'Terminer' : 'Personnaliser',
                        ),
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
                    final module = hubState.modules[index];
                    final isPinned =
                        hubState.pinnedStatus[module.id] ??
                        module.isPinnedByDefault;
                    final metrics =
                        metricsMap[module.id] ?? const ModuleMetrics();

                    Widget tileWidget = HubTile(
                      key: ValueKey(module.id),
                      module: module,
                      isDark: isDark,
                      isPinned: isPinned,
                      isEditing: hubState.isEditing,
                      metrics: metrics,
                      onTap: () {
                        _safeHaptic(() => HapticFeedback.lightImpact());
                        if (module.initialRoute.isNotEmpty) {
                          context.go(module.initialRoute);
                        }
                      },
                      onLongPress: () {
                        _safeHaptic(() => HapticFeedback.mediumImpact());
                        hubController.toggleEditMode();
                      },
                      onDoubleTap: () {
                        _safeHaptic(() => HapticFeedback.mediumImpact());
                        hubController.togglePin(module.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isPinned
                                  ? 'Module ${module.name} désépinglé.'
                                  : 'Module ${module.name} épinglé en haut !',
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      onDragStarted: () {
                        _safeHaptic(() => HapticFeedback.selectionClick());
                      },
                      onDragEnded: () {
                        _safeHaptic(() => HapticFeedback.mediumImpact());
                      },
                    );

                    // If in editing mode, wrap with DragTarget and Draggable for reordering
                    if (hubState.isEditing) {
                      return DragTarget<int>(
                        onAcceptWithDetails: (details) {
                          hubController.reorderModules(details.data, index);
                        },
                        builder: (context, candidateData, rejectedData) {
                          return LongPressDraggable<int>(
                            data: index,
                            feedback: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: SizedBox(
                                width: 160,
                                height: 140,
                                child: Opacity(
                                  opacity: 0.85,
                                  child: HubTile(
                                    module: module,
                                    isDark: isDark,
                                    isPinned: isPinned,
                                    isEditing: true,
                                    isDragging: true,
                                    metrics: metrics,
                                    onTap: () {},
                                    onLongPress: () {},
                                    onDoubleTap: () {},
                                  ),
                                ),
                              ),
                            ),
                            childWhenDragging: Opacity(
                              opacity: 0.3,
                              child: tileWidget,
                            ),
                            child: tileWidget,
                          );
                        },
                      );
                    }

                    return tileWidget;
                  }, childCount: hubState.modules.length),
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
                context.go('/sketch');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HubTile extends StatefulWidget {
  const HubTile({
    super.key,
    required this.module,
    required this.isDark,
    required this.isPinned,
    required this.isEditing,
    this.isDragging = false,
    required this.metrics,
    required this.onTap,
    required this.onLongPress,
    required this.onDoubleTap,
    this.onDragStarted,
    this.onDragEnded,
  });

  final AppModule module;
  final bool isDark;
  final bool isPinned;
  final bool isEditing;
  final bool isDragging;
  final ModuleMetrics metrics;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDoubleTap;
  final VoidCallback? onDragStarted;
  final VoidCallback? onDragEnded;

  @override
  State<HubTile> createState() => _HubTileState();
}

class _HubTileState extends State<HubTile> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _shakeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _shakeAnimation = Tween<double>(begin: -0.02, end: 0.02).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.easeInOut),
    );

    if (widget.isEditing) {
      _shakeController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant HubTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isEditing != oldWidget.isEditing) {
      if (widget.isEditing) {
        _shakeController.repeat(reverse: true);
      } else {
        _shakeController.stop();
        _shakeController.reset();
      }
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final module = widget.module;
    final isDark = widget.isDark;
    final metrics = widget.metrics;

    final backgroundColor = isDark
        ? module.accentColor.withValues(alpha: 0.15)
        : module.accentColor.withValues(alpha: 0.08);

    Widget tileContent = AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _shakeAnimation]),
      builder: (context, child) {
        final transform = widget.isEditing
            ? Matrix4.rotationZ(_shakeAnimation.value)
            : Matrix4.identity();

        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: InkWell(
              onTapDown: (_) => _scaleController.forward(),
              onTapUp: (_) => _scaleController.reverse(),
              onTapCancel: () => _scaleController.reverse(),
              onTap: widget.onTap,
              onLongPress: widget.onLongPress,
              onDoubleTap: widget.onDoubleTap,
              borderRadius: BorderRadius.circular(20),
              child: Ink(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.isEditing
                        ? Colors.orangeAccent
                        : module.accentColor.withValues(alpha: 0.3),
                    width: widget.isEditing ? 2.0 : 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: module.accentColor.withValues(
                        alpha: widget.isDragging ? 0.2 : 0.05,
                      ),
                      blurRadius: widget.isDragging ? 16 : 10,
                      offset: widget.isDragging
                          ? const Offset(0, 8)
                          : const Offset(0, 4),
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
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: module.accentColor.withValues(
                                  alpha: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                module.icon,
                                color: module.accentColor,
                                size: 28,
                              ),
                            ),
                            if (metrics.badgeCount > 0)
                              Positioned(
                                top: -4,
                                right: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  constraints: const BoxConstraints(
                                    minWidth: 20,
                                    minHeight: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${metrics.badgeCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            if (widget.isEditing)
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.drag_indicator_rounded,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                              ),
                            if (widget.isPinned)
                              Icon(
                                Icons.push_pin_rounded,
                                size: 16,
                                color: module.accentColor,
                              ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                module.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (metrics.hasAlert)
                              const Icon(
                                Icons.warning_amber_rounded,
                                size: 16,
                                color: Colors.amber,
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          metrics.statusSummary.isNotEmpty
                              ? metrics.statusSummary
                              : module.description,
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
            ),
          ),
        );
      },
    );

    return tileContent;
  }
}
