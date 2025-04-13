import 'dart:developer' as developer;
import 'dart:developer' as devtools;

import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_service.freezed.dart';
part 'supabase_service.g.dart';

class SupabaseService {
  static const MethodChannel _channel =
      MethodChannel('com.godzy.egote_services_v2/supabase');

  Future<List<Instrument>> fetchInstruments() async {
    try {
      final List<dynamic> instrumentsJson =
          await _channel.invokeMethod('fetchInstruments');

      final List<Instrument> instruments =
          instrumentsJson.map((json) => Instrument.fromJson(json)).toList();
      return instruments;
    } on PlatformException catch (e) {
      devtools.log('Error fetching instruments: ${e.message}');
      return [];
    }
  }

  Future<void> sendTokenToBackend(Ref ref, String token) async {
    final supabaseClient = ref.watch(supabaseProvider);

    // Enregistrez le token dans Supabase dans la table 'fcm_tokens'
    final response = await supabaseClient.client.from('fcm_tokens').upsert({
      'token': token,
      'created_at': DateTime.now().toIso8601String(),
    });

    if (response.error != null) {
      developer.log(
          'Erreur lors de l\'envoi du token à Supabase: ${response.error!.message}');
    } else {
      developer.log('Token FCM envoyé avec succès à Supabase');
      final List<dynamic> data =
          response.data(AsyncValue.data((json) => Instrument.fromJson(json)));
      developer.log('Data from Supabase: $data');
    }
  }
}

@freezed
sealed class Instrument with _$Instrument {
  const factory Instrument({required int id, required String name}) =
      _Instrument;

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
}
