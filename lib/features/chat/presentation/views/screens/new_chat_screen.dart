import 'dart:developer';

import 'package:egote_services_v2/features/chat/domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewChatScreen extends ConsumerStatefulWidget {
  const NewChatScreen(
      {super.key,
      required this.currentUser,
      required this.cubeDialog,
      required this.users});

  final CubeUserMig currentUser;
  final CubeDialogMig cubeDialog;
  final List<CubeUserMig?> users;

  @override
  ConsumerState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends ConsumerState<NewChatScreen> {
  final TextEditingController _nameFilter = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameFilter.addListener(_nameListener);
  }

  String? _nameListener() {
    if (_nameFilter.text.length > 4) {
      log("_createDialogImage text= ${_nameFilter.text.trim()}");
      var nextDial = widget.cubeDialog;
      if (nextDial.dialogId!.isNotEmpty) {
        var lastName = widget.currentUser.fullName;
        lastName = _nameFilter.text.trim();

        return lastName;
      } else if (nextDial.name!.isEmpty) {
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
            child: Column(
              children: [
                _buildGroupFields(),
                _buildDialogOccupants(),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          heroTag: context.tr!.newDialog,
          backgroundColor: Colors.blue,
          onPressed: () => _createDialog(),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  _buildGroupFields() {
    getIcon() {
      return getDialogAvatarWidget(widget.cubeDialog, 45,
          placeholder: const Icon(
            Icons.add_a_photo,
            size: 45.0,
            color: Colors.blue,
          ));
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
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: TextField(
                autofocus: true,
                controller: _nameFilter,
                decoration: InputDecoration(labelText: context.tr!.groupName),
              ),
            )
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(16.0),
          child: Text(
            context.tr!.groupProvide,
            style: TextStyle(color: Colors.primaries.single),
          ),
        ),
      ],
    );
  }

  _createDialogImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;

    /*var uploadImageFuture =
        ref.watch(cubeRepositoryProvider).getUploadingImageFuture(result);*/

    /*   uploadImageFuture.then((cubeFile) {
      var url = cubeFile.getPublicUrl();
      log("_createDialogImage url= $url");
      setState(() {
        var newDial = widget.cubeDialog;
        if (newDial.photo!.isNotEmpty) {
          var newPhotoUrl = newDial.photo;
          newPhotoUrl = url;
        }
      });
    }).catchError((exception) {
      _processDialogError(exception);
    });*/
  }

  _buildDialogOccupants() {
    getListItemTile(BuildContext context, int index) {
      return Column(
        children: <Widget>[
          getUserAvatarWidget(widget.users[index]!, 25),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    widget.users[index]!.fullName ??
                        widget.users[index]!.login ??
                        widget.users[index]!.email ??
                        '???',
                    style: TextStyle(color: Colors.primaries.single),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    getOccupants() {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: widget.cubeDialog.occupantsIds!.length,
        itemBuilder: getListItemTile,
      );
    }

    return Expanded(
      child: getOccupants(),
    );
  }

/*  void _processDialogError(exception) {
    log("error $exception");
    context.showAlert(exception);
  }*/

  _createDialog() {
    log("_createDialog cubeDialog= ${widget.cubeDialog}");
    if (widget.cubeDialog.name == null || widget.cubeDialog.name!.length < 5) {
      context.showAlert(context.tr!.charSet4);
    } else {
      /* createDialog(widget.cubeDialog).then((createdDialog) {
        context.pushReplacementNamed('chat_dialog', extra: {
          USER_ARG_NAME: widget.currentUser,
          DIALOG_ARG_NAME: createdDialog
        });
      }).catchError((exception) {
        _processDialogError(exception);
      });*/
    }
  }
}
