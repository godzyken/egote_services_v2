import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/user_controller_state.dart';
import '../../widgets/avatar_circle.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  bool isSubmitting = false;

  Future<void> _submit(UserEntityModel userEntity) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isSubmitting = true);

    final updated = userEntity.copyWith(
      name: _nameController.text.trim(),
      isComplete: true,
      updatedAt: DateTime.now(),
    );

    try {
      await ref.read(userControllerStateProvider);

      // Recharge le profil complet
      await ref
          .read(userControllerStateProvider.notifier)
          .reloadUser(updated.id.toString());
      if (mounted) context.go('/');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userControllerStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Compléter le profil")),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (user) {
          final userEntity = ref.read(userControllerStateProvider).value!;
          _nameController.text = user.name;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AvatarCircleConsumer(radius: 60),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Nom complet"),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? "Nom requis"
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Valider mon profil"),
                    onPressed: () => isSubmitting ? null : _submit(userEntity),
                  ),
                  if (isSubmitting)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
