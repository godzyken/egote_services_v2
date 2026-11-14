import 'package:uuid/uuid.dart';

const emapArtisanId = 'emap-82-artisan-uuid';
const emapProfileEmail = 'artisan@emap-82.fr';

enum DevisStatus { draft, sent, accepted, rejected }

enum ChantierStatus { planned, inProgress, completed }

class EmapUser {
  final String id;
  final String email;
  final List<String> offers;

  const EmapUser({required this.id, required this.email, required this.offers});
}

class Devis {
  final String id;
  final String reference;
  final String clientName;
  final String title;
  final DevisStatus status;
  final double totalHt;
  final double totalTtc;
  final String source;
  final DateTime createdAt;

  const Devis({
    required this.id,
    required this.reference,
    required this.clientName,
    required this.title,
    required this.status,
    required this.totalHt,
    required this.totalTtc,
    required this.source,
    required this.createdAt,
  });

  factory Devis.fromJson(Map<String, dynamic> json) {
    return Devis(
      id: json['id'] as String,
      reference: json['reference'] as String,
      clientName: json['clientName'] as String,
      title: json['title'] as String,
      status: _parseStatus(json['status']),
      totalHt: (json['totalHt'] as num).toDouble(),
      totalTtc: (json['totalTtc'] as num).toDouble(),
      source: json['source'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'reference': reference,
    'clientName': clientName,
    'title': title,
    'status': status.name,
    'totalHt': totalHt,
    'totalTtc': totalTtc,
    'source': source,
    'createdAt': createdAt.toIso8601String(),
  };

  Devis copyWith({DevisStatus? status}) {
    return Devis(
      id: id,
      reference: reference,
      clientName: clientName,
      title: title,
      status: status ?? this.status,
      totalHt: totalHt,
      totalTtc: totalTtc,
      source: source,
      createdAt: createdAt,
    );
  }

  static DevisStatus _parseStatus(dynamic val) {
    if (val is DevisStatus) return val;
    switch (val.toString()) {
      case 'sent':
        return DevisStatus.sent;
      case 'accepted':
        return DevisStatus.accepted;
      case 'rejected':
        return DevisStatus.rejected;
      default:
        return DevisStatus.draft;
    }
  }
}

class Chantier {
  final String id;
  final String devisId;
  final String title;
  final ChantierStatus status;

  const Chantier({
    required this.id,
    required this.devisId,
    required this.title,
    required this.status,
  });
}

/// Devis réalistes inspirés d’emap-82.fr
final List<Map<String, dynamic>> emapSeedDevis = [
  {
    'id': const Uuid().v4(),
    'reference': 'DEV-EMAP-2026-001',
    'clientName': 'M. Dupont – Montauban',
    'title': 'Pose pompe à chaleur air-eau',
    'status': 'sent',
    'totalHt': 8450.0,
    'totalTtc': 10140.0,
    'source': 'emap-82.fr',
    'createdAt': DateTime.now()
        .subtract(const Duration(days: 3))
        .toIso8601String(),
  },
  {
    'id': const Uuid().v4(),
    'reference': 'DEV-EMAP-2026-002',
    'clientName': 'Mme Martin – Grisolles',
    'title': 'Rénovation salle de bain complète',
    'status': 'draft',
    'totalHt': 6200.0,
    'totalTtc': 7440.0,
    'source': 'emap-82.fr',
    'createdAt': DateTime.now()
        .subtract(const Duration(days: 1))
        .toIso8601String(),
  },
  {
    'id': const Uuid().v4(),
    'reference': 'DEV-EMAP-2026-003',
    'clientName': 'SARL Techno – Castelsarrasin',
    'title': 'Climatisation réversible multisplit',
    'status': 'accepted',
    'totalHt': 4800.0,
    'totalTtc': 5760.0,
    'source': 'emap-82.fr',
    'createdAt': DateTime.now()
        .subtract(const Duration(hours: 12))
        .toIso8601String(),
  },
];

/// Offres qui déterminent les droits (exemple)
const emapActiveOffers = [
  'hub_basic',
  'devis_sync',
  'bat_track_lite',
  'compta_starter',
];
