import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';

class Lot {
  final String id;
  final String name;
  final AreaOfServices area;
  final double progressPercent;
  final DateTime? plannedStart;
  final DateTime? plannedEnd;
  final DateTime? actualEnd;
  final int delayDays;

  const Lot({
    required this.id,
    required this.name,
    required this.area,
    required this.progressPercent,
    this.plannedStart,
    this.plannedEnd,
    this.actualEnd,
    this.delayDays = 0,
  });

  bool get isDelayed => delayDays > 0;

  bool get isDone => progressPercent >= 100;

  Lot copyWith({
    String? id,
    String? name,
    AreaOfServices? area,
    double? progressPercent,
    DateTime? plannedStart,
    DateTime? plannedEnd,
    DateTime? actualEnd,
    int? delayDays,
  }) {
    return Lot(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      progressPercent: progressPercent ?? this.progressPercent,
      plannedStart: plannedStart ?? this.plannedStart,
      plannedEnd: plannedEnd ?? this.plannedEnd,
      actualEnd: actualEnd ?? this.actualEnd,
      delayDays: delayDays ?? this.delayDays,
    );
  }

  factory Lot.fromJson(Map<String, dynamic> json) {
    return Lot(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      area: json['area'] is AreaOfServices
          ? json['area'] as AreaOfServices
          : AreaOfServices.ConstructionRenovation,
      progressPercent: (json['progress_percent'] as num?)?.toDouble() ?? 0.0,
      plannedStart: json['planned_start'] != null
          ? DateTime.parse(json['planned_start'] as String)
          : null,
      plannedEnd: json['planned_end'] != null
          ? DateTime.parse(json['planned_end'] as String)
          : null,
      actualEnd: json['actual_end'] != null
          ? DateTime.parse(json['actual_end'] as String)
          : null,
      delayDays: json['delay_days'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'area': area,
    'progress_percent': progressPercent,
    'planned_start': plannedStart?.toIso8601String(),
    'planned_end': plannedEnd?.toIso8601String(),
    'actual_end': actualEnd?.toIso8601String(),
    'delay_days': delayDays,
  };
}
