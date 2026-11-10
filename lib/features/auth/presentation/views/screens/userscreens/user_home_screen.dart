import 'dart:async';

import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../config/providers/firebase/firebase_providers.dart';
import '../../../../../../config/providers/supabase/supabase_providers.dart';
import '../../widgets/profile_widget.dart';
import '../connection/login_screen.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({super.key, required this.pid});

  final String pid;

  @override
  ConsumerState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends ConsumerState<UserHomeScreen> {
  StreamSubscription? _authSub;
  User? _user; // supabase User

  @override
  void initState() {
    super.initState();
    final client = ref.read(supabaseClientProvider);
    _user = client.auth.currentUser;
    _authSub = client.auth.onAuthStateChange.listen((event) {
      if (!mounted) return;
      setState(() => _user = event.session?.user);
    });
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(authStreamProvider);

    return userAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => ErrorScreen(error: e.toString()),
      data: (firebaseUser) {
        // Pas connecté Firebase → écran login
        if (firebaseUser == null) {
          return const LoginScreen();
        }

        // Mauvais pid
        if (firebaseUser.uid != widget.pid) {
          return ErrorScreen(error: 'Utilisateur non autorisé');
        }

        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath:
                    (firebaseUser.photoURL != null &&
                        firebaseUser.photoURL!.isNotEmpty)
                    ? firebaseUser.photoURL!
                    : LocalImages.venomJpg,
                onClicked: () async {},
              ),
              const SizedBox(),
              buildName(firebaseUser.displayName ?? firebaseUser.uid),
              const SizedBox(),
              // Consumer(builder: (context, ref, _) => ref.watch(_usersOnTable),)
            ],
          ),
        );
      },
    );
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
