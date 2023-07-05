import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.freezed.dart';

@freezed
class MessageState with _$MessageState {

  const factory MessageState.read() = Read;

  const factory MessageState.delivered() = Delivered;

  const factory MessageState.sent() = Sent;

  const factory MessageState.error(Failure failure) = Error;
}