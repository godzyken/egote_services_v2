import 'package:talker/talker.dart';

import '../domain/entities/graph_edge.dart';
import '../domain/entities/graph_node.dart';
import '../domain/value_objects/edge_type.dart';
import '../domain/value_objects/node_type.dart';
import '../domain/value_objects/provenance.dart';
import 'supabase_graph_repository.dart';

/// Bridge non-intrusif : écoute Talker et projette les logs structurés
/// vers le Knowledge Graph sans modifier le comportement existant.
///
/// Usage typique (dans l’initialisation de l’app) :
/// ```dart
/// final sink = TalkerGraphSink(repository: graphRepo);
/// talker.addObserver(sink); // ou intégration via custom handler
/// ```
class TalkerGraphSink implements TalkerObserver {
  TalkerGraphSink({required this.repository, this.enabled = true});

  final SupabaseGraphRepository repository;
  final bool enabled;

  /// Dernier nœud créé (pour créer des arêtes parent → child)
  String? _lastNodeId;

  @override
  void onError(TalkerError err) {
    if (!enabled) return;
    _emit(
      type: NodeType.error,
      message: err.message ?? 'Unknown error',
      extra: {
        'exception': err.exception?.toString(),
        'stack': err.stackTrace?.toString(),
      },
      labels: ['error', 'talker'],
    );
  }

  @override
  void onException(TalkerException err) {
    if (!enabled) return;
    _emit(
      type: NodeType.error,
      message: err.message ?? 'Unknown error',
      extra: {
        'exception': err.exception.toString(),
        'stack': err.stackTrace?.toString(),
      },
      labels: ['exception', 'talker'],
    );
  }

  @override
  void onLog(TalkerData log) {
    if (!enabled) return;

    final level = log.logLevel;
    final message = log.message ?? '';
    final extra = <String, dynamic>{};

    // Extraction basique de métadonnées si le message est structuré
    // (ex: "devis.created id=xxx" ou payload JSON)
    if (log is TalkerLog) {
      // On peut enrichir ici selon les conventions de l’app
    }

    final nodeType = _inferNodeType(message, level);

    _emit(
      type: nodeType,
      message: message,
      extra: extra,
      labels: [level?.name ?? 'info', 'talker'],
    );
  }

  NodeType _inferNodeType(String message, LogLevel? level) {
    final lower = message.toLowerCase();
    if (level == LogLevel.error || level == LogLevel.critical) {
      return NodeType.error;
    }
    if (lower.contains('devis')) return NodeType.devis;
    if (lower.contains('chantier') || lower.contains('projet')) {
      return NodeType.chantier;
    }
    if (lower.contains('auth') ||
        lower.contains('login') ||
        lower.contains('mfa')) {
      return NodeType.user;
    }
    if (lower.contains('notification') ||
        lower.contains('fcm') ||
        lower.contains('push')) {
      return NodeType.notification;
    }
    if (lower.contains('provider') || lower.contains('riverpod')) {
      return NodeType.provider;
    }
    if (lower.contains('sync') || lower.contains('metric')) {
      return NodeType.metric;
    }
    return NodeType.service;
  }

  Future<void> _emit({
    required NodeType type,
    required String message,
    Map<String, dynamic>? extra,
    List<String>? labels,
  }) async {
    try {
      final node = GraphNode.fromTalker(
        type: type,
        message: message,
        extra: extra,
        labels: labels,
        provenance: const Provenance(source: 'talker'),
      );

      await repository.insertNode(node);

      // Créer une arête de lignée si on a un nœud précédent
      if (_lastNodeId != null) {
        final edge = GraphEdge.create(
          sourceId: _lastNodeId!,
          targetId: node.id,
          type: EdgeType.childOf,
          provenance: const Provenance(source: 'talker'),
        );
        await repository.insertEdge(edge);
      }

      _lastNodeId = node.id;
    } catch (_) {
      // Jamais faire échouer l’app à cause du graphe
      // (principe de non-intrusion)
    }
  }
}
