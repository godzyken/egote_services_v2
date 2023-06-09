import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({Key? key, required this.imagePath, required this.onClicked,}) : super(key: key);

  final String imagePath;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme.onPrimary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
              bottom: 0,
              right: 4,
              child: buildEditIcon(color))
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = Image.asset(imagePath);
    return ClipOval(
      child: Material(
        child: Ink.image(
            image: image.image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      all: 3,
      color: Colors.white70,
      child: buildCircle(
        all: 8,
        color: color,
        child: const Icon(
        Icons.edit,
        color: Colors.black87,
        size: 20,
      ),
    )
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

}
