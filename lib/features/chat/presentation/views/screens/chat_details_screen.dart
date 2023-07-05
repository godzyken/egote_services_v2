import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/chat/infrastructure/repositories/cube_repository.dart';
import 'package:egote_services_v2/features/chat/infrastructure/repositories/cube_user_repository.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';

class ChatDetailsScreen extends ConsumerWidget {
  const ChatDetailsScreen({
    Key? key,
    required this.cubeUser,
    required this.cubeDialog
  }) : super(key: key);

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close, color: Colors.white,),
            ),
            automaticallyImplyLeading: false,
            title: Text(cubeDialog.type == CubeDialogType.PRIVATE ? "Contact details" : "Group details"),
            centerTitle: false,
            actions: [
              if (cubeDialog.type != CubeDialogType.PRIVATE)
                IconButton(
                  onPressed: () {
                    _exitDialog(context);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                )
            ],
          ),
        ),
        onWillPop: () => _onBackPressed(context),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    Navigator.pop(context);
    return Future.value(false);
  }

  _exitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave Dialog'),
          content: const Text("Are you sure you want to leave this dialog?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                deleteDialog(cubeDialog.dialogId!).then((onValue) {
                  context.showAlert('Success');
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil(
                    'select_dialog',
                        (route) => false,
                    arguments: {USER_ARG_NAME: cubeUser},
                  );
                }).catchError((error) {
                  context.showAlert(error);
                });
              },
            ),
          ],
        );
      },
    );
  }
}

class DetailsScreen extends ConsumerStatefulWidget {
  DetailsScreen({
    Key? key,
    required this.cubeUser,
    required this.cubeDialog
  }) : super(key: key);

  final CubeUser cubeUser;
  CubeDialog cubeDialog;

  @override
  ConsumerState createState() => cubeDialog.type
      == CubeDialogType.PRIVATE
      ? ContactScreenState()
      : GroupScreenState();
}

abstract class DetailsScreenState extends ConsumerState<DetailsScreen> {
  final Map<int, CubeUser> _occupants = {};
  var _isProgressContinues = false;

  @override
  void initState() {
    super.initState();
    if (_occupants.isEmpty) {
      initUsers();
    }
  }

  initUsers() async {
    _isProgressContinues = true;
    if (widget.cubeDialog.occupantsIds == null || widget.cubeDialog.occupantsIds!.isEmpty) {
      setState(() {
        _isProgressContinues = false;
      });
      return;
    }

    var result = await ref.watch(cubeUserRepositoryProvider).getCubeUsersByIds(
        widget.cubeDialog.occupantsIds!.toSet()
    );

    _occupants.clear();
    _occupants.addAll(result);
    _occupants.remove(widget.cubeUser.id);
    setState(() {
      _isProgressContinues = false;
    });
  }
}

class ContactScreenState extends DetailsScreenState {
  CubeUser? contactUser;

  initUser() {
    contactUser = _occupants.values.isNotEmpty
        ? _occupants.values.first
        : CubeUser(fullName: "Absent");
  }

  @override
  Widget build(BuildContext context) {
    initUser();
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              _buildAvatarFields(),
              _buildTextFields(),
              _buildButtons(),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Visibility(
                  maintainSize: false,
                  maintainAnimation: false,
                  maintainState: false,
                  visible: _isProgressContinues,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildAvatarFields() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: <Widget>[getUserAvatarWidget(contactUser!, 50)],
    );
  }

  Widget _buildTextFields() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              right: 10, left: 10,
              bottom: 3, // space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.primaries.single, // Text colour here
                      width: 1.0, // Underline width
                    ))),
            child: Text(
              contactUser!.fullName ??
                  contactUser!.login ??
                  contactUser!.email ??
                  '',
              style: TextStyle(
                color: Colors.primaries.single,
                fontSize: 20, // Text colour here
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: const Text(
            'Start dialog',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ],
    );
  }
}

class GroupScreenState extends DetailsScreenState {
  final TextEditingController _nameFilter = TextEditingController();
  String? _photoUrl = "";
  String _name = "";
  Set<int?> _usersToRemove = {};
  List<int>? _usersToAdd;

  GroupScreenState() : super() {
    _nameFilter.addListener(_nameListen);
    _nameFilter.text = widget.cubeDialog.name!;
    clearFields();
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text.trim();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    _buildPhotoFields(),
                    _buildTextFields(),
                    _buildGroupFields(),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Visibility(
                        maintainSize: false,
                        maintainAnimation: false,
                        maintainState: false,
                        visible: _isProgressContinues,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Update dialog",
        backgroundColor: Colors.blue,
        onPressed: () => _updateDialog(),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPhotoFields() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }

    Widget avatarCircle = getDialogAvatarWidget(widget.cubeDialog, 50);

    return Stack(
      children: <Widget>[
        InkWell(
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(45),
          onTap: () => _chooseUserImage(),
          child: avatarCircle,
        ),
        Positioned(
          top: 55.0,
          right: 35.0,
          child: RawMaterialButton(
            onPressed: () {
              _chooseUserImage();
            },
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(5.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.mode_edit,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }

   _chooseUserImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;

    await ref
        .watch(cubeRepositoryProvider)
        .getUploadingImageFuture(result)
        .then((cubeFile) {
      _photoUrl = cubeFile.getPublicUrl();
      setState(() {
        widget.cubeDialog.photo = _photoUrl;
      });
    })
        .catchError((error) {
          _processUpdateError(error);
        });
  }

  Widget _buildTextFields() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            style: TextStyle(color: Colors.primaries.single, fontSize: 20.0),
            controller: _nameFilter,
            decoration: const InputDecoration(labelText: 'Change group name'),
          ),
        ],
      ),
    );
  }

  _buildGroupFields() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return Column(
      children: <Widget>[
        _addMemberBtn(),
        _getUsersList(),
      ],
    );
  }

  Widget _addMemberBtn() {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3, // space between underline and text
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.green, // Text colour here
                width: 2.0, // Underline width
              ))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Members:',
            style: TextStyle(
              color: Colors.primaries.single,
              fontSize: 18, // Text colour here
            ),
          ),
          Expanded(flex: 1, child: Container()),
          IconButton(
            onPressed: () {
              _addOpponent();
            },
            icon: const Icon(
              Icons.person_add,
              size: 26.0,
              color: Colors.green,
            ),
          ),
          Visibility(
            visible: _usersToRemove.isNotEmpty,
            child: IconButton(
              onPressed: () {
                _removeOpponent();
              },
              icon: const Icon(
                Icons.person_remove,
                size: 26.0,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUsersList() {
    if (_isProgressContinues) {
      return const SizedBox.shrink();
    }
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      itemCount: _occupants.length,
      itemBuilder: _getListItemTile,
      separatorBuilder: (context, index) {
        return const Divider(thickness: 2, indent: 20, endIndent: 20);
      },
    );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    final user = _occupants.values.elementAt(index);
    Widget getUserAvatar() {
      if (user.avatar != null && user.avatar!.isNotEmpty) {
        return getUserAvatarWidget(user, 25);
      } else {
        return const Material(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          clipBehavior: Clip.hardEdge,
          child: Icon(
            Icons.account_circle,
            size: 50.0,
            color: Colors.grey,
          ),
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        child: Row(
          children: <Widget>[
            getUserAvatar(),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '${user.fullName}',
                        style: TextStyle(color: Colors.primaries.single),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Checkbox(
                value: _usersToRemove
                    .contains(_occupants.values.elementAt(index).id),
                onChanged: ((checked) {
                  setState(() {
                    if (checked!) {
                      _usersToRemove.add(_occupants.values.elementAt(index).id);
                    } else {
                      _usersToRemove
                          .remove(_occupants.values.elementAt(index).id);
                    }
                  });
                }),
              ),
            ),
          ],
        ),
        onPressed: () {
          log("user onPressed");
        },
      ),
    );
  }

  void _processUpdateError(exception) {
    log("_processUpdateUserError error $exception");
    setState(() {
      clearFields();
      _isProgressContinues = false;
    });
    context.showAlert(exception);
  }

  _addOpponent() async {
    _usersToAdd = await Navigator.pushNamed(
      context,
      'search_users',
      arguments: {
        USER_ARG_NAME: widget.cubeUser,
      },
    );

    if (_usersToAdd != null && _usersToAdd!.isNotEmpty) _updateDialog();
  }

  _removeOpponent() async {
    if (_usersToRemove.isNotEmpty) _updateDialog();
  }

  void _updateDialog() {
    if (_name.isEmpty &&
        _photoUrl!.isEmpty &&
        (_usersToAdd?.isEmpty ?? true) &&
        (_usersToRemove.isEmpty)) {
      context.showAlert('Nothing to save');
      return;
    }
    Map<String, dynamic> params = {};
    if (_name.isNotEmpty) params['name'] = _name;
    if (_photoUrl!.isNotEmpty) params['photo'] = _photoUrl;
    if (_usersToAdd?.isNotEmpty ?? false) {
      params['push_all'] = {'occupants_ids': List.of(_usersToAdd!)};
    }
    if (_usersToRemove.isNotEmpty) {
      params['pull_all'] = {'occupants_ids': List.of(_usersToRemove)};
    }

    setState(() {
      _isProgressContinues = true;
    });
    updateDialog(widget.cubeDialog.dialogId!, params).then((dialog) {
      widget.cubeDialog = dialog;
      context.showAlert('Success');
      setState(() {
        if ((_usersToAdd?.isNotEmpty ?? false) || (_usersToRemove.isNotEmpty)) {
          initUsers();
        }
        _isProgressContinues = false;
        clearFields();
      });
    }).catchError((error) {
      _processUpdateError(error);
    });
  }

  clearFields() {
    _name = '';
    _photoUrl = '';
    _usersToAdd = null;
    _usersToRemove.clear();
  }
}
