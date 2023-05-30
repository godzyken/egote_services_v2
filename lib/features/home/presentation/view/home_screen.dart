import 'package:egote_services_v2/features/home/application/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title: Text(
          'Home $network',
          style: const TextStyle(color: Colors.black54),
        ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 50.00,
          backgroundColor: Colors.greenAccent[400],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: const Text('hello', style: TextStyle(color: Colors.amber),),
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
