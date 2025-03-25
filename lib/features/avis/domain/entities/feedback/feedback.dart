import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class AvisUtilisateur with _$AvisUtilisateur {
  const factory AvisUtilisateur({
    required int id,
    String? name,
    String? photoUrl,
    required String message,
    required DateTime createdAt,
    @Default(true) bool? isAnonymous,
  }) = _AvisUtilisateur;

  factory AvisUtilisateur.fromJson(Map<String, dynamic> json) =>
      _$AvisUtilisateurFromJson(json);
}
