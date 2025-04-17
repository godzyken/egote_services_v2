import 'dart:io';
import 'dart:typed_data';

import 'package:egote_services_v2/features/auth/domain/entities/sign_in/sign_in_state.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;

import '../../../../application/providers/auth_providers.dart';
import '../../../controller/user_controller_state.dart';

class UpdateUserDialogScreen extends ConsumerStatefulWidget {
  const UpdateUserDialogScreen({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<UpdateUserDialogScreen> createState() =>
      _UpdateUserDialogScreenState();
}

class _UpdateUserDialogScreenState
    extends ConsumerState<UpdateUserDialogScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  File? _selectedAvatar;
  Uint8List? _avatarPreview;

  @override
  void initState() {
    super.initState();
    final authController = ref.read(loginControllerNotifierProvider);
    _emailController =
        TextEditingController(text: authController.emailFormz?.value ?? '');
    _passwordController =
        TextEditingController(text: authController.passwordFormz?.value ?? '');
    _updateProfile();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final authController = ref.read(loginControllerNotifierProvider);
    return authController.emailFormz?.validator(value!).toString();
  }

  String? _validatePassword(String? value) {
    final authController = ref.read(loginControllerNotifierProvider);
    return authController.passwordFormz?.validator(value!).toString();
  }

  void _updateProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      final authController = ref.read(loginControllerNotifierProvider);

      ref.read(userControllerStateProvider.notifier).load(widget.userId);

      context.pop();
    }
  }

  Future<void> _handleAvatarUpload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      final file = File(path);
      final bytes = await file.readAsBytes();
      final decoded = img.decodeImage(bytes);

      if (decoded != null) {
        final resized = img.copyResize(decoded, width: 300);
        final compressedBytes = img.encodeJpg(resized, quality: 80);
        final compressedFile = await _saveTempFile(compressedBytes);

        setState(() {
          _selectedAvatar = compressedFile;
          _avatarPreview = Uint8List.fromList(compressedBytes);
        });

        await ref
            .read(userControllerStateProvider.notifier)
            .uploadAvatar(widget.userId, compressedFile);

        if (mounted) {
          context.showAlert("✅ Avatar mis à jour !");
        }
      }
    } else {
      if (mounted) {
        context.showAlert("❌ Aucun fichier sélectionné");
      }
    }
  }

  Future<File> _saveTempFile(List<int> bytes) async {
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/temp_avatar.jpg');
    await tempFile.writeAsBytes(bytes, flush: true);
    return tempFile;
  }

  Future<void> _deleteAvatar() async {
    await ref
        .read(userControllerStateProvider.notifier)
        .deleteAvatar(widget.userId);

    setState(() {
      _selectedAvatar = null;
      _avatarPreview = null;
    });

    if (mounted) {
      context.showAlert("🗑 Avatar supprimé !");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(loginControllerNotifierProvider);
    final userAsync = ref.watch(userControllerStateProvider);
    return userAsync.when(
      data: (user) => buildAlertDialog(context, authController),
      error: (error, stackTrace) => Center(
        child: ErrorScreen(error: stackTrace.toString()),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  AlertDialog buildAlertDialog(
      BuildContext context, SignInState authController) {
    return AlertDialog.adaptive(
      title: Text(context.tr!.updateProfile),
      content: SingleChildScrollView(
        child: Form(
          onChanged: () => authController.status,
          key: _formKey,
          child: ListBody(
            children: <Widget>[
              if (_avatarPreview != null)
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: MemoryImage(_avatarPreview!),
                      ),
                      const SizedBox(height: 10),
                      Text(context.tr!.avatarPreview),
                    ],
                  ),
                ),
              _buildTextFormField(
                controller: _emailController,
                label: context.tr!.email,
                validator: _validateEmail,
              ),
              _buildTextFormField(
                controller: _passwordController,
                label: context.tr!.password,
                validator: _validatePassword,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.tr!.cancel),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.delete),
          onPressed: _deleteAvatar,
          label: Text(context.tr!.update),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
        ElevatedButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                context.showAlert("✅ Profil mis à jour !");
                context.pop();
              }
            },
            label: Text(context.tr!.update)),
        ElevatedButton.icon(
          icon: const Icon(Icons.image),
          onPressed: _handleAvatarUpload,
          label: Text(context.tr!.update),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      validator: validator,
    );
  }
}
