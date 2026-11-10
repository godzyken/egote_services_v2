import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserConverter implements JsonConverter<User, Map<String, dynamic>> {
  const UserConverter();

  @override
  Map<String, dynamic> toJson(User user) => user.toJson();

  @override
  User fromJson(Map<String, dynamic> json) {
    // Sécurisation web minifié
    final map = Map<String, dynamic>.from(json);
    final user = User.fromJson(map);
    if (user == null) {
      throw FormatException('UserConverter: User.fromJson returned null');
    }
    return user;
  }

  User fromFirestore(DocumentSnapshot doc) {
    final raw = doc.data();
    final map = raw is Map
        ? Map<String, dynamic>.from(raw)
        : <String, dynamic>{};
    final user = User.fromJson({...map, 'id': doc.id});
    if (user == null) {
      throw FormatException('UserConverter.fromFirestore: null user');
    }
    return user;
  }
}
