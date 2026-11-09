import 'phase.dart';

class Chantier {
  final String id;
  final String name;
  final DateTime plannedEnd;
  final List<Phase> phases;
  final String? coverImageUrl;
  final String? linkedDevisId;

  const Chantier({
    required this.id,
    required this.name,
    required this.plannedEnd,
    this.phases = const [],
    this.coverImageUrl,
    this.linkedDevisId,
  });

  double get overallProgress {
    if (phases.isEmpty) return 0;
    final total = phases.fold<double>(0, (sum, p) => sum + p.progressPercent);
    return total / phases.length;
  }

  int get totalDelayDays =>
      phases.expand((p) => p.lots).fold<int>(0, (sum, l) => sum + l.delayDays);

  int get plannedLotsCount => phases
      .expand((p) => p.lots)
      .where((l) => !l.isDone && !l.isDelayed)
      .length;

  int get delayedLotsCount =>
      phases.expand((p) => p.lots).where((l) => l.isDelayed).length;

  int get remainingLotsCount =>
      phases.expand((p) => p.lots).where((l) => !l.isDone).length;

  Chantier copyWith({
    String? id,
    String? name,
    DateTime? plannedEnd,
    List<Phase>? phases,
    String? coverImageUrl,
    String? linkedDevisId,
  }) {
    return Chantier(
      id: id ?? this.id,
      name: name ?? this.name,
      plannedEnd: plannedEnd ?? this.plannedEnd,
      phases: phases ?? this.phases,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      linkedDevisId: linkedDevisId ?? this.linkedDevisId,
    );
  }

  factory Chantier.fromJson(Map<String, dynamic> json) {
    return Chantier(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      plannedEnd: json['planned_end'] != null
          ? DateTime.parse(json['planned_end'] as String)
          : DateTime.now(),
      phases:
          (json['phases'] as List<dynamic>?)
              ?.map((e) => Phase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      coverImageUrl: json['cover_image_url'] as String?,
      linkedDevisId: json['linked_devis_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'planned_end': plannedEnd.toIso8601String(),
    'phases': phases.map((p) => p.toJson()).toList(),
    'cover_image_url': coverImageUrl,
    'linked_devis_id': linkedDevisId,
  };
}
