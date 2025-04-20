import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/price_value.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/quantity_value.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/sku_value.dart';
import 'package:egote_services_v2/features/devis/domain/providers/check_out_service_provider.dart';
import 'package:egote_services_v2/features/devis/domain/providers/devis_calculator_provider.dart';
import 'package:egote_services_v2/features/devis/domain/providers/devis_service_notifier_provider.dart';
import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:egote_services_v2/features/devis/domain/services/devis_calculator_service.dart';
import 'package:egote_services_v2/features/devis/domain/services/devis_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockCalculator extends Mock implements DevisCalculatorService {
  DevisModelEntity ajouterProduitEtRecalculer({
    required DevisModelEntity devis,
    required ProduitDevis produitDevis,
  }) =>
      devis;
}

class MockCheckoutService extends Mock implements CheckoutService {
  Future<DevisModelEntity> update(String sku) async {
    return DevisModelEntity.edit(
      id: DevisId(value: 'mock'),
      createdAt: DateTime.now(),
      client: ContactOwnerEntity.empty(),
      pro: ContactOwnerEntity.empty(),
      travauxEntity: [],
      produitsDevis: [],
      quantity: 0,
      unitPrice: 0,
      vatRates: 20,
      amountHt: 0.0,
      amountTtc: 0.0,
      approval: false,
      validity: DateTime.now().add(Duration(days: 30)),
    );
  }
}

class MockLogger extends Mock implements TransactionLoggerService {
  Future<void> logTransactionToSupabase(
      Produit produit, String action, String ts) async {}
  Future<void> logTransactionToFile(
      Produit produit, String action, String ts) async {}
}

void main() {
  late ProviderContainer container;
  late DevisServiceNotifier notifier;
  late ProduitDevis sampleProduitDevis;
  late Produit sampleProduit;

  setUp(() {
    final calculator = MockCalculator();
    final checkout = MockCheckoutService();
    final logger = MockLogger();

    container = ProviderContainer(overrides: [
      devisCalculatorProdider.overrideWithValue(calculator),
      checkoutServiceProvider.overrideWithValue(checkout),
    ]);

    notifier = container.read(devisServiceNotifierProvider);

    sampleProduit = Produit(
      id: '1',
      sku: SKUValue('sku-001'),
      name: 'Produit Test',
      quantity: QuantityValue(2),
      price: PriceValue(50.0),
      manufacturer: 'Polo',
      imageUrl: '',
      url: '',
    );

    sampleProduitDevis = ProduitDevis(
      produit: sampleProduit,
      quantity: QuantityValue(sampleProduit.quantity.quantity ?? 1),
      remise: (sampleProduit.totalPrice ?? 0.0) *
          (sampleProduit.quantity.quantity ?? 1),
    );

    // init client & pro
    notifier.initialize(ContactOwnerEntity.empty(), ContactOwnerEntity.empty());
  });

  test('initialize should set a valid DevisModelEntity', () {
    final client = notifier.devis?.maybeMap(
      edit: (d) => d.client,
      orElse: () => notifier.devis,
    );
    expect(notifier.devis, isNotNull);
    expect(client, isA<ContactOwnerEntity>());
  });

  test('addProduit should call calculator and update state', () {
    final calculator =
        container.read(devisCalculatorProdider) as MockCalculator;

    when(() => calculator.ajouterProduitEtRecalculer(
          devis: any(named: 'devis'),
          produitDevis: sampleProduitDevis,
        )).thenReturn(notifier.devis!);

    notifier.addProduit(sampleProduitDevis);

    verify(() => calculator.ajouterProduitEtRecalculer(
          devis: any(named: 'devis'),
          produitDevis: sampleProduitDevis,
        )).called(1);
  });

  test('removeProduit should update state without the product', () {
    // Inject a devis that contains the sample produit
    final withProduit = notifier.devis!.maybeMap(
      edit: (d) => d.copyWith(produitsDevis: [sampleProduitDevis]),
      orElse: () => throw Exception('Invalid'),
    );

    notifier = container.read(devisServiceNotifierProvider);
    notifier.initialize(ContactOwnerEntity.empty(), ContactOwnerEntity.empty());
    notifier.devis = notifier.devis!.maybeMap(
        edit: (d) => d.copyWith(produitsDevis: []), orElse: () => withProduit);

    notifier.removeProduit(sampleProduit);

    expect(
        notifier.devis?.maybeMap(
          edit: (d) => d.produitsDevis,
          orElse: () => [],
        ),
        isEmpty);
  });

  test('reset should clear the devis', () {
    notifier.reset();
    expect(notifier.devis, isNull);
  });

  test('syncPrixProduits should update product prices and log changes',
      () async {
    final logger = MockLogger();

    // Ajouter un produit initial avec un vieux prix
    final oldProduit = sampleProduitDevis.copyWith(remise: 10.0);
    notifier.transactionLoggerService = logger;

    notifier.devis = notifier.devis?.maybeMap(
      edit: (d) => d.copyWith(produitsDevis: [oldProduit]),
      orElse: () => throw Exception('Invalid'),
    );

    // Simuler la récupération d'un prix depuis Supabase
    Future<double?> mockFetchPrice(String sku) async => 100.0;

    when(() => logger.logTransactionToSupabase(any(), any(), any()))
        .thenAnswer((_) async {});
    when(() => logger.logTransactionToFile(any(), any(), any()))
        .thenAnswer((_) async {});

    await notifier.syncPrixProduits(mockFetchPrice);

    final updatedProduit = notifier.devis!.maybeMap(
      edit: (d) => d.produitsDevis.first,
      orElse: () => null,
    );

    expect(updatedProduit?.produit.price, 100.0);

    verify(() => logger.logTransactionToSupabase(any(), 'price_updated', any()))
        .called(1);
    verify(() => logger.logTransactionToFile(any(), 'price_updated', any()))
        .called(1);
  });

  test('addProduit should recalculate HT, TTC and quantity', () {
    final produit = Produit(
      id: 'prod-1',
      sku: SKUValue('sku-1'),
      name: 'Produit A',
      quantity: QuantityValue(2),
      price: PriceValue(50.0), // 2 * 50 = 100 HT
      manufacturer: '',
      imageUrl: '',
      url: '',
    );

    final produitDevis = ProduitDevis(
      produit: produit,
      quantity: QuantityValue(2),
      remise: 100.0,
    );

    final calculator =
        container.read(devisCalculatorProdider) as MockCalculator;

    final updatedDevis = notifier.devis!.maybeMap(
      edit: (d) => d.copyWith(
        produitsDevis: [produitDevis],
        quantity: 2,
        amountHt: 100.0,
        amountTtc: 120.0, // 20% VAT
      ),
      orElse: () => throw Exception('Invalid'),
    );

    when(() => calculator.ajouterProduitEtRecalculer(
          devis: any(named: 'devis'),
          produitDevis: produitDevis,
        )).thenReturn(updatedDevis);

    notifier.addProduit(produitDevis);

    final d = notifier.devis!
        .maybeMap(edit: (d) => d, orElse: () => throw Exception());

    expect(d.amountHt, 100.0);
    expect(d.amountTtc, 120.0);
    expect(d.quantity, 2);
  });

  test('removeProduit should recalculate HT, TTC and quantity after removal',
      () {
    final produit1 = Produit(
        id: '1',
        name: 'P1',
        quantity: QuantityValue(1),
        price: PriceValue(100.0),
        sku: SKUValue('54866990A654O'),
        manufacturer: '',
        imageUrl: '',
        url: '');
    final produit2 = Produit(
        id: '2',
        name: 'P2',
        quantity: QuantityValue(2),
        price: PriceValue(50.0),
        sku: SKUValue(''),
        manufacturer: '',
        imageUrl: '',
        url: '');

    final produitDevis1 = ProduitDevis(
        produit: produit1, quantity: QuantityValue(1), remise: 10.0);
    final produitDevis2 = ProduitDevis(
        produit: produit2, quantity: QuantityValue(2), remise: 15.0);

    // Total: 1×100 + 2×50 = 200
    final initial = notifier.devis!.maybeMap(
      edit: (d) => d.copyWith(
        produitsDevis: [produitDevis1, produitDevis2],
        quantity: 3,
        amountHt: 200.0,
        amountTtc: 240.0,
      ),
      orElse: () => throw Exception(),
    );

    notifier.devis = notifier.devis!.maybeMap(
      orElse: () => initial,
      edit: (d) {
        d.produitsDevis.removeWhere((p) => p.produit.id == produit2.id);
        return d;
      },
    );

    notifier.removeProduit(produit1);

    final d = notifier.devis!
        .maybeMap(edit: (d) => d, orElse: () => throw Exception());

    expect(d.produitsDevis.length, 1);
    expect(d.quantity, 2);
    expect(d.amountHt, 100.0); // 2 * 50
    expect(d.amountTtc, 120.0); // 100 + 20%
  });

  test('addProduit with null price should treat it as 0 in calculations', () {
    final produitSansPrix = Produit(
      id: 'null-price-prod',
      sku: SKUValue('sku-null'),
      name: 'Produit Sans Prix',
      quantity: QuantityValue(3),
      price: PriceValue(0.0), // 💸 Prix manquant
      manufacturer: '',
      imageUrl: '',
      url: '',
    );

    final produitDevis = ProduitDevis(
      produit: produitSansPrix,
      quantity: QuantityValue(3),
      remise: 0.0,
    );

    final calculator =
        container.read(devisCalculatorProdider) as MockCalculator;

    final updatedDevis = notifier.devis!.maybeMap(
      edit: (d) => d.copyWith(
        produitsDevis: [produitDevis],
        quantity: 3,
        amountHt: 0.0,
        amountTtc: 0.0,
      ),
      orElse: () => throw Exception('Invalid'),
    );

    when(() => calculator.ajouterProduitEtRecalculer(
          devis: any(named: 'devis'),
          produitDevis: produitDevis,
        )).thenReturn(updatedDevis);

    notifier.addProduit(produitDevis);

    final d = notifier.devis!
        .maybeMap(edit: (d) => d, orElse: () => throw Exception());

    expect(d.amountHt, 0.0); // ✅ Pas d’erreur malgré le null
    expect(d.amountTtc, 0.0);
    expect(d.quantity, 3);
  });

  test('should skip null prices in total calculation', () {
    final p1 = Produit(
        id: '1',
        price: PriceValue(100.0),
        quantity: QuantityValue(1),
        sku: SKUValue('sku-007'),
        name: '',
        manufacturer: '',
        imageUrl: '',
        url: '');
    final p2 = Produit(
        id: '2',
        price: PriceValue(7.0),
        quantity: QuantityValue(2),
        sku: SKUValue('sku-008'),
        name: '',
        manufacturer: '',
        imageUrl: '',
        url: ''); // null
    final p3 = Produit(
        id: '3',
        price: PriceValue(100.0),
        quantity: QuantityValue(2),
        sku: SKUValue('sku-509'),
        name: '',
        manufacturer: '',
        imageUrl: '',
        url: '');

    final d1 =
        ProduitDevis(produit: p1, quantity: QuantityValue(1), remise: 0.0);
    final d2 =
        ProduitDevis(produit: p2, quantity: QuantityValue(2), remise: 0.0);
    final d3 =
        ProduitDevis(produit: p3, quantity: QuantityValue(2), remise: 0.0);

    final initial = notifier.devis!.maybeMap(
      edit: (d) => d.copyWith(
        produitsDevis: [d1, d2, d3],
        quantity: 5,
        amountHt: 100.0 + 0.0 + 100.0, // null → 0
        amountTtc: (200.0) * 1.2,
      ),
      orElse: () => throw Exception(),
    );

    notifier.devis!.maybeMap(
        orElse: () => initial,
        edit: (d) {
          d.produitsDevis.lastIndexWhere((d) {
            return d.produit.id == p2.id;
          });
        });

    final d = notifier.devis!
        .maybeMap(edit: (d) => d, orElse: () => throw Exception());

    expect(d.amountHt, 200.0);
    expect(d.amountTtc, 240.0);
    expect(d.quantity, 5);
  });

  test('snapshot devis complet', () {
    final devis = notifier.devis!;
    final json = devis.toJson();

    expect(
        json,
        equals({
          'id': isNotNull,
          'client': isMap,
          'pro': isMap,
          'produits': isList,
          'amount_ht': isA<num>(),
          'amount_ttc': isA<num>(),
          'approval': false,
          'quantity': isA<num>(),
          'unit_price': isA<num>(),
          'validity': isA<String>(),
          'travaux': isList,
          'vat_rates': isA<num>(),
          'created_at': isA<String>(),
        }));
  });
}
