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
              : Text(context.tr!.noData),
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
                  child: Text(
                    context.tr!.userInfo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Image.network(_!.photoURL!),
                ),
                Text('${_.isAnonymous ? '${context.tr!.userAnonymous}\n\n' : ''}'
                    '${context.tr!.email}: ${_.email} (${context.tr!.verified}: ${_.emailVerified})\n\n'
                    '${context.tr!.phoneNumber}: ${_.phoneNumber}\n\n'
                    '${context.tr!.name}: ${_.displayName}\n\n\n'
                    'ID: ${_.uid}\n\n'
                    '${context.tr!.tenantId}: ${_.tenantId}\n\n'
                    '${context.tr!.refresh} ${context.tr!.token}: ${_.refreshToken}\n\n\n'
                    '${context.tr!.created}: ${_.metadata.creationTime.toString()}\n\n'
                    '${context.tr!.lastLogin}: ${_.metadata.lastSignInTime}\n\n'),
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
                                    "${provider.email == null ? "" : "${context.tr!.email}: ${provider.email}\n"}"
                                    "${provider.phoneNumber == null ? "" : "${context.tr!.phoneNumber}: ${provider.phoneNumber}\n"}"
                                    "${provider.displayName == null ? "" : "${context.tr!.name}: ${provider.displayName}\n"}"),
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
              : Text(context.tr!.noData),
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
                  child: Text(
                    context.tr!.userInfo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Image.network(_!.photoURL!),
                ),
                Text('${_.isAnonymous ? '${context.tr!.userAnonymous}\n\n' : ''}'
                    '${context.tr!.email}: ${_.email} (${context.tr!.verified}: ${_.emailVerified})\n\n'
                    '${context.tr!.phoneNumber}: ${_.phoneNumber}\n\n'
                    '${context.tr!.name}: ${_userEntityModel!.name}\n\n\n'
                    'ID: ${_userEntityModel!.id}\n\n'
                    '${context.tr!.tenantId}: ${_.tenantId}\n\n'
                    '${context.tr!.refresh} ${context.tr!.token}: ${_.refreshToken}\n\n\n'
                    '${context.tr!.created}: ${_userEntityModel!.createdAt}\n\n'
                    '${context.tr!.lastLogin}: ${_userEntityModel!.lastSignInAt}\n\n'),
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
                                    "${provider.email == null ? "" : "${context.tr!.email}: ${provider.email}\n"}"
                                    "${provider.phoneNumber == null ? "" : "${context.tr!.phoneNumber}: ${provider.phoneNumber}\n"}"
                                    "${provider.displayName == null ? "" : "${context.tr!.name}: ${provider.displayName}\n"}"),
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
