import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class FullPhoto extends ConsumerWidget {
  const FullPhoto({
    Key? key,
    required this.url
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.fullPhoto),
        centerTitle: true,
      ),
      body: FullPhotoScreen(url: url),
    );
  }
}

class FullPhotoScreen extends ConsumerStatefulWidget {
  const FullPhotoScreen({
    Key? key, required this.url
  }) : super(key: key);

  final String url;

  @override
  ConsumerState createState() => _FullPhotoScreenState();
}

class _FullPhotoScreenState extends ConsumerState<FullPhotoScreen> {

  @override
  Widget build(BuildContext context) {
    return PhotoView(imageProvider: NetworkImage(widget.url));
  }

  @override
  void initState() {
    super.initState();
  }
}
