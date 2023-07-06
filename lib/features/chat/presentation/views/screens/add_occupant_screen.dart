import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/presentation/extensions/extensions.dart';

class AddOccupantScreen extends ConsumerStatefulWidget {
  const AddOccupantScreen({
    Key? key,
    required this.cubeUser
  }) : super(key: key);

  final CubeUser cubeUser;

  @override
  ConsumerState createState() => _AddOccupantScreenState();
}

class _AddOccupantScreenState extends ConsumerState<AddOccupantScreen> {
  late final CubeUser currentUser;


  @override
  void initState() {
    super.initState();
    currentUser = CubeUser();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Contacts'),
        ),
        body: BodyLayout(currentUser),
      ),
      onWillPop: () => _onBackPressed(context),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    context.pop(context);
    return Future.value(false);
  }
}

class BodyLayout extends ConsumerStatefulWidget {
  final CubeUser currentUser;

  const BodyLayout(this.currentUser, {super.key});

  @override
  ConsumerState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends ConsumerState<BodyLayout> {
  late final CubeUser currentUser;
  List<CubeUser> userList = [];
  Set<int> _selectedUsers = {};
  var _isUsersContinues = false;
  String? userToSearch;
  String userMsg = " ";


  @override
  void initState() {
    super.initState();
    _isUsersContinues = false;
    currentUser = CubeUser();
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
            heroTag: "Update dialog",
              backgroundColor: Colors.blue,
              onPressed: () => _updateDialog(context, _selectedUsers.toList()),
              child: const Icon(Icons.check, color: Colors.white,
              ),
          )
      ),
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: [
          Container(
            child: TextField(
              autofocus: true,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(labelText: 'Search Users'),
              onSubmitted: (value) {
                _searchUser(value.trim());
              },
            ),
          )
        ],
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

    if ( _isUsersContinues) {
      if (userToSearch != null && userToSearch!.isNotEmpty) {
        getUsersByFullName(userToSearch!).then((users) {
          log("getUsers: $users");
          setState(() {
            clearValues();
            userList.addAll(users!.items);

            if (users.items.isEmpty) {
              userMsg = "Couldn't find user";
            }
          });
        }).catchError((onError){
          log("getUsers catchError: $onError");
          setState(() {
            clearValues();
            userMsg = "Couldn't find user";
          });
        });
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
                        'Name: ${userList[index].fullName}',
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

