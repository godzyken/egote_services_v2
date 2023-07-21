import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppBarConnection extends ConsumerWidget {
  const AppBarConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(context.tr!.mfaConnect),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text(context.tr!.unEnroll),
                onTap: () {
                  context.push('mfaList');
                },),
                PopupMenuItem(child: Text(context.tr!.signOut),
                onTap: () {
                  ref.watch(supabaseClientProvider).auth.signOut();
                  context.push('auth');
                },),
              ];
            },
        )
      ],
    );
  }
}
