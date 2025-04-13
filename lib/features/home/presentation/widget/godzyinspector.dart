import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/notifier/application_state.dart';

class WidgetInspector extends ConsumerWidget {
  const WidgetInspector({
    super.key,
    required this.exitWidgetSelectionButtonBuilder,
    required this.moveExitWidgetSelectionButtonBuilder,
    required this.child,
  });
  final Widget Function(BuildContext context,
      {Key? key,
      required VoidCallback onPressed}) exitWidgetSelectionButtonBuilder;
  final Widget Function(BuildContext context,
      {required bool isLeftAligned,
      required VoidCallback onPressed}) moveExitWidgetSelectionButtonBuilder;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final appState = ref.watch(appStateProvider);

    return appState.when(
      init: () => Placeholder(
        color: Colors.white,
        fallbackWidth: context.size!.width,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Widget Inspector'),
            ),
            body: Center(
              child: child,
            ),
            floatingActionButton: Stack(children: [
              exitWidgetSelectionButtonBuilder(context,
                  key: const Key('exitWidgetSelectionButton'), onPressed: () {
                ref.read(appStateProvider.notifier).signOut();
              }),
              Positioned(
                  child: moveExitWidgetSelectionButtonBuilder(context,
                      isLeftAligned: user == null, onPressed: () {
                if (user == null) {
                  ref.read(appStateProvider.notifier).updateUserState();
                } else {
                  ref.read(appStateProvider.notifier).signOut();
                }
              }))
            ])),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      success: (data) => Scaffold(
          appBar: AppBar(
            title: Text('Widget : $data'),
          ),
          body: Center(
            child: child,
          ),
          floatingActionButton: Stack(children: [
            exitWidgetSelectionButtonBuilder(context,
                key: const Key('exitWidgetSelectionButton'), onPressed: () {
              ref.read(appStateProvider.notifier).signOut();
            }),
            Positioned(
                child: moveExitWidgetSelectionButtonBuilder(context,
                    isLeftAligned: user == null, onPressed: () {
              if (user == null) {
                ref.read(appStateProvider.notifier).updateUserState();
              } else {
                ref.read(appStateProvider.notifier).signOut();
              }
            }))
          ])),
      error: (exception) => ErrorWidget(exception),
    );
  }
}
