import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/providers/cube/cube_providers.dart';
import '../../../../../config/providers/firebase/firebase_providers.dart';
import '../../../../common/presentation/extensions/extensions.dart';
import '../../../application/managers/push_notifications_manager.dart';
import '../../../data/data_sources/local/pref_util.dart';
import '../../../infrastructure/repositories/cube_repository.dart';

class ChatSettingsScreen extends ConsumerWidget {
  const ChatSettingsScreen({
    Key? key,
    required this.currentUser
  }) : super(key: key);

  final CubeUser currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close, color: Colors.white,),
        ),
        automaticallyImplyLeading: false,
        title: const Text('Chat Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: BodySettingsLayout(currentUser),
    );
  }
}

class BodySettingsLayout extends ConsumerStatefulWidget {
  final CubeUser currentUser;

  const BodySettingsLayout(this.currentUser, {super.key});

  @override
  ConsumerState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends ConsumerState<BodySettingsLayout> {

  var _isUsersContinues = false;
  String? _avatarUrl = "";
  final TextEditingController _loginFilter = TextEditingController();
  final TextEditingController _nameFilter = TextEditingController();
  final TextEditingController _emailFilter = TextEditingController();
  String _login = "";
  String _name = "";
  String _email = "";

  _BodyLayoutState() {
      _loginFilter.addListener(_loginListen);
      _nameFilter.addListener(_nameListen);
      _emailFilter.addListener(_emailListen);
      _nameFilter.text = widget.currentUser.fullName ?? '';
      _loginFilter.text = widget.currentUser.login ?? '';
      _emailFilter.text = widget.currentUser.email ?? '';
  }

  void _loginListen() {
    if (_loginFilter.text.isEmpty) {
    _login = "";
    } else {
    _login = _loginFilter.text.trim();
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
    _name = "";
    } else {
    _name = _nameFilter.text.trim();
    }
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
    _email = "";
    } else {
    _email = _emailFilter.text.trim();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints:  const BoxConstraints(maxWidth: 400),
            child: Container(
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
                      visible: _isUsersContinues,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarFields() {
    Widget avatarCircle = getUserAvatarWidget(widget.currentUser, 50);

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

    var uploadImageFuture = ref.watch(cubeRepositoryProvider)
        .getUploadingImageFuture(result);

    uploadImageFuture.then((cubeFile) {
      _avatarUrl = cubeFile.getPublicUrl();
      setState(() {
        widget.currentUser.avatar = _avatarUrl;
      });
    }).catchError((exception) {
      _processUpdateUserError(exception);
    });
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _nameFilter,
              decoration: const InputDecoration(labelText: 'Change name'),
            ),
          ),
          Container(
            child: TextField(
              controller: _loginFilter,
              decoration: const InputDecoration(labelText: 'Change login'),
            ),
          ),
          Container(
            child: TextField(
              controller: _emailFilter,
              decoration: const InputDecoration(labelText: 'Change e-mail'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 6,
          ),
          ElevatedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(120, 36),
            ),
            onPressed: _updateUser,
            child: const Text('Save'),
          ),
          const SizedBox(
            height: 6,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(160, 36),
            ),
            icon: const Icon(
              Icons.logout,
            ),
            label: const Text('Logout'),
            onPressed: _logout,
          ),
          const SizedBox(
            height: 6,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red.shade300,
              minimumSize: const Size(160, 36),
            ),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              'Delete user',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: _deleteUserPressed,
          ),
        ],
      ),
    );
  }

  void _updateUser() {
    log(
        '_updateUser user with login: $_login, name: $_name, e-mail: $_email');
    if (_login.isEmpty &&
        _name.isEmpty &&
        _avatarUrl!.isEmpty &&
        _email.isEmpty) {
      context.showAlert('Nothing to save');
      return;
    }
    var userToUpdate = CubeUser()..id = widget.currentUser.id;

    if (_name.isNotEmpty) userToUpdate.fullName = _name;
    if (_login.isNotEmpty) userToUpdate.login = _login;
    if (_email.isNotEmpty) userToUpdate.email = _email;
    if (_avatarUrl!.isNotEmpty) userToUpdate.avatar = _avatarUrl;
    setState(() {
      _isUsersContinues = true;
    });
    updateUser(userToUpdate).then((user) {
      SharedPrefs.instance.updateUser(user);
      context.showAlert('Success');
      setState(() {
        _isUsersContinues = false;
      });
    }).catchError((exception) {
      _processUpdateUserError(exception);
    });
  }

  void _logout() {
    log('_logout $_login and $_name');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want logout current user"),
          actions: <Widget>[
            TextButton(
              child: const Text("CANCEL"),
              onPressed: () {
                context.pop(context);
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                signOut().then(
                      (voidValue) {
                    context.pop(context); // cancel current Dialog
                  },
                ).catchError(
                      (onError) {
                    context.pop(context); // cancel current Dialog
                  },
                ).whenComplete(() {
                  ref.watch(cubeChatConnectionProvider).destroy();
                  PushNotificationsManager.instance.unsubscribe();
                  ref.watch(firebaseAuthProvider).currentUser
                      ?.unlink(PhoneAuthProvider.PROVIDER_ID);
                  SharedPrefs.instance.deleteUser();
                  context.pop(context); // cancel current screen
                  _navigateToLoginScreen();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteUserPressed() {
    log('_deleteUserPressed ${_login.isNotEmpty ? _login : _email}');
    _userDelete();
  }

  void _userDelete() {
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: const Text("Delete user"),
          content: const Text("Are you sure you want to delete current user?"),
          actions: <Widget>[
            TextButton(
              child: const Text("CANCEL"),
              onPressed: () {
                context.pop(context);
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () async {
                CubeChatConnection.instance.destroy();
                await SharedPrefs.instance.deleteUser();

                deleteUser(widget.currentUser.id!).then(
                      (voidValue) {
                    context.pop(context); // cancel current Dialog
                  },
                ).catchError(
                      (onError) {
                    context.pop(context); // cancel current Dialog
                  },
                ).whenComplete(() async {
                  await PushNotificationsManager.instance.unsubscribe();
                  context.pop(); // cancel current screen
                  _navigateToLoginScreen();
                });
              },
            ),
          ],
        );
      },
    );
  }

  _navigateToLoginScreen() {
    context.pushReplacementNamed('login');
  }

  void _processUpdateUserError(exception) {
    log("_processUpdateUserError error $exception");
    setState(() {
      _isUsersContinues = false;
    });
    ErrorScreen(error: exception, key: context.widget.key);
  }

}
