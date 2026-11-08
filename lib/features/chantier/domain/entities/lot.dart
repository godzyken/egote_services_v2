import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lot.freezed.dart';
part 'lot.g.dart';

@freezed
abstract class Lot with _$Lot {
  const Lot._();

  const factory Lot({
    required String id,
    required String name,
    required AreaOfServices area,
    required double progressPercent,
    DateTime? plannedStart,
    DateTime? plannedEnd,
    DateTime? actualEnd,
    @Default(0) int delayDays,
  }) = _Lot;

  factory Lot.fromJson(Map<String, dynamic> json) => _$LotFromJson(json);

  bool get isDelayed => delayDays > 0;
  bool get isDone => progressPercent >= 100;
}
