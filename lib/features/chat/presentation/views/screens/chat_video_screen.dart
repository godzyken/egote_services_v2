import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/services/webrtc_signal_config_service.dart';
import 'join_screen.dart';

class ChatVideoScreen extends ConsumerStatefulWidget {
  const ChatVideoScreen({super.key, required this.uid, required this.pid});

  final String uid;
  final String pid;

  @override
  ConsumerState createState() => _ChatVideoScreenState();
}

class _ChatVideoScreenState extends ConsumerState<ChatVideoScreen> {
  _ChatVideoScreenState();

  final String websocketUrl = "WEB_SOCKET_SERVER_URL";

  // generate callerID of local user
  final String selfCallerID =
      Random().nextInt(999999).toString().padLeft(6, '0');

  @override
  Widget build(BuildContext context) {
    // init signalling service
    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );

    return JoinScreen(selfCallerId: selfCallerID);
  }
}
