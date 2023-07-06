import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';

class BodyNewChatLayout extends ConsumerStatefulWidget {
  const BodyNewChatLayout({
    Key? key,
    required this.currentUser
  }) : super(key: key);

  final CubeUser currentUser;

  @override
  ConsumerState createState() => _BodyNewChatLayoutState();
}

class _BodyNewChatLayoutState extends ConsumerState<BodyNewChatLayout> {

  List<CubeUser> userList = [];
  Set<int> _selectedUsers = {};
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
          heroTag: "New dialog",
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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(labelText: 'Search users'),
                onSubmitted: (value) {
                  _searchUser(value.trim());
                }),
          ),
        ],
      ),
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
        return "Create group chat";
      } else {
        return "Create private chat";
      }
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        icon: Icon(
          getIcon(),
          size: 25.0,
          color: Colors.primaries.single,
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
        getUsersByFullName(userToSearch!).then((users) {
          log("getusers: $users");
          setState(() {
            clearValues();
            userList.addAll(users!.items);
          });
        }).catchError((onError) {
          log("getusers catchError: $onError");
          setState(() {
            clearValues();
            userMsg = "Couldn't find user";
          });
        });
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
              Container(
                child: Icon(
                  Icons.arrow_forward,
                  size: 25.0,
                  color: Colors.primaries.single,
                ),
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
              Container(
                child: Checkbox(
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
      CubeDialog newDialog =
      CubeDialog(CubeDialogType.GROUP, occupantsIds: users.toList());
      List<CubeUser> usersToAdd = users
          .map((id) => userList.firstWhere((user) => user.id == id))
          .toList();

      context.pushNamed('configure_group_dialog', extra: {
        USER_ARG_NAME: widget.currentUser,
        DIALOG_ARG_NAME: newDialog,
        SELECTED_USERS_ARG_NAME: usersToAdd,
      });
    } else {
      CubeDialog newDialog =
      CubeDialog(CubeDialogType.PRIVATE, occupantsIds: users.toList());
      createDialog(newDialog).then((createdDialog) {
        context.pushReplacementNamed('chat_dialog', extra: {
          USER_ARG_NAME: widget.currentUser,
          DIALOG_ARG_NAME: createdDialog
        });
      }).catchError((error) {
        _processCreateDialogError(error);
      });
    }
  }

  void _processCreateDialogError(exception) {
    log("Login error $exception");
    context.showAlert(exception);
  }

  @override
  void initState() {
    super.initState();
    log("initState");
  }
}
