import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpdateUserDialogScreen extends ConsumerStatefulWidget {
  const UpdateUserDialogScreen({super.key});

  @override
  ConsumerState<UpdateUserDialogScreen> createState() =>
      _UpdateUserDialogScreenState();
}

class _UpdateUserDialogScreenState
    extends ConsumerState<UpdateUserDialogScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _update() async {
    setState(() => _isLoading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.updateUser(
        email: _emailController.text.isNotEmpty ? _emailController.text : null,
        password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
        name: _nameController.text.isNotEmpty ? _nameController.text : null,
      );

      result.fold(
        (failure) => context.showAlert(failure.message),
        (user) {
          context.showAlert('Profil mis à jour !');
          context.pop();
        },
      );
    } catch (e) {
      context.showAlert(e.toString());
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(context.tr!.updateProfile),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: context.tr!.email),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: context.tr!.password),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.tr!.cancel),
        ),
        TextButton(
          onPressed: _isLoading ? null : _update,
          child: _isLoading 
            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
            : Text(context.tr!.update),
        ),
      ],
    );
  }
}
