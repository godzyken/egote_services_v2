import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserConverter implements JsonConverter<AuthUser, Map<String, dynamic>> {
  const UserConverter();

  @override
  Map<String, dynamic> toJson(AuthUser user) => user.toJson();

  @override
  AuthUser fromJson(Map<String, dynamic> json) => AuthUser(
      id: json['id'],
      appMetadata: json['appMetadata'],
      userMetadata: json['userMetadata'],
      aud: json['aud'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      role: json['role'],
      updatedAt: json['updatedAt']);

  AuthUser fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return AuthUser(
        id: doc.id,
        appMetadata: map['appMetadata'] ?? '',
        userMetadata: map['userMetadata'] ?? '',
        aud: map['aud'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
        createdAt: map['createdAt'].toDate(),
        role: map['role'] ?? '',
        updatedAt: map['updatedAt'].toDate());
  }
}
