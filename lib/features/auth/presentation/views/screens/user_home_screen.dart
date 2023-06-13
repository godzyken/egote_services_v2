import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/profile_widget.dart';

class UserHomeScreen extends ConsumerWidget {
  final String pid;

  const UserHomeScreen({Key? key, required this.pid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authStreamProvider);
    if (user.asData?.value!.uid == pid) {
      return user.when(data: (data) => Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: LocalImages.venomJpg,
              onClicked: () async {},
            ),
            const SizedBox(),
            buildName(data!.uid),
            const SizedBox(),
            // Consumer(builder: (context, ref, _) => ref.watch(_usersOnTable),)
          ],
        ),
      ),
        error: (error, stackTrace) => ErrorScreen(error: user.error.toString()),
        loading: () => const CircularProgressIndicator(),);
    } else {
      return ErrorScreen(error: user.error.toString());
    }
  }

  Widget buildName(String name) {
    return Column(
    children: [
      Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
        ),
      ),
    ],
  );
  }


}


