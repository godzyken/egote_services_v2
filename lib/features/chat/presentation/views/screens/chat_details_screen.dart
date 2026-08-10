import 'dart:developer' as dev;
import 'dart:io' as io;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:connectycube_sdk/connectycube_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/cube_config/cube_config.dart';
import 'package:egote_services_v2/features/chat/infrastructure/repositories/cube_user_repository.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';

/// Top-level details wrapper that dynamically loads the appropriate view.
class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (cubeDialog.type == CubeDialogType.PRIVATE) {
      return ContactDetailView(cubeUser: cubeUser, cubeDialog: cubeDialog);
    }
    return GroupDetailView(cubeUser: cubeUser, cubeDialog: cubeDialog);
  }
}

// ==========================================
// ABSTRACT BASE STATE FOR SHARED OCCUPANT LOGIC
// ==========================================
abstract class BaseDetailsState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  CubeUser get cubeUser;
  CubeDialog get cubeDialog;

  final Map<int, CubeUser> occupants = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initOccupants();
  }

  Future<void> initOccupants() async {
    final ids = cubeDialog.occupantsIds;
    if (ids == null || ids.isEmpty) return;

    setState(() => isLoading = true);

    try {
      final result = await ref
          .read(cubeUserRepositoryProvider)
          .getCubeUsersByIds(ids.toSet());

      occupants.clear();
      occupants.addAll(result);
      occupants.remove(cubeUser.id);
    } catch (e, stack) {
      dev.log('Error fetching occupants: $e', error: e, stackTrace: stack);
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}

// ==========================================
// 1. CONTACT / PRIVATE DIALOG DETAIL VIEW
// ==========================================
class ContactDetailView extends ConsumerStatefulWidget {
  const ContactDetailView({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  ConsumerState<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends BaseDetailsState<ContactDetailView> {
  @override
  CubeUser get cubeUser => widget.cubeUser;
  @override
  CubeDialog get cubeDialog => widget.cubeDialog;

  CubeUser? get contactUser => occupants.values.firstOrNull;

  @override
  Widget build(BuildContext context) {
    final user = contactUser ?? CubeUser(fullName: context.tr!.absent);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.contactDetails),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getUserAvatarWidget(user, 50),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
              ),
              child: Text(
                user.fullName ?? user.login ?? user.email ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.chat),
              label: Text(context.tr!.startDialog),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. GROUP DIALOG DETAIL VIEW
// ==========================================
class GroupDetailView extends ConsumerStatefulWidget {
  const GroupDetailView({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  ConsumerState<GroupDetailView> createState() => _GroupDetailViewState();
}

class _GroupDetailViewState extends BaseDetailsState<GroupDetailView> {
  late final TextEditingController _nameController;
  final Set<int> _usersToRemove = {};
  List<int>? _usersToAdd;
  String? _newPhotoUrl;

  @override
  CubeUser get cubeUser => widget.cubeUser;
  @override
  CubeDialog get cubeDialog => widget.cubeDialog;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.cubeDialog.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _chooseGroupImage() async {
    final result = await FilePicker.pickFiles(type: FileType.image);
    if (result == null || result.files.single.path == null) return;

    setState(() => isLoading = true);
    try {
      final filePath = result.files.single.path;
      final cubeFile = await uploadFile(io.File(filePath!), isPublic: true);
      _newPhotoUrl = cubeFile.getPublicUrl();
    } catch (e) {
      if (mounted) context.showAlert(e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> _addOpponents() async {
    final selectedUsers = await context.pushNamed<List<int>>(
      'search_users',
      extra: {USER_ARG_NAME: widget.cubeUser},
    );

    if (selectedUsers != null && selectedUsers.isNotEmpty) {
      _usersToAdd = selectedUsers;
      await _updateDialog();
    }
  }

  Future<void> _updateDialog() async {
    final newName = _nameController.text.trim();
    final hasNameChange = newName.isNotEmpty && newName != widget.cubeDialog.name;
    final hasPhotoChange = _newPhotoUrl != null && _newPhotoUrl!.isNotEmpty;
    final hasAdditions = _usersToAdd != null && _usersToAdd!.isNotEmpty;
    final hasRemovals = _usersToRemove.isNotEmpty;

    if (!hasNameChange && !hasPhotoChange && !hasAdditions && !hasRemovals) {
      context.showAlert(context.tr!.nothingToSave);
      return;
    }

    final Map<String, dynamic> params = {};
    if (hasNameChange) params['name'] = newName;
    if (hasPhotoChange) params['photo'] = _newPhotoUrl;
    if (hasAdditions) params['push_all'] = {'occupants_ids': _usersToAdd};
    if (hasRemovals) params['pull_all'] = {'occupants_ids': _usersToRemove.toList()};

    setState(() => isLoading = true);

    try {
      final updatedDialog = await updateDialog(widget.cubeDialog.dialogId!, params);
      widget.cubeDialog.name = updatedDialog.name;
      widget.cubeDialog.photo = updatedDialog.photo;
      widget.cubeDialog.occupantsIds = updatedDialog.occupantsIds;

      if (mounted) {
        context.showAlert(context.tr!.success);
        _resetSelections();
        await initOccupants();
      }
    } catch (error) {
      if (mounted) context.showAlert(error.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _resetSelections() {
    _usersToAdd = null;
    _usersToRemove.clear();
    _newPhotoUrl = null;
  }

  void _confirmLeaveDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.tr!.leaveDialog),
        content: Text(context.tr!.confirmLeaveDial),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.tr!.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              setState(() => isLoading = true);

              try {
                await deleteDialog(widget.cubeDialog.dialogId!);
                if (mounted) {
                  context.pushReplacementNamed(
                    'select_dialog',
                    extra: {USER_ARG_NAME: widget.cubeUser},
                  );
                }
              } catch (e) {
                if (mounted) {
                  setState(() => isLoading = false);
                  context.showAlert(e.toString());
                }
              }
            },
            child: Text(context.tr!.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.groupDetails),
        actions: [
          IconButton(
            onPressed: _confirmLeaveDialog,
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                _buildAvatarPicker(),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: context.tr!.changeGroupName,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                _buildMembersHeader(),
                const Divider(thickness: 1.5),
                _buildOccupantsList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'update_group_btn',
        onPressed: _updateDialog,
        child: const Icon(Icons.check),
      ),
    );
  }

  Widget _buildAvatarPicker() {
    return Stack(
      children: [
        InkWell(
          onTap: _chooseGroupImage,
          borderRadius: BorderRadius.circular(50),
          child: getDialogAvatarWidget(widget.cubeDialog, 50),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              iconSize: 18,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: _chooseGroupImage,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMembersHeader() {
    return Row(
      children: [
        Text(
          '${context.tr!.members}: ${occupants.length}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        IconButton(
          onPressed: _addOpponents,
          icon: const Icon(Icons.person_add, color: Colors.green),
        ),
        if (_usersToRemove.isNotEmpty)
          IconButton(
            onPressed: _updateDialog,
            icon: const Icon(Icons.person_remove, color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildOccupantsList() {
    final list = occupants.values.toList();
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final user = list[index];
        final isSelected = _usersToRemove.contains(user.id);

        return CheckboxListTile(
          value: isSelected,
          title: Text(user.fullName ?? user.login ?? '${user.id}'),
          secondary: getUserAvatarWidget(user, 20),
          onChanged: (checked) {
            setState(() {
              if (checked == true) {
                _usersToRemove.add(user.id!);
              } else {
                _usersToRemove.remove(user.id);
              }
            });
          },
        );
      },
    );
  }
}