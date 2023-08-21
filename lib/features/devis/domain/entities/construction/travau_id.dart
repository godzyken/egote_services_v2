import 'package:freezed_annotation/freezed_annotation.dart';

part 'travau_id.freezed.dart';
part 'travau_id.g.dart';

@freezed
class TravauId with _$TravauId {
  const factory TravauId({
    required int id,
  }) = _TravauId;
  
  

  factory TravauId.fromJson(Map<String, dynamic> json) =>
      _$TravauIdFromJson(json);
}