//import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'dart:developer';

import 'package:egote_services_v2/features/chat/domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/cube_config/cube_config.dart';

typedef DlgProc = Dialog Function(Dialog, int, BodyNewChatLayout,
    {CubeUserMig x, AsyncValueGetter<CubeUserMig> guest});

class BodyNewChatLayout extends ConsumerStatefulWidget {
  const BodyNewChatLayout({super.key, required this.currentUser});

  final CubeUserMig currentUser;

  @override
  ConsumerState createState() => _BodyNewChatLayoutState();
}

class _BodyNewChatLayoutState extends ConsumerState<BodyNewChatLayout> {
  List<CubeUserMig> userList = [];
  final Set<int> _selectedUsers = {};
  var _isUsersContinues = false;
  var _isPrivateDialog = true;
  String? userToSearch;
  String userMsg = " ";

  _searchUser(value) {
    log("searchUser _user= $value");
    if (value != null) {
      setState(() {
        userToSearch = value;
        _isUsersContinues = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            children: [
              _buildTextFields(),
              _buildDialogButton(),
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
              ),
              Expanded(
                child: _getUsersList(context),
              ),
            ],
          )),
      floatingActionButton: Visibility(
        visible: !_isPrivateDialog,
        child: FloatingActionButton(
          heroTag: context.tr!.newDialog,
          backgroundColor: Colors.blue,
          onPressed: () => _createDialog(context, _selectedUsers, true),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: <Widget>[
        TextField(
            autofocus: true,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(labelText: context.tr!.searchUsers),
            onSubmitted: (value) {
              _searchUser(value.trim());
            }),
      ],
    );
  }

  Widget _buildDialogButton() {
    getIcon() {
      if (_isPrivateDialog) {
        return Icons.person;
      } else {
        return Icons.people;
      }
    }

    getDescription() {
      if (_isPrivateDialog) {
        return context.tr!.createGroupChat;
      } else {
        return context.tr!.createPrivateChat;
      }
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        icon: Icon(
          getIcon(),
          size: 25.0,
          color: Colors.blue,
        ),
        onPressed: () {
          setState(() {
            _isPrivateDialog = !_isPrivateDialog;
          });
        },
        label: Text(getDescription()),
      ),
    );
  }

  Widget _getUsersList(BuildContext context) {
    clearValues() {
      _isUsersContinues = false;
      userToSearch = null;
      userMsg = " ";
      userList.clear();
    }

    if (_isUsersContinues) {
      if (userToSearch != null && userToSearch!.isNotEmpty) {
        setState(() {
          clearValues();
        });
        /*     getUsersByFullName(userToSearch!).then((users) {
          log("getusers: $users");
          setState(() {
            clearValues();
            userList.addAll(users!.items);
          });
        }).catchError((onError) {
          log("getusers catchError: $onError");
          setState(() {
            clearValues();
            userMsg = context.tr!.userNotFound;
          });
        });*/
      }
    }
    if (userList.isEmpty) {
      return FittedBox(
        fit: BoxFit.contain,
        child: Text(userMsg),
      );
    } else {
      return ListView.builder(
        itemCount: userList.length,
        itemBuilder: _getListItemTile,
      );
    }
  }

  Widget _getListItemTile(BuildContext context, int index) {
    getPrivateWidget() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
        child: TextButton(
          child: Row(
            children: <Widget>[
              getUserAvatarWidget(userList[index], 30),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                        child: Text(
                          '${userList[index].fullName}',
                          style: TextStyle(color: Colors.primaries.single),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 25.0,
                color: Colors.primaries.single,
              ),
            ],
          ),
          onPressed: () {
            _createDialog(context, {userList[index].id!}, false);
          },
        ),
      );
    }

    getGroupWidget() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
        child: TextButton(
          child: Row(
            children: <Widget>[
              getUserAvatarWidget(userList[index], 30),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                        child: Text(
                          '${userList[index].fullName}',
                          style: TextStyle(color: Colors.primaries.single),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Checkbox(
                value: _selectedUsers.contains(userList[index].id),
                onChanged: ((checked) {
                  setState(() {
                    if (checked!) {
                      _selectedUsers.add(userList[index].id!);
                    } else {
                      _selectedUsers.remove(userList[index].id);
                    }
                  });
                }),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              if (_selectedUsers.contains(userList[index].id)) {
                _selectedUsers.remove(userList[index].id);
              } else {
                _selectedUsers.add(userList[index].id!);
              }
            });
          },
        ),
      );
    }

    getItemWidget() {
      if (_isPrivateDialog) {
        return getPrivateWidget();
      } else {
        return getGroupWidget();
      }
    }

    return getItemWidget();
  }

  void _createDialog(BuildContext context, Set<int> users, bool isGroup) async {
    log("_createDialog with users= $users");
    if (isGroup) {
      CubeDialogMig newDialog = CubeDialogMig(
          const CubeDialogTypeMig.GROUP(2).id,
          occupantsIds: users.toList());
      List<CubeUserMig> usersToAdd = users
          .map((id) => userList.firstWhere((user) => user.id == id))
          .toList();

      context.pushNamed('configure_group_dialog', extra: {
        USER_ARG_NAME: widget.currentUser,
        DIALOG_ARG_NAME: newDialog,
        SELECTED_USERS_ARG_NAME: usersToAdd,
      });
    } else {
      /* CubeDialogMig newDialog = CubeDialogMig(
          const CubeDialogTypeMig.PRIVATE(1).id,
          occupantsIds: users.toList());
      createDialog(newDialog).then((createdDialog) {
        context.pushReplacementNamed('chat_dialog', extra: {
          USER_ARG_NAME: widget.currentUser,
          DIALOG_ARG_NAME: createdDialog
        });
      }).catchError((error) {
        _processCreateDialogError(error);
      });*/
    }
  }

/*  void _processCreateDialogError(exception) {
    log("Login error $exception");
    context.showAlert(exception);
  }*/

  @override
  void initState() {
    super.initState();
    log("initState");
  }
}
