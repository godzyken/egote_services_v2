import 'package:egote_services_v2/features/chantier/domain/entities/chantier.dart';
import 'package:egote_services_v2/features/chantier/domain/entities/lot.dart';
import 'package:egote_services_v2/features/chantier/domain/entities/phase.dart';
import 'package:egote_services_v2/features/chantier/domain/repositories/chantier_repository.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock repository — swap with Supabase implementation later.
class MockChantierRepository implements ChantierRepository {
  static final _sample = Chantier(
    id: 'building-2',
    name: 'Building 2',
    plannedEnd: DateTime(2025, 10, 28),
    coverImageUrl: null,
    phases: [
      Phase(
        id: 'structural',
        name: 'Structural Work',
        lots: [
          Lot(
            id: 'struct-1',
            name: 'Structural Work',
            area: AreaOfServices.ConstructionRenovation,
            progressPercent: 42,
            plannedEnd: DateTime(2025, 5, 26),
            delayDays: 0,
          ),
        ],
      ),
      Phase(
        id: 'finishing',
        name: 'Finishing Work',
        lots: [
          Lot(
            id: 'finish-1',
            name: 'Finishing Work',
            area: AreaOfServices.Peinture,
            progressPercent: 67,
            plannedEnd: DateTime(2025, 11, 25),
            delayDays: 0,
          ),
          Lot(
            id: 'design',
            name: 'Design Phase',
            area: AreaOfServices.ConstructionRenovation,
            progressPercent: 90,
            plannedStart: DateTime(2024, 5, 1),
            plannedEnd: DateTime(2025, 3, 1),
          ),
          Lot(
            id: 'electrical',
            name: 'Electrical Systems',
            area: AreaOfServices.Electricite,
            progressPercent: 85,
            plannedStart: DateTime(2024, 4, 1),
            plannedEnd: DateTime(2025, 3, 1),
          ),
          Lot(
            id: 'fire',
            name: 'Fire Safety',
            area: AreaOfServices.Securite,
            progressPercent: 75,
            plannedStart: DateTime(2024, 3, 1),
            plannedEnd: DateTime(2025, 3, 1),
            delayDays: 12,
          ),
          Lot(
            id: 'plumbing',
            name: 'Plumbing',
            area: AreaOfServices.Plomberie,
            progressPercent: 70,
            plannedStart: DateTime(2024, 3, 1),
            plannedEnd: DateTime(2025, 3, 1),
            delayDays: 5,
          ),
        ],
      ),
    ],
  );

  @override
  Future<List<Chantier>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [_sample];
  }

  @override
  Future<Chantier?> fetchById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    if (id == _sample.id) return _sample;
    return _sample; // demo fallback
  }
}

final chantierRepositoryProvider = Provider<ChantierRepository>((ref) {
  return MockChantierRepository();
});

final chantiersProvider = FutureProvider<List<Chantier>>((ref) async {
  return ref.watch(chantierRepositoryProvider).fetchAll();
});

final chantierByIdProvider = FutureProvider.family<Chantier?, String>((
  ref,
  id,
) async {
  return ref.watch(chantierRepositoryProvider).fetchById(id);
});
