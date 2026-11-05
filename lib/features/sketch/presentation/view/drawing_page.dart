import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawingPage extends ConsumerStatefulWidget {
  const DrawingPage({super.key});

  @override
  ConsumerState<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends ConsumerState<DrawingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Drawing Page'));
  }
}
