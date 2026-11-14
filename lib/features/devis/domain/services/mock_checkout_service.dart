import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';

class MockCheckoutService implements CheckoutService {
  final List<DevisModelEntity> _devisList = [
    DevisModelEntity.initialize(
      id: DevisId(id: 1001),
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    DevisModelEntity.initialize(
      id: DevisId(id: 1002),
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  Future<List<DevisModelEntity>> get getAll async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _devisList;
  }

  @override
  Future<DevisModelEntity> update(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _devisList.first;
  }

  @override
  Future<void> delete(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _devisList.removeWhere(
      (d) => d.when(
        approved:
            (
              i,
              _,
              __,
              ___,
              ____,
              _____,
              ______,
              _______,
              ________,
              _________,
              __________,
              ___________,
            ) => i.id.toString() == id,
        initialize: (i, _) => i.id.toString() == id,
        empty: () => false,
      ),
    );
  }
}
