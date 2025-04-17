import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/user_controller_state.dart';
import 'avatar_uploader.dart';

class AvatarCircleConsumer extends ConsumerWidget {
  final double radius;
  final bool editable;

  const AvatarCircleConsumer({
    super.key,
    this.radius = 50,
    this.editable = true,
  });

  void _editAvatar(BuildContext context, WidgetRef ref, String userId) async {
    final success = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AvatarUploaderDialog(userId: userId),
      ),
    );

    if (success == true) {
      await ref.read(userControllerStateProvider.notifier).reloadUser(userId);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userControllerStateProvider);

    return userState.when(
      data: (user) {
        final avatarUrl = user.avatarUrl;

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.grey[200],
              backgroundImage:
                  avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
              child: avatarUrl.isEmpty
                  ? Icon(Icons.person, size: radius * 0.8, color: Colors.grey)
                  : null,
            ),
            if (editable)
              Positioned(
                bottom: 0,
                right: 4,
                child: GestureDetector(
                  onTap: () => _editAvatar(context, ref, user.id.toString()),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child:
                        const Icon(Icons.edit, size: 18, color: Colors.white),
                  ),
                ),
              ),
          ],
        );
      },
      loading: () => const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: CircularProgressIndicator(),
      ),
      error: (err, _) => CircleAvatar(
        radius: 50,
        backgroundColor: Colors.red[100],
        child: Icon(Icons.error, color: Colors.red[700]),
      ),
    );
  }
}
