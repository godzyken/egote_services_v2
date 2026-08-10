import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserConverter implements JsonConverter<User, Map<String, dynamic>> {
  const UserConverter();

  @override
  Map<String, dynamic> toJson(User user) => user.toJson();

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json)!;

  User fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return User.fromJson({
      ...map,
      'id': doc.id,
    })!;
  }
}
