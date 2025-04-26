import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/states/video_call_state/video_call_state.dart';
import '../controllers/configuration_video_controller.dart';

final configVideoControllerProvider =
    StateNotifierProvider<ConfigVideoController, VideoCallSate>(
        (ref) => ConfigVideoController());
