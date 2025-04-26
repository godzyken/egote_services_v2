import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase;

part 'supabase_service.freezed.dart';
part 'supabase_service.g.dart';

class SupabaseService {
  static const MethodChannel _channel =
      MethodChannel('com.godzy.egote_services_v2/supabase');
  final supabase.SupabaseClient _supabaseClient;

  // Injection du SupabaseClient via le constructeur
  SupabaseService(this._supabaseClient);

  // Récupérer la liste des instruments
  Future<List<Instrument>> fetchInstruments() async {
    return _safeInvoke<List<Instrument>>(
      () async {
        final List<dynamic> instrumentsJson =
            await _channel.invokeMethod('fetchInstruments');
        return instrumentsJson
            .map((json) => Instrument.fromJson(json))
            .toList();
      },
      label: 'fetchInstruments',
    );
  }

  // Envoi du token FCM à Supabase
  Future<void> sendTokenToBackend(String token) async {
    if (token.isEmpty) {
      _log('Token is empty, cannot send to backend.',
          label: 'sendTokenToBackend');
      return;
    }

    await _safeInvoke<void>(
      () async {
        final response = await _supabaseClient.from('fcm_tokens').upsert({
          'token': token,
          'created_at': DateTime.now().toIso8601String(),
        });

        if (response.error != null) {
          _log(
              'Erreur lors de l\'envoi du token à Supabase: ${response.error!.message}',
              label: 'sendTokenToBackend');
        } else {
          _log('Token FCM envoyé avec succès à Supabase',
              label: 'sendTokenToBackend');
        }
      },
      label: 'sendTokenToBackend',
    );
  }

  // Synchroniser l'utilisateur avec Supabase
  Future<void> syncUserWithSupabase(String uid) async {
    await _safeInvoke<void>(
      () async {
        final existing = await _supabaseClient
            .from('auth_users')
            .select()
            .eq('uid', uid)
            .maybeSingle();

        if (existing == null) {
          await _supabaseClient.from('auth_users').insert({
            'uid': uid,
            'email': 'email',
            'role': 'user',
            'created_at': DateTime.now().toIso8601String(),
          });
          _log('Utilisateur synchronisé avec Supabase',
              label: 'syncUserWithSupabase');
        } else {
          _log('Utilisateur déjà synchronisé avec Supabase',
              label: 'syncUserWithSupabase');
        }
      },
      label: 'syncUserWithSupabase',
    );
  }
}

@freezed
sealed class Instrument with _$Instrument {
  const factory Instrument({required int id, required String name}) =
      _Instrument;

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
}

// Méthode pour gérer les appels sécurisés avec gestion des erreurs
Future<T> _safeInvoke<T>(Future<T> Function() action,
    {required String label}) async {
  try {
    return await action();
  } on PlatformException catch (e) {
    _log('Error invoking $label: ${e.message}', label: label);
    rethrow;
  } catch (e) {
    _log('Unexpected error in $label: $e', label: label);
    rethrow;
  }
}

// Logger centralisé pour éviter la répétition
void _log(String message, {required String label}) {
  developer.log(message, name: 'SupabaseService::$label');
}
