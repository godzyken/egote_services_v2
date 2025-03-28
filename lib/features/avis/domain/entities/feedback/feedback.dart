import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class AvisUtilisateur with _$AvisUtilisateur {
  const factory AvisUtilisateur({
    @JsonKey(name: 'id') required int id,
    String? name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'message') required String message,
    @JsonKey(
        name: 'created_at',
        fromJson: _dateTimeFromString,
        toJson: _dateTimeToString)
    required DateTime createdAt,
    @Default(true) bool? isAnonymous,
  }) = _AvisUtilisateur;

  factory AvisUtilisateur.fromJson(Map<String, dynamic> json) =>
      _$AvisUtilisateurFromJson(json);
}

DateTime _dateTimeFromString(String str) => DateTime.parse(str);
String _dateTimeToString(DateTime date) => date.toIso8601String();
