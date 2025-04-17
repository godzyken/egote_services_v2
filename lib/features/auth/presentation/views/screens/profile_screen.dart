import 'dart:io';

import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/application/controller/user_controller.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa_user_exception;

import '../../../../../config/providers/firebase/firebase_providers.dart';
import '../../controller/user_controller_state.dart';
import '../widgets/avatar_uploader.dart';
import 'auth_screens.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key, required this.uid, required this.pid});

  final String uid;
  final String pid;

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  UserEntityModel? _userEntityModel;

  File? _selectedAvatar;
  bool _isLoading = true;

  bool isEditing = false;

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
    await SentryService.traceTask(
        name: 'load_user_profile',
        task: (ISentrySpan span) async {
          SentryService.addBreadcrumb(
              message: 'Chargement du profil utilisateur', category: 'api');

          span.setTag('endpoint', '/users/me');
          span.setData('user_id', '1234');

          try {
            throw Exception('Erreur lors du chargement du profil');
          } catch (e, st) {
            await Sentry.captureException(e, stackTrace: st);
            rethrow;
          }
        });

    setState(() {
      _isLoading = true;
    });

    try {
      final userId = ref.watch(supabaseClientProvider).auth.currentUser!.id;

      final user =
          await ref.read(userControllerProvider).loadUserProfile(userId);

      setState(() {
        _userEntityModel = user;
        _usernameCtrl.text = user.name;
      });
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

  Future<void> _editProfile() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userController = ref.read(userControllerStateProvider.notifier);

      await userController.updateUserProfilePartial(
        userId: widget.uid,
        name: _usernameCtrl.text.trim(),
        email: _userEntityModel!.email,
        avatarUrl: _userEntityModel!.avatarUrl,
        phone: _userEntityModel!.phone,
        externalLink: _userEntityModel!.externalLink,
      );

      setState(() {
        _userEntityModel =
            _userEntityModel?.copyWith(name: _usernameCtrl.text.trim());
      });

      if (mounted) {
        context.showAlert('SuccessFully updated profile!');
      }
    } on supa_user_exception.PostgrestException catch (error) {
      if (mounted) {
        context.showAlert(error.message);
      }
    } catch (error) {
      if (mounted) {
        context.showAlert(error.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext _) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (_userEntityModel == null) {
      return const Scaffold(
          body: Center(
        child: ErrorScreen(error: 'No user found'),
      ));
    }
    return _buildAuthState();
  }

  Widget _buildAuthState() {
    return ref.watch(authStreamProvider).when(
        data: (user) => _isLoading
            ? userModelComplete(user, context)
            : authUserComplete(user, context),
        error: (error, stackTrace) => ErrorScreen(error: stackTrace.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: false);
  }

  void _showAvatarBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(16),
                child: AvatarUploaderDialog(userId: widget.uid),
              ),
            ),
        transitionAnimationController: AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: this,
        ));

    if (context.mounted && result == true) {
      context.showAlert("🖼 Avatar mis à jour !");
      setState(() {}); // Rebuild UI if needed
    }
  }

  Scaffold buildUserScaffold({
    required User user,
    required BuildContext context,
    required bool useEntityModel,
    required VoidCallback? onEditProfile,
  }) {
    final name = useEntityModel ? _userEntityModel!.name : user.displayName;
    final id =
        useEntityModel ? _userEntityModel!.id.value.toString() : user.uid;
    final created = useEntityModel
        ? _userEntityModel!.createdAt
        : user.metadata.creationTime;
    final lastLogin = useEntityModel
        ? _userEntityModel!.lastSignInAt
        : user.metadata.lastSignInTime;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _showAvatarBottomSheet(context),
            icon: const Icon(Icons.edit),
          ),
        ],
        title: _userEntityModel!.isComplete
            ? ProfileWidget(
                imagePath: user.photoURL!,
                onClicked: onEditProfile,
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
              _buildHeader(context),
              _buildAvatar(user),
              _buildUserInfo(context, user, name, id, created, lastLogin),
              _buildProviderList(context, user),
              if (!user.isAnonymous) _buildBottomActions(context, user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.center,
      child: Text(
        context.tr!.userInfo,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAvatar(User user) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 8),
      child: Image.network(user.photoURL!),
    );
  }

  Widget _buildUserInfo(BuildContext context, User user, String? name,
      String id, dynamic created, dynamic lastLogin) {
    return Text(
      '${user.isAnonymous ? '${context.tr!.userAnonymous}\n\n' : ''}'
      '${context.tr!.email}: ${user.email} (${context.tr!.verified}: ${user.emailVerified})\n\n'
      '${context.tr!.phoneNumber}: ${user.phoneNumber}\n\n'
      '${context.tr!.name}: $name\n\n\n'
      'ID: $id\n\n'
      '${context.tr!.tenantId}: ${user.tenantId}\n\n'
      '${context.tr!.refresh} ${context.tr!.token}: ${user.refreshToken}\n\n\n'
      '${context.tr!.created}: $created\n\n'
      '${context.tr!.lastLogin}: $lastLogin\n\n',
    );
  }

  Widget _buildProviderList(BuildContext context, User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          user.providerData.first.providerId,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        for (var provider in user.providerData)
          Dismissible(
            key: Key(provider.uid ?? provider.providerId),
            onDismissed: (_) => user.unlink(provider.providerId),
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                leading: provider.photoURL == null
                    ? IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => user.unlink(provider.providerId),
                      )
                    : _selectedAvatar != null
                        ? Image.file(_selectedAvatar!, height: 120)
                        : Image.network(provider.photoURL!),
                title: Text(provider.providerId),
                subtitle: Text(
                  "${provider.uid == null ? "" : "ID: ${provider.uid}\n"}"
                  "${provider.email == null ? "" : "${context.tr!.email}: ${provider.email}\n"}"
                  "${provider.phoneNumber == null ? "" : "${context.tr!.phoneNumber}: ${provider.phoneNumber}\n"}"
                  "${provider.displayName == null ? "" : "${context.tr!.name}: ${provider.displayName}\n"}",
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context, User user) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => user.reload(),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => showAdaptiveDialog(
              context: context,
              builder: (context) => UpdateUserDialogScreen(userId: widget.uid),
            ),
            icon: const Icon(Icons.text_snippet),
          ),
          IconButton(
            onPressed: () => user.delete(),
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }

  // For Firebase User Model
  Widget authUserComplete(User? user, BuildContext context) {
    return buildUserScaffold(
      user: user!,
      context: context,
      useEntityModel: false,
      onEditProfile: _isLoading ? null : _editProfile,
    );
  }

// For Entity Model Mapping
  Widget userModelComplete(User? user, BuildContext context) {
    return buildUserScaffold(
      user: user!,
      context: context,
      useEntityModel: true,
      onEditProfile: () {}, // No-op or custom logic
    );
  }
}
