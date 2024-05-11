import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/views/widgets/widgets_extensions.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa_user_exception;

import '../../../../../config/providers/firebase/firebase_providers.dart';
import 'auth_screens.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key, required this.uid, required this.pid});

  final String uid;
  final String pid;

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  UserEntityModel? _userEntityModel;
  bool _isLoading = true;

  final _usernameCtrl = TextEditingController();

  @override
  void initState() {
    _loadProfile();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameCtrl.dispose();
  }

  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userId = ref.watch(supabaseClientProvider).auth.currentUser!.id;

      if (widget.pid == userId) {
        final data = (await ref
            .watch(supabaseClientProvider)
            .from('auth_users_table')
            .select('*')
            .eq('id', userId)
            .single());

        setState(() {
          _loadAuth(data['id']);
          _isLoading = true;
        });
      }
    } on supa_user_exception.PostgrestException catch (error) {
      if (mounted) {
        context.showAlert(error.message);
      }
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /*Future<void> _editProfile() async {
    setState(() {
      _isLoading = true;
    });

    final updates = _userEntityModel!.complete().copyWith(
        id: _userEntityModel!.id,
        name: _usernameCtrl.text.trim(),
        createdAt: _userEntityModel!.createdAt,
        updatedAt: DateTime.now(),
        phoneConfirmedAt: _userEntityModel!.phoneConfirmedAt,
        emailConfirmedAt: _userEntityModel!.emailConfirmedAt,
        lastSignInAt: _userEntityModel!.lastSignInAt,
        role: _userEntityModel!.role,
        isComplete: true);
    
    try {
      await ref
          .read(supabaseClientProvider)
          .from('auth_users_table')
          .upsert(updates);
      if (mounted) {
        context.showAlert('SuccessFully updated profile!');
      }
    } on supa_user_exception.PostgrestException catch (error) {
      context.showAlert(error.message);
    } catch (error) {
      context.showAlert(error.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }

  }*/

  Future<void> _loadAuth(UserModel data) async {
    try {
      final userId = ref.watch(authStreamProvider).value!.uid;

      if (widget.uid == userId) {
        final doc = (await ref
            .watch(firebaseFirestoreProvider)
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
      if (mounted) {
        context.showAlert(e.toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangesProvider).when(
        data: (_) => _isLoading
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
            ? ProfileWidget(
                imagePath: _!.photoURL!,
                onClicked: () {
                  // Todo: _!.updatePhotoUrl()
                },
              )
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
                      onDismissed: (action) => _.unlink(provider.providerId),
                      child: Card(
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: provider.photoURL == null
                              ? IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () =>
                                      _.unlink(provider.providerId))
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
                          onPressed: () => showAdaptiveDialog(
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
            ? ProfileWidget(
                imagePath: _!.photoURL!,
                onClicked: () {
                  // Todo: _!.updatePhotoUrl()
                },
              )
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
                      onDismissed: (action) => _.unlink(provider.providerId),
                      child: Card(
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: provider.photoURL == null
                              ? IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () =>
                                      _.unlink(provider.providerId))
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
                          onPressed: () => showAdaptiveDialog(
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
}
