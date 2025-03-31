import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../providers/network_notifier_provider.dart';

class NetworkScreen extends ConsumerWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Récupérer l'état actuel de la connectivité via le provider
    final networkStatus = ref.watch(networkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres Réseau'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'État du réseau',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNetworkStatus(networkStatus),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openNetworkSettings(context);
              },
              child: const Text('Ouvrir les paramètres réseau'),
            ),
          ],
        ),
      ),
    );
  }

  // Affiche le statut de la connectivité
  Widget _buildNetworkStatus(NetworkStatus status) {
    return Text(
      status == NetworkStatus.connected
          ? 'Connecté à Internet'
          : 'Non connecté à Internet',
      style: TextStyle(
        fontSize: 18,
        color: status == NetworkStatus.connected ? Colors.green : Colors.red,
      ),
    );
  }

  // Ouvrir les paramètres réseau (Android uniquement)
  void _openNetworkSettings(BuildContext context) async {
    bool opened = await openNetworkSettings();
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Impossible d\'ouvrir les paramètres réseau.')),
      );
    }
  }

  // Ouvrir les paramètres de l'application
  Future<bool> openNetworkSettings() async {
    try {
      await openAppSettings();
      return true;
    } catch (e) {
      developer.log("Erreur lors de l'ouverture des paramètres réseau: $e");
      return false;
    }
  }
}
