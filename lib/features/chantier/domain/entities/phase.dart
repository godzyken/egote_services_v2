import 'lot.dart';

class Phase {
  final String id;
  final String name;
  final List<Lot> lots;

  const Phase({required this.id, required this.name, this.lots = const []});

  double get progressPercent {
    if (lots.isEmpty) return 0;
    final total = lots.fold<double>(0, (sum, l) => sum + l.progressPercent);
    return total / lots.length;
  }

  Phase copyWith({String? id, String? name, List<Lot>? lots}) {
    return Phase(
      id: id ?? this.id,
      name: name ?? this.name,
      lots: lots ?? this.lots,
    );
  }

  factory Phase.fromJson(Map<String, dynamic> json) {
    return Phase(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lots:
          (json['lots'] as List<dynamic>?)
              ?.map((e) => Lot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lots': lots.map((l) => l.toJson()).toList(),
  };
}
