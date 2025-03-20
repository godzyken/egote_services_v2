import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../config/providers/firebase/firebase_providers.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({super.key, required this.preload, required this.pid});

  final bool preload;
  final String pid;

  @override
  ConsumerState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends ConsumerState<UserHomeScreen> {
  User? _user;
  late bool preload;

  @override
  void initState() {
    _getAuth();

    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = ref.read(supabaseClientProvider).auth.currentUser;
      if (_user?.isAnonymous == true) {
        preload = false;
      }
    });
    preload = await Supabase.instance.client.auth.onAuthStateChange
        .every((element) => element.session?.isExpired != true);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(authStreamProvider);
    if (user.asData?.value!.uid == widget.pid) {
      return _user == null
          ? const LoginScreen()
          : user.when(
              data: (data) => Scaffold(
                body: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                      imagePath: _user!.id == data!.uid
                          ? data.photoURL!
                          : LocalImages.venomJpg,
                      onClicked: () async {},
                    ),
                    const SizedBox(),
                    buildName(data.uid),
                    const SizedBox(),
                    // Consumer(builder: (context, ref, _) => ref.watch(_usersOnTable),)
                  ],
                ),
              ),
              error: (error, stackTrace) =>
                  ErrorScreen(error: user.error.toString()),
              loading: () => const CircularProgressIndicator(),
            );
    } else {
      return ErrorScreen(error: user.error.toString());
    }
  }

  Widget buildName(String name) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }
}
