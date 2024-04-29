// import 'package:connectycube_sdk/connectycube_chat.dart';
import 'dart:developer';

import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/presentation/extensions/extensions.dart';

class AddOccupantScreen extends ConsumerStatefulWidget {
  const AddOccupantScreen(
      {super.key, required this.cubeUser, required this.id});

  final int id;
  final CubeUserMig cubeUser;

  @override
  ConsumerState createState() => _AddOccupantScreenState();
}

class _AddOccupantScreenState extends ConsumerState<AddOccupantScreen> {
  late final CubeUserMig currentUser;
  late int idCopy;

  @override
  void initState() {
    super.initState();
    idCopy = widget.id;
    currentUser = widget.cubeUser;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (context) => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(context.tr!.contacts),
        ),
        body: BodyLayout(currentUser),
      ),
    );
  }

  _onBackPressed(bool isPop) {
    context.pop(context);
    return Future.value(false);
  }
}

class BodyLayout extends ConsumerStatefulWidget {
  final CubeUserMig currentUser;

  const BodyLayout(this.currentUser, {super.key});

  @override
  ConsumerState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends ConsumerState<BodyLayout> {
  late final CubeUserMig currentUser;
  List<CubeUserMig> userList = [];
  final Set<int> _selectedUsers = {};
  var _isUsersContinues = false;
  String? userToSearch;
  String userMsg = " ";

  @override
  void initState() {
    super.initState();
    _isUsersContinues = false;
    currentUser = const CubeUserMig();
  }

  _searchUser(value) {
    log("searchUser _user= $value");
    if (value != null) {
      setState(() {
        userToSearch = value;
        _isUsersContinues = true;
      });
    }
    _isUsersContinues = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            _buildTextFields(),
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
        ),
      ),
      floatingActionButton: Visibility(
          visible: _selectedUsers.isNotEmpty,
          child: FloatingActionButton(
            heroTag: context.tr!.updateDialog,
            backgroundColor: Colors.blue,
            onPressed: () => _updateDialog(context, _selectedUsers.toList()),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        TextField(
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(labelText: context.tr!.searchUsers),
          onSubmitted: (value) {
            _searchUser(value.trim());
          },
        )
      ],
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
        /* getUsersByFullName(userToSearch!).then((users) {
          log("getUsers: $users");
          setState(() {
            clearValues();
            userList.addAll(users!.items);

            if (users.items.isEmpty) {
              userMsg = context.tr!.userNotFound;
            }
          });
        }).catchError((onError) {
          log("getUsers catchError: $onError");
          setState(() {
            clearValues();
            userMsg = context.tr!.userNotFound;
          });
        });*/
      }
    }
    if (userList.isEmpty) {
      return Center(
        child: Text(
          userMsg,
          style: const TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: userList.length,
        itemBuilder: _getListItemTile,
      );
    }
  }

  Widget? _getListItemTile(BuildContext context, int index) {
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
                        '${context.tr!.userName}: ${userList[index].fullName}',
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
        // color: greyColor2,
        // padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  void _updateDialog(BuildContext context, List<int> users) async {
    log("_updateDialog with users= $users");
    context.pop(users);
  }
}
