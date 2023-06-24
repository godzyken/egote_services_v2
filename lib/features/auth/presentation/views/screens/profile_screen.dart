import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/views/widgets/widgets_extensions.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/firebase/firebase_providers.dart';
import 'auth_screens.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key, required this.uid, required this.pid})
      : super(key: key);

  final String uid;
  final String pid;

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  UserEntityModel? _userEntityModel;
  bool _isLoading = true;


  @override
  void initState() {
    _loadProfile();

    super.initState();
  }

  Future<void> _loadProfile() async {
    try {
      final userId = ref.watch(supabaseClientProvider).auth.currentUser!.id;

      if(widget.pid == userId) {
        final data = (await ref.watch(supabaseClientProvider)
            .from('auth_users_table')
            .select()
            .match({'id': userId})
            .maybeSingle()) as Map?;

        if (data != null) {
          setState(() {
            _loadAuth(data['id']);
            _isLoading = true;
          });
        }
      }

    } catch (e) {
      context.showAlert(e.toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadAuth(UserModel data) async {
    try {
      final userId = ref.watch(authStreamProvider).value!.uid;

      if(widget.uid == userId) {
        final doc = (await ref.watch(firebaseFirestoreProvider)
            .collection('users')
            .doc(data.authUser.id)
            .get());

        if (doc.exists && doc.id == widget.uid) {
          setState(() {
            _isLoading = true;
            _userEntityModel = UserEntityModel.fromFirestore(doc);
          });
        }
      }

    } catch (e) {
      context.showAlert(e.toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangesProvider).when(
        data:(_) => _isLoading
            ? userModelComplete(_, context)
            : authUserComplete(_, context),
        error: (error, stackTrace) => ErrorScreen(error: stackTrace.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ));
  }

  Scaffold authUserComplete(User? _, BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _userEntityModel!.isComplete
              ? ProfileWidget(imagePath: _!.photoURL!, onClicked: () {  },)
              : const Text('no data!'),
        ),
        drawer: const CustomMenuWidget(),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.center,
                  child: const Text(
                    'User info',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Image.network(_!.photoURL!),
                ),
                Text('${_.isAnonymous ? 'User is anonymous\n\n' : ''}'
                    'Email: ${_.email} (verified: ${_.emailVerified})\n\n'
                    'Phone number: ${_.phoneNumber}\n\n'
                    'Name: ${_.displayName}\n\n\n'
                    'ID: ${_.uid}\n\n'
                    'Tenant ID: ${_.tenantId}\n\n'
                    'Refresh token: ${_.refreshToken}\n\n\n'
                    'Created: ${_.metadata.creationTime.toString()}\n\n'
                    'Last login: ${_.metadata.lastSignInTime}\n\n'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _.providerData.first.providerId,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    for (var provider in _.providerData)
                      Dismissible(
                        key: Key(provider.uid!),
                        onDismissed: (action) =>
                            _.unlink(provider.providerId),
                        child: Card(
                          color: Colors.grey[300],
                          child: ListTile(
                            leading: provider.photoURL == null
                                ? IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _.unlink(provider.providerId))
                                : Image.network(provider.photoURL!),
                            title: Text(provider.providerId),
                            subtitle: Text(
                                "${provider.uid == null ? "" : "ID: ${provider.uid}\n"}"
                                    "${provider.email == null ? "" : "Email: ${provider.email}\n"}"
                                    "${provider.phoneNumber == null ? "" : "Phone number: ${provider.phoneNumber}\n"}"
                                    "${provider.displayName == null ? "" : "Name: ${provider.displayName}\n"}"),
                          ),
                        ),
                      ),
                  ],
                ),
                Visibility(
                    visible: !_.isAnonymous,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () => _.reload(),
                            icon: const Icon(Icons.refresh),
                          ),
                          IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) =>
                              const UpdateUserDialogScreen(),
                            ),
                            icon: const Icon(Icons.text_snippet),
                          ),
                          IconButton(
                            onPressed: () => _.delete(),
                            icon: const Icon(Icons.delete_forever),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
  }

  Scaffold userModelComplete(User? _, BuildContext context) {
    return Scaffold(
            appBar: AppBar(
          title: _userEntityModel!.isComplete
              ? ProfileWidget(imagePath: _!.photoURL!, onClicked: () {  },)
              : const Text('no data!'),
        ),
            drawer: const CustomMenuWidget(),
            body: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.center,
                  child: const Text(
                    'User info',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Image.network(_!.photoURL!),
                ),
                Text('${_.isAnonymous ? 'User is anonymous\n\n' : ''}'
                    'Email: ${_.email} (verified: ${_.emailVerified})\n\n'
                    'Phone number: ${_.phoneNumber}\n\n'
                    'Name: ${_userEntityModel!.name}\n\n\n'
                    'ID: ${_userEntityModel!.id}\n\n'
                    'Tenant ID: ${_.tenantId}\n\n'
                    'Refresh token: ${_.refreshToken}\n\n\n'
                    'Created: ${_userEntityModel!.createdAt}\n\n'
                    'Last login: ${_userEntityModel!.lastSignInAt}\n\n'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _.providerData.first.providerId,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    for (var provider in _.providerData)
                      Dismissible(
                        key: Key(provider.uid!),
                        onDismissed: (action) =>
                            _.unlink(provider.providerId),
                        child: Card(
                          color: Colors.grey[300],
                          child: ListTile(
                            leading: provider.photoURL == null
                                ? IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _.unlink(provider.providerId))
                                : Image.network(provider.photoURL!),
                            title: Text(provider.providerId),
                            subtitle: Text(
                                "${provider.uid == null ? "" : "ID: ${provider.uid}\n"}"
                                    "${provider.email == null ? "" : "Email: ${provider.email}\n"}"
                                    "${provider.phoneNumber == null ? "" : "Phone number: ${provider.phoneNumber}\n"}"
                                    "${provider.displayName == null ? "" : "Name: ${provider.displayName}\n"}"),
                          ),
                        ),
                      ),
                  ],
                ),
                Visibility(
                    visible: !_.isAnonymous,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () => _.reload(),
                            icon: const Icon(Icons.refresh),
                          ),
                          IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) =>
                              const UpdateUserDialogScreen(),
                            ),
                            icon: const Icon(Icons.text_snippet),
                          ),
                          IconButton(
                            onPressed: () => _.delete(),
                            icon: const Icon(Icons.delete_forever),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),);
  }


}
