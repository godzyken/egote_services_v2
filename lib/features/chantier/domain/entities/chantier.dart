import 'package:freezed_annotation/freezed_annotation.dart';

import 'phase.dart';

part 'chantier.freezed.dart';
part 'chantier.g.dart';

@freezed
abstract class Chantier with _$Chantier {
  const Chantier._();

  const factory Chantier({
    required String id,
    required String name,
    required DateTime plannedEnd,
    @Default(<Phase>[]) List<Phase> phases,
    String? coverImageUrl,
    String? linkedDevisId,
  }) = _Chantier;

  factory Chantier.fromJson(Map<String, dynamic> json) =>
      _$ChantierFromJson(json);

  double get overallProgress {
    if (phases.isEmpty) return 0;
    final total =
        phases.fold<double>(0, (sum, p) => sum + p.progressPercent);
    return total / phases.length;
  }

  int get totalDelayDays => phases
      .expand((p) => p.lots)
      .fold<int>(0, (sum, l) => sum + l.delayDays);

  int get plannedLotsCount => phases
      .expand((p) => p.lots)
      .where((l) => !l.isDone && !l.isDelayed)
      .length;

  int get delayedLotsCount =>
      phases.expand((p) => p.lots).where((l) => l.isDelayed).length;

  int get remainingLotsCount =>
      phases.expand((p) => p.lots).where((l) => !l.isDone).length;
}
