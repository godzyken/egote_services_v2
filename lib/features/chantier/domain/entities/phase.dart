import 'package:freezed_annotation/freezed_annotation.dart';

import 'lot.dart';

part 'phase.freezed.dart';
part 'phase.g.dart';

@freezed
abstract class Phase with _$Phase {
  const Phase._();

  const factory Phase({
    required String id,
    required String name,
    @Default(<Lot>[]) List<Lot> lots,
  }) = _Phase;

  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);

  double get progressPercent {
    if (lots.isEmpty) return 0;
    final total = lots.fold<double>(0, (sum, l) => sum + l.progressPercent);
    return total / lots.length;
  }
}
