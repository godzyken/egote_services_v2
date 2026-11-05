import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/chat/infrastructure/repositories/cube_repository.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/cube_config/cube_config.dart';

class NewChatScreen extends ConsumerStatefulWidget {
  const NewChatScreen({
    super.key,
    required this.currentUser,
    required this.cubeDialog,
    required this.users,
  });

  final CubeUser currentUser;
  final CubeDialog cubeDialog;
  final List<CubeUser?> users;

  @override
  ConsumerState<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends ConsumerState<NewChatScreen> {
  final TextEditingController _nameFilter = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameFilter.addListener(_nameListener);
  }

  @override
  void dispose() {
    _nameFilter.dispose();
    super.dispose();
  }

  String? _nameListener() {
    if (_nameFilter.text.length > 4) {
      developer.log("_createDialogImage text= ${_nameFilter.text.trim()}");
      widget.cubeDialog.name = _nameFilter.text.trim();
      var nextDial = widget.cubeDialog;
      if (nextDial.dialogId != null && nextDial.dialogId!.isNotEmpty) {
        var lastName = widget.currentUser.fullName ?? '';
        lastName = _nameFilter.text.trim();
        return lastName;
      } else if (nextDial.name == null || nextDial.name!.isEmpty) {
        return widget.currentUser.fullName;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [_buildGroupFields(), _buildDialogOccupants()]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: context.tr!.newDialog,
        backgroundColor: Colors.blue,
        onPressed: () => _createDialog(),
        child: const Icon(Icons.check, color: Colors.white),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildGroupFields() {
    Widget getIcon() {
      return getDialogAvatarWidget(
        widget.cubeDialog,
        45,
        placeholder: const Icon(
          Icons.add_a_photo,
          size: 45.0,
          color: Colors.blue,
        ),
      );
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            RawMaterialButton(
              onPressed: () => _createDialogImage(),
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(0),
              shape: const CircleBorder(),
              child: getIcon(),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: TextField(
                autofocus: true,
                controller: _nameFilter,
                decoration: InputDecoration(labelText: context.tr!.groupName),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(16.0),
          child: Text(
            context.tr!.groupProvide,
            style: TextStyle(color: Colors.primaries.first),
          ),
        ),
      ],
    );
  }

  Future<void> _createDialogImage() async {
    FilePickerResult? result = await FilePicker.pickFiles(type: FileType.image);

    if (result == null) return;

    final uploadImageFuture = ref
        .watch(cubeRepositoryProvider)
        .getUploadingImageFuture(result);

    uploadImageFuture
        .then((cubeFile) {
          final url = cubeFile.getPublicUrl();
          developer.log("_createDialogImage url= $url");
          setState(() {
            widget.cubeDialog.photo = url;
          });
        })
        .catchError((exception) {
          _processDialogError(exception);
        });
  }

  Widget _buildDialogOccupants() {
    Widget getListItemTile(BuildContext context, int index) {
      final user = widget.users[index];
      if (user == null) return const SizedBox.shrink();
      return Column(
        children: <Widget>[
          getUserAvatarWidget(user, 25),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    user.fullName ?? user.login ?? user.email ?? '???',
                    style: TextStyle(color: Colors.primaries.first),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget getOccupants() {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: widget.cubeDialog.occupantsIds?.length ?? 0,
        itemBuilder: getListItemTile,
      );
    }

    return Expanded(child: getOccupants());
  }

  void _processDialogError(dynamic exception) {
    developer.log("error $exception");
    context.showAlert(exception.toString());
  }

  void _createDialog() {
    developer.log("_createDialog cubeDialog= ${widget.cubeDialog}");
    if (widget.cubeDialog.name == null || widget.cubeDialog.name!.length < 5) {
      context.showAlert(context.tr!.charSet4);
    } else {
      createDialog(widget.cubeDialog)
          .then((createdDialog) {
            if (!mounted) return;
            context.pushReplacementNamed(
              'chat_dialog',
              extra: {
                USER_ARG_NAME: widget.currentUser,
                DIALOG_ARG_NAME: createdDialog,
              },
            );
          })
          .catchError((exception) {
            if (!mounted) return;
            _processDialogError(exception);
          });
    }
  }
}
