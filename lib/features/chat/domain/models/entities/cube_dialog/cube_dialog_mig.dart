import 'package:freezed_annotation/freezed_annotation.dart';

import '../message_state/message_state.dart';

part 'cube_dialog_mig.freezed.dart';
part 'cube_dialog_mig.g.dart';

@freezed
class CubeDialogMig with _$CubeDialogMig {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CubeDialogMig(int? type,
      {String? dialogId,
      String? name,
      String? description,
      List<int>? occupantsIds,
      String? photo,
      String? lastMessage,
      String? lastMessageId,
      String? roomJid,
      int? lastMessageUserId,
      int? lastMessageDateSent,
      int? unreadMessageCount,
      MessageState? lastMessageState,
      List<String>? pinnedMessagesIds,
      List<int>? adminsIds,
      Map<String, String>? extensions,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isEncrypted,
      bool? isMuted}) = _CubeDialogMig;

  const CubeDialogMig._();

  factory CubeDialogMig.fromJson(Map<String, dynamic> json) =>
      _$CubeDialogMigFromJson(json);
}

@freezed
class CubeDialogTypeMig with _$CubeDialogTypeMig {
  const factory CubeDialogTypeMig({int? id}) = _CubeDialogTypeMig;

  const CubeDialogTypeMig._();

  @FreezedUnionValue('Broadcast')
  const factory CubeDialogTypeMig.BROADCAST(int? id) =
      _CubeDialogTypeMigBroadCast;

  @FreezedUnionValue('Group')
  const factory CubeDialogTypeMig.GROUP(int? id) = _CubeDialogTypeMigGroup;

  @FreezedUnionValue('Private')
  const factory CubeDialogTypeMig.PRIVATE(int? id) = _CubeDialogTypeMigPrivate;

  @FreezedUnionValue('Public')
  const factory CubeDialogTypeMig.PUBLIC(int? id) = _CubeDialogTypeMigPublic;
}
