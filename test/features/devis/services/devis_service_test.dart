import 'package:egote_services_v2/config/providers/documents/devis_repo_provider.dart';
import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/repository/devis_repository.dart';
import 'package:egote_services_v2/features/devis/domain/services/devis_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

class MockDevisRepository extends Mock implements DevisRepository {}

void main() {
  late ProviderContainer container;
  late DevisService devisService;
  late MockDevisRepository mockRepository;
  late DevisModelEntity devis;

  setUp(() {
    mockRepository = MockDevisRepository();

    container = ProviderContainer(overrides: [
      devisRepoProvider.overrideWithValue(mockRepository),
    ]);

    devisService = container.read(devisServiceProvider);

    devis = DevisModelEntity.edit(
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
  });

  group('DevisService Tests', () {
    test('createDevis calls repository with correct data', () async {
      when(() => mockRepository.createDevis(any())).thenAnswer((_) async {});

      await devisService.createDevis(devis);

      verify(() => mockRepository.createDevis(any())).called(1);
    });

    test('fetchAllDevis returns list from repository', () async {
      when(() => mockRepository.fetchAllDevis())
          .thenAnswer((_) async => [devis]);
      final devisId = devis.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      final result = await devisService.fetchAllDevis();

      final resId = result.first.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      expect(result, isA<List<DevisModelEntity>>());
      expect(resId, equals(devisId));
    });

    test('fetchDevisById returns a single devis', () async {
      when(() => mockRepository.fetchDevisById(any()))
          .thenAnswer((_) async => devis);
      final devisId = devis.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      final result = await devisService.fetchDevisById(devisId.toString());
      final resId = result
        ?..maybeMap(
          edit: (d) => d.id,
          orElse: () => devis,
        );

      expect(result, isA<DevisModelEntity>());
      expect(resId, equals(devisId));
    });

    test('updateDevis calls repository with updated data', () async {
      when(() => mockRepository.updateDevis(any(), any<Map<String, dynamic>>()))
          .thenAnswer((_) async {});

      await devisService.updateDevis(devis);
      final devisId = devis.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      final capturedArgs = verify(
          () => mockRepository.updateDevis(devisId.toString(), captureAny()));

      final updated = capturedArgs.captured.first as Map<String, dynamic>;

      expect(updated['validity'], isNotNull);
    });

    test('deleteDevis calls repository with correct id', () async {
      when(() => mockRepository.deleteDevis(any())).thenAnswer((_) async {});

      final devisId = devis.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      await devisService.deleteDevis(devisId.toString());

      verify(() => mockRepository.deleteDevis(devisId.toString())).called(1);
    });

    test('fetchPriceForProductFromSupabase returns price', () async {
      when(() => mockRepository.syncPrixProduit(any()))
          .thenAnswer((_) async => 99.99);

      final price =
          await devisService.fetchPriceForProductFromSupabase('SKU123');

      expect(price, 99.99);
    });

    test('updateDevis calls repository with correct arguments', () async {
      // Arrange
      when(() => mockRepository.updateDevis(any(), any()))
          .thenAnswer((_) async {});

      final service = container.read(devisServiceProvider);

      // Act
      await service.updateDevis(devis);

      final devisId = devis.maybeMap(
        edit: (d) => d.id,
        orElse: () => devis,
      );

      // Assert
      final captured = verify(() =>
              mockRepository.updateDevis(devisId.toString(), captureAny()))
          .captured
          .first as Map<String, dynamic>;

      expect(captured['validity'], isA<String>());
      expect(captured['approval'], false);
      expect(captured['vat_rates'], 20);
      expect(captured['produits'], isA<List>());
      expect(captured['travaux'], isA<List>());

      verify(() => mockRepository.updateDevis(
          devisId.toString(), any<Map<String, dynamic>>())).called(1);
    });
  });
}
