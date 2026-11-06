import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DevisModelEntity Domain Tests', () {
    test('empty factory creates empty state', () {
      final devis = DevisModelEntity.empty();
      expect(devis, isNotNull);
      devis.when(
        initialize: (_, _) => fail('Expected empty state'),
        approved:
            (_, _, _, _, _, _, _, _, _, _, _, _) =>
                fail('Expected empty state'),
        empty: () => expect(true, isTrue),
      );
    });

    test('initialize factory sets id and creation date', () {
      final id = const DevisId(id: 42);
      final now = DateTime.now();
      final devis = DevisModelEntity.initialize(id: id, createdAt: now);

      devis.when(
        initialize: (resultId, resultDate) {
          expect(resultId.id, 42);
          expect(resultDate, now);
        },
        approved:
            (_, _, _, _, _, _, _, _, _, _, _, _) =>
                fail('Expected initialize state'),
        empty: () => fail('Expected initialize state'),
      );
    });
  });
}
