import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock_screen_state.freezed.dart';
part 'lock_screen_state.g.dart';

@freezed
abstract class LockScreenState with _$LockScreenState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory LockScreenState({
    required bool isLocked,
    required DateTime lastActive,
  }) = _LockScreenState;

  factory LockScreenState.fromJson(Map<String, dynamic> json) =>
      _$LockScreenStateFromJson(json);
}
