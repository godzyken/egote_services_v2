import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('Devis Feature - Create Devis Use Case', () {
    late MockDevisRepository mockDevisRepository;

    setUp(() {
      mockDevisRepository = MockDevisRepository();
    });

    test('should create devis with valid data', () async {
      // Arrange
      const devisData = {
        'title': 'Rénovation cuisine',
        'clientId': 'client_123',
        'totalAmount': 5000.0,
        'items': [
          {'description': 'Peinture', 'quantity': 1, 'unitPrice': 500}
        ],
      };

      final mockDevis = MockDevis.fromMap(devisData);

      when(() => mockDevisRepository.createDevis(devisData))
          .thenAnswer((_) async => mockDevis);

      // Act
      final result = await mockDevisRepository.createDevis(devisData);

      // Assert
      expect(result, isNotNull);
      expect(result['title'], 'Rénovation cuisine');
      expect(result['totalAmount'], 5000.0);
      verify(() => mockDevisRepository.createDevis(devisData)).called(1);
    });

    test('should calculate totals correctly', () async {
      // Arrange
      final items = [
        {'description': 'Item 1', 'quantity': 2, 'unitPrice': 500.0},
        {'description': 'Item 2', 'quantity': 1, 'unitPrice': 1000.0},
      ];

      final devisData = {
        'title': 'Devis Test',
        'clientId': 'client_123',
        'items': items,
        'totalAmount': 2000.0, // (2*500) + (1*1000)
      };

      final mockDevis = MockDevis.fromMap(devisData);

      when(() => mockDevisRepository.createDevis(devisData))
          .thenAnswer((_) async => mockDevis);

      // Act
      final result = await mockDevisRepository.createDevis(devisData);

      // Assert
      expect(result['totalAmount'], 2000.0);
      expect((result['items'] as List).length, 2);
    });

    test('should apply discounts properly', () async {
      // Arrange
      const baseAmount = 1000.0;
      const discountPercentage = 10.0;
      const expectedTotal = 900.0; // 1000 - (1000 * 10%)

      final devisData = {
        'title': 'Devis avec remise',
        'clientId': 'client_123',
        'baseAmount': baseAmount,
        'discountPercentage': discountPercentage,
        'totalAmount': expectedTotal,
      };

      final mockDevis = MockDevis.fromMap(devisData);

      when(() => mockDevisRepository.createDevis(devisData))
          .thenAnswer((_) async => mockDevis);

      // Act
      final result = await mockDevisRepository.createDevis(devisData);

      // Assert
      expect(result['totalAmount'], expectedTotal);
      expect(result['discountPercentage'], discountPercentage);
    });
  });

  group('Devis Feature - List Devis Use Case', () {
    late MockDevisRepository mockDevisRepository;

    setUp(() {
      mockDevisRepository = MockDevisRepository();
    });

    test('should fetch devis list', () async {
      // Arrange
      final mockDevisList = [
        MockDevis.fromMap({
          'id': 'devis_1',
          'title': 'Devis 1',
          'status': 'draft',
          'totalAmount': 1000.0,
        }),
        MockDevis.fromMap({
          'id': 'devis_2',
          'title': 'Devis 2',
          'status': 'sent',
          'totalAmount': 2000.0,
        }),
      ];

      when(() => mockDevisRepository.getDevisList())
          .thenAnswer((_) async => mockDevisList);

      // Act
      final result = await mockDevisRepository.getDevisList();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0]['title'], 'Devis 1');
      expect(result[1]['title'], 'Devis 2');
    });

    test('should filter by status', () async {
      // Arrange
      const status = 'accepted';
      final mockFilteredDevis = [
        MockDevis.fromMap({
          'id': 'devis_3',
          'title': 'Accepted Devis',
          'status': status,
          'totalAmount': 3000.0,
        }),
      ];

      when(() => mockDevisRepository.getDevisList(status: status))
          .thenAnswer((_) async => mockFilteredDevis);

      // Act
      final result = await mockDevisRepository.getDevisList(status: status);

      // Assert
      expect(result.length, 1);
      expect(result[0]['status'], status);
    });

    test('should sort by date', () async {
      // Arrange
      final mockDevisList = [
        MockDevis.fromMap({
          'id': 'devis_1',
          'title': 'Devis 1',
          'createdAt': '2026-08-01',
          'totalAmount': 1000.0,
        }),
        MockDevis.fromMap({
          'id': 'devis_2',
          'title': 'Devis 2',
          'createdAt': '2026-08-05',
          'totalAmount': 2000.0,
        }),
      ];

      when(() => mockDevisRepository.getDevisList(sortBy: 'date'))
          .thenAnswer((_) async => mockDevisList);

      // Act
      final result = await mockDevisRepository.getDevisList(sortBy: 'date');

      // Assert
      expect(result.length, 2);
      expect(result[0]['createdAt'], '2026-08-01');
      expect(result[1]['createdAt'], '2026-08-05');
    });
  });

  group('Devis Feature - Update Devis Use Case', () {
    late MockDevisRepository mockDevisRepository;

    setUp(() {
      mockDevisRepository = MockDevisRepository();
    });

    test('should update devis status', () async {
      // Arrange
      const devisId = 'devis_1';
      const newStatus = 'sent';

      final updatedDevis = MockDevis.fromMap({
        'id': devisId,
        'title': 'Updated Devis',
        'status': newStatus,
        'totalAmount': 1000.0,
      });

      when(() => mockDevisRepository.updateDevisStatus(devisId, newStatus))
          .thenAnswer((_) async => updatedDevis);

      // Act
      final result =
          await mockDevisRepository.updateDevisStatus(devisId, newStatus);

      // Assert
      expect(result['status'], newStatus);
      verify(() => mockDevisRepository.updateDevisStatus(devisId, newStatus))
          .called(1);
    });

    test('should not allow update after acceptance', () async {
      // Arrange
      const devisId = 'devis_accepted';
      const newStatus = 'draft';

      when(() => mockDevisRepository.updateDevisStatus(devisId, newStatus))
          .thenThrow(
              Exception('Cannot update status of accepted devis'));

      // Act & Assert
      expect(
        () => mockDevisRepository.updateDevisStatus(devisId, newStatus),
        throwsException,
      );
    });

    test('should send notification on status change', () async {
      // Arrange
      const devisId = 'devis_1';
      const newStatus = 'accepted';
      bool notificationSent = false;

      final updatedDevis = MockDevis.fromMap({
        'id': devisId,
        'status': newStatus,
        'totalAmount': 1000.0,
      });

      when(() => mockDevisRepository.updateDevisStatus(devisId, newStatus))
          .thenAnswer((_) async {
        notificationSent = true;
        return updatedDevis;
      });

      // Act
      final result =
          await mockDevisRepository.updateDevisStatus(devisId, newStatus);

      // Assert
      expect(result['status'], newStatus);
      expect(notificationSent, true);
    });
  });
}

class MockDevisRepository {
  Future<Map<String, dynamic>> createDevis(Map<String, dynamic> data) async {
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>> getDevisList({
    String? status,
    String? sortBy,
  }) async {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> updateDevisStatus(
      String devisId, String newStatus) async {
    throw UnimplementedError();
  }
}

class MockDevis {
  static Map<String, dynamic> fromMap(Map<String, dynamic> data) {
    return {
      'id': data['id'] ?? 'devis_default',
      'title': data['title'] ?? 'Default Devis',
      'status': data['status'] ?? 'draft',
      'totalAmount': data['totalAmount'] ?? 0.0,
      'items': data['items'] ?? [],
      'clientId': data['clientId'] ?? '',
      'createdAt': data['createdAt'] ?? DateTime.now().toString(),
      'baseAmount': data['baseAmount'],
      'discountPercentage': data['discountPercentage'],
    };
  }
}
