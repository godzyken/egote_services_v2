import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListMfaScreen extends ConsumerWidget {
  const ListMfaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factorListFuture = ref.watch(supabaseClientProvider).auth.mfa.listFactors();

    return Scaffold(
      appBar: AppBar(title: Text(context.tr!.listMfa)),
      body: FutureBuilder(
        future: factorListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final response = snapshot.data!;
          final factors = response.all;
          return ListView.builder(
            itemCount: factors.length,
            itemBuilder: (context, index) {
              final factor = factors[index];
              return ListTile(
                title: Text(factor.friendlyName ?? factor.factorType.name),
                subtitle: Text(factor.status.name),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(context.tr!.deleteFactor),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(context.tr!.cancel),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await ref.watch(supabaseClientProvider).auth.mfa.unenroll(factor.id);
                                  await ref.watch(supabaseClientProvider).auth.signOut();
                                  if (context.mounted) {
                                    context.go(SignUpRoute.path);
                                  }
                                },
                                child: Text(context.tr!.delete),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
