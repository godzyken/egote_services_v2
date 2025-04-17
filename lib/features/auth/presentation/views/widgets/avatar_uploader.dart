import 'dart:io';
import 'dart:typed_data';

import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';

import '../../../../../config/providers/firebase/firebase_providers.dart';
import '../../controller/user_controller_state.dart';

class AvatarUploader extends ConsumerWidget {
  const AvatarUploader({super.key});

  Future<void> _pickAndUploadAvatar(BuildContext context, WidgetRef ref) async {
    final picker = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (picker != null && picker.files.isNotEmpty) {
      final pickedFile = picker.files.first;
      final file = File(pickedFile.path!);

      final firebaseUser = ref.read(authStreamProvider).value;

      if (context.mounted && firebaseUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('⚠️ Utilisateur non connecté')),
        );
        return;
      }

      final userId = firebaseUser?.uid;

      // Upload
      final controller = ref.read(userControllerStateProvider.notifier);
      await controller.uploadAvatar(userId!, file);

      // Optionnel : Reload automatique de l’état si besoin
      await controller.reloadUser(userId);
    }
  }

  Future<File> compressAndResizeImage(File originalFile,
      {int maxWith = 600, int quality = 80}) async {
    final bytes = await originalFile.readAsBytes();

    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Image is null');

    final resizedImage = img.copyResize(image, width: 200, height: 200);

    final jpg = img.encodeJpg(resizedImage, quality: quality);

    final compressedFile = File('${originalFile.path}_compressed.jpg');
    await compressedFile.writeAsBytes(jpg);

    return compressedFile;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userControllerStateProvider);

    return userState.when(
      data: (user) {
        return Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user.avatarUrl.isNotEmpty
                  ? NetworkImage(user.avatarUrl)
                  : null,
              child: user.avatarUrl.isEmpty ? const Icon(Icons.person) : null,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _pickAndUploadAvatar(context, ref),
              icon: const Icon(Icons.upload),
              label: const Text('Changer l’avatar'),
            )
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Erreur: $err'),
    );
  }
}

class AvatarUploaderDialog extends ConsumerStatefulWidget {
  final String userId;

  const AvatarUploaderDialog({super.key, required this.userId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AvatarUploaderDialogState();
}

class _AvatarUploaderDialogState extends ConsumerState<AvatarUploaderDialog> {
  File? _selectedAvatar;
  Uint8List? _avatarPreview;
  bool _isLoading = false;

/*  Future<void> _pickAndPreviewAvatar() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      final originalBytes = result.files.single.bytes!;
      final decoded = img.decodeImage(originalBytes);

      if (decoded != null) {
        final resized = img.copyResize(decoded, width: 300);
        final compressedBytes = img.encodeJpg(resized, quality: 80);

        // Save temp file for upload
        final tempFile = await _saveTempFile(compressedBytes);

        setState(() {
          _selectedAvatar = tempFile;
          _avatarPreview = Uint8List.fromList(compressedBytes);
        });
      }
    }
  }*/

  Future<void> _pickCropAndPreviewAvatar() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.path != null && mounted) {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: result.files.single.path!,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 80,
          compressFormat: ImageCompressFormat.jpg,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Recadrer l\'image',
              toolbarColor: Theme.of(context).colorScheme.onSurface,
              toolbarWidgetColor: Theme.of(context).colorScheme.onSurface,
              backgroundColor: Theme.of(context).colorScheme.surface,
              statusBarColor: Theme.of(context).colorScheme.surface,
            ),
            IOSUiSettings(
              title: 'Cropper',
              cancelButtonTitle: 'Annuler',
              doneButtonTitle: 'Valider',
              aspectRatioLockEnabled: true,
              aspectRatioPickerButtonHidden: true,
              showCancelConfirmationDialog: true,
            ),
            WebUiSettings(
              context: context,
            ),
          ]);

      if (croppedFile != null) {
        final compressedFile = await _compressImage(File(croppedFile.path));
        final previewBytes = await compressedFile.readAsBytes();
        setState(() {
          _selectedAvatar = compressedFile;
          _avatarPreview = Uint8List.fromList(previewBytes);
        });
      }
    }
  }

  // Future<File> _saveTempFile(List<int> bytes) async {
  //   final tempDir = Directory.systemTemp;
  //   final file = File(
  //       '${tempDir.path}/avatar_${DateTime.now().millisecondsSinceEpoch}.jpg');
  //   return file.writeAsBytes(bytes, flush: true);
  // }

  Future<void> _deleteAvatar() async {
    setState(() => _isLoading = true);

    try {
      await ref
          .read(userControllerStateProvider.notifier)
          .deleteAvatar(widget.userId); // Assure-toi que cette méthode existe
      await ref
          .read(userControllerStateProvider.notifier)
          .reloadUser(widget.userId);

      if (mounted) {
        context.showAlert("🗑 Avatar supprimé !");
        context.pop(true);
      }
    } catch (e) {
      if (mounted) context.showAlert("🚨 Erreur: ${e.toString()}");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _resetPreview() {
    setState(() {
      _selectedAvatar = null;
      _avatarPreview = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerStateProvider).value;

    final currentAvatarUrl = userState?.avatarUrl ?? '';

    return AlertDialog.adaptive(
      title: const Text('Modifier l\'avatar'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: _avatarPreview != null
                ? NetworkImage(_avatarPreview! as String)
                : (currentAvatarUrl.isNotEmpty
                    ? NetworkImage(currentAvatarUrl)
                    : null) as ImageProvider?,
            child: (_avatarPreview == null && currentAvatarUrl.isEmpty)
                ? const Icon(Icons.person, size: 40)
                : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _isLoading ? null : _pickCropAndPreviewAvatar,
            icon: const Icon(Icons.crop),
            label: const Text("Choisir et recadrer l'image"),
          ),
          if (_avatarPreview != null)
            TextButton.icon(
              onPressed: _isLoading ? null : _resetPreview,
              icon: const Icon(Icons.refresh),
              label: const Text("Réinitialiser l'image"),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text("Annuler"),
        ),
        if (currentAvatarUrl.isNotEmpty)
          TextButton.icon(
            icon: const Icon(Icons.delete),
            onPressed: _isLoading ? null : _deleteAvatar,
            label: const Text("Supprimer l'avatar"),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ElevatedButton.icon(
          onPressed: _isLoading ? null : _uploadAvatar,
          icon: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.upload),
          label: const Text("Enregistrer"),
        ),
      ],
    );
  }

  Future<File> _compressImage(File originalFile, {int quality = 80}) async {
    final bytes = await originalFile.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Image is null');
    final resizedImage = img.copyResize(image, width: 200, height: 200);
    final compressedBytes = img.encodeJpg(resizedImage, quality: quality);
    final tempPath = File('${originalFile.path}_compressed.jpg');
    await tempPath.writeAsBytes(compressedBytes, flush: true);
    return tempPath;
  }

  Future<void> _uploadAvatar() async {
    if (_selectedAvatar == null) {
      context.showAlert("📷 Veuillez sélectionner une image d'abord.");
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref
          .read(userControllerStateProvider.notifier)
          .uploadAvatar(widget.userId, _selectedAvatar!);
      await ref
          .read(userControllerStateProvider.notifier)
          .reloadUser(widget.userId);

      if (mounted) {
        context.showAlert("✅ Avatar mis à jour !");
        context.pop(true); // signal succès
      }
    } catch (e) {
      if (mounted) context.showAlert("🚨 Erreur: ${e.toString()}");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
