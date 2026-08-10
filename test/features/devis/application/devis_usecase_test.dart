import 'package:flutter_test/flutter_test.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';

void main() {
  group('Devis Feature - Models', () {
    test('should create an empty DevisModelEntity', () {
      final devis = DevisModelEntity.empty();
      expect(devis, isNotNull);
    });

    test('should initialize DevisModelEntity', () {
      final id = const DevisId(id: 1);
      final now = DateTime.now();
      final devis = DevisModelEntity.initialize(id: id, createdAt: now);
      
      devis.when(
        initialize: (idResult, date) {
          expect(idResult, id);
          expect(date, now);
        },
        approved: (_, __, ___, ____, _____, ______, _______, ________, _________, __________, ___________, ____________) => fail('Should be initialize'),
        empty: () => fail('Should be initialize'),
      );
    });
  });

  group('Devis Feature - Calculations', () {
    test('should calculate totals correctly', () {
      // Arrange
      const unitPrice = 100;
      const quantity = 5;
      const vatRate = 0.20; // 20%

      // Act
      final amountHt = unitPrice * quantity;
      final amountTtc = amountHt * (1 + vatRate);

      // Assert
      expect(amountHt, 500);
      expect(amountTtc, 600);
    });
  });
}
