import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'chat_screens.dart';

class CreateChatScreen extends ConsumerWidget {
  const CreateChatScreen({
    Key? key,
    required this.cubeUser
  }) : super(key: key);

  final CubeUser cubeUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop,
            icon: const Icon(Icons.close, color: Colors.white,)
        ),
        automaticallyImplyLeading: false,
        title: Text(context.tr!.searchUsers),
      ),
      body: BodyNewChatLayout(currentUser: cubeUser, key: key,),
    );
  }
}
