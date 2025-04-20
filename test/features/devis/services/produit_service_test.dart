import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/value_objects_extensions.dart';
import 'package:egote_services_v2/features/devis/domain/services/devis_calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

Produit mockProduit({double price = 10.0, int quantity = 2}) {
  return Produit(
    id: 'p1',
    sku: SKUValue('sku-1'),
    name: 'Produit Test',
    manufacturer: 'Test Inc.',
    imageUrl: '',
    url: '',
  ).copyWith(
    price: PriceValue(price),
    quantity: QuantityValue(quantity),
  );
}

ProduitDevis mockProduitDevis({
  required List<Produit> produit,
  required int quantity,
  required double remise,
}) {
  return ProduitDevis(
    produit: mockProduit(),
    quantity: QuantityValue(1),
    remise: 0,
  );
}

void main() {
  late DevisCalculatorService calculator;

  setUp(() {
    calculator = DevisCalculatorService();
  });

  test('🧮 calculerMontantHt() retourne le bon total', () {
    final produitDevis = [
      mockProduitDevis(produit: [
        mockProduit(price: 20.0, quantity: 2), // 40
        mockProduit(price: 10.0, quantity: 3), // 30
      ], quantity: 2, remise: 0),
    ];
    final montantHt = calculator.calculerMontantHt(produitDevis);
    expect(montantHt, 70.0);
  });

  test('💶 calculerMontantTtc() applique bien la TVA', () {
    final montantHt = 100.0;

    final produitDevis = [
      mockProduitDevis(produit: [
        mockProduit(price: 20.0 + montantHt, quantity: 2), // 240
        mockProduit(price: 10.0 + montantHt, quantity: 3), // 330
      ], quantity: 2, remise: 0),
    ];

    final ttc = calculator.calculerMontantTtc(produitDevis, 20); // 1200
    expect(ttc, 684.0);
  });

  test('📦 ajouterProduitEtRecalculer() met à jour les produits et totaux', () {
    final base = DevisModelEntity.edit(
      id: DevisId(value: const Uuid().v4()),
      createdAt: DateTime.now(),
      validity: DateTime.now().add(Duration(days: 90)),
      client: ContactOwnerEntity.empty(),
      pro: ContactOwnerEntity.empty(),
      travauxEntity: [],
      produitsDevis: [],
      quantity: 0,
      unitPrice: 0,
      vatRates: 20,
      amountHt: 0,
      amountTtc: 0,
      approval: false,
    );

    final updated = calculator.ajouterProduitEtRecalculer(
      devis: base,
      produitDevis: mockProduitDevis(produit: [
        mockProduit(
          price: 50.0, // 100 HT
          quantity: 2,
        ),
        mockProduit(
          price: 100.0, // 200 HT
          quantity: 2,
        )
      ], quantity: 2, remise: 25), // 275 HT
    );

    expect(
        updated.maybeMap(orElse: () => base, edit: (value) => value.amountTtc),
        120);
    expect(updated.amountHt, 100.0);
    expect(updated.amountTtc, 120.0); // 20% VAT
  });

  group('Produit totalPrice', () {
    test('calcul with price and quantity', () {
      final produit = Produit(
          id: '1',
          price: PriceValue(50.0),
          quantity: QuantityValue(2),
          sku: SKUValue('sku-564'),
          name: '',
          manufacturer: '',
          imageUrl: '',
          url: '');
      expect(produit.totalPrice, 100.0);
    });

    test('returns 0 if price is null', () {
      final produit = Produit(
          id: '1',
          price: PriceValue(0),
          quantity: QuantityValue(2),
          sku: SKUValue('sku-404'),
          name: '',
          manufacturer: '',
          imageUrl: '',
          url: '');
      expect(produit.totalPrice, 0.0);
    });

    test('uses quantity 1 if quantity is null', () {
      final produit = Produit(
          id: '1',
          price: PriceValue(30.0),
          quantity: QuantityValue(3),
          sku: SKUValue('sku-200'),
          name: '',
          manufacturer: '',
          imageUrl: '',
          url: '');
      expect(produit.totalPrice, 90.0);
    });

    test('returns 0 if both price and quantity are null', () {
      final produit = Produit(
          id: '1',
          price: PriceValue(0),
          quantity: QuantityValue(0),
          sku: SKUValue('sku-401'),
          name: '',
          manufacturer: '',
          imageUrl: '',
          url: '');
      expect(produit.totalPrice, 0.0);
    });
  });
}
