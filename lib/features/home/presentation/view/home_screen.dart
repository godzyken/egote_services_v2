import 'package:egote_services_v2/features/home/application/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var network = ref.watch(networkAwareProvider);
      if (network == NetWorkStatus.off) {
        return const Center(
          child: Text("No network"),
        );
      }
      return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Home',
          style: TextStyle(color: Colors.black54),
        )),
        body: Center(
          child: Text(
            "Normal stuff ${network}",
            style: TextStyle(color: Colors.brown),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Text(
              "Go stuff",
              style: TextStyle(color: Colors.blue),
            )),
      );
    });
  }
}
