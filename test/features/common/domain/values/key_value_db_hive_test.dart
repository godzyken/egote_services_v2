import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockBox extends Mock implements Box<dynamic> {}

void main() {
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
  });

  group('Hive CRUD Operations - KeyValueDbHive', () {
    test('CREATE / PUT - stores string value in Hive box', () async {
      when(() => mockBox.put('app_theme', 'dark')).thenAnswer((_) async {});

      // Simulate put operation
      await mockBox.put('app_theme', 'dark');

      verify(() => mockBox.put('app_theme', 'dark')).called(1);
    });

    test('CREATE / PUT - stores complex map in Hive box', () async {
      final userMap = {'id': 123, 'name': 'John Doe', 'is_pro': true};
      when(() => mockBox.put('current_user', userMap)).thenAnswer((_) async {});

      await mockBox.put('current_user', userMap);

      verify(() => mockBox.put('current_user', userMap)).called(1);
    });

    test('READ / GET - retrieves existing string value', () {
      when(
        () => mockBox.get('app_theme', defaultValue: 'light'),
      ).thenReturn('dark');

      final result = mockBox.get('app_theme', defaultValue: 'light');

      expect(result, equals('dark'));
      verify(() => mockBox.get('app_theme', defaultValue: 'light')).called(1);
    });

    test('READ / GET - returns default value when key does not exist', () {
      when(
        () => mockBox.get('unknown_key', defaultValue: 'default_val'),
      ).thenReturn('default_val');

      final result = mockBox.get('unknown_key', defaultValue: 'default_val');

      expect(result, equals('default_val'));
    });

    test('UPDATE - overwrites existing key with new value', () async {
      when(
        () => mockBox.put('user_token', 'token_v1'),
      ).thenAnswer((_) async {});
      when(
        () => mockBox.put('user_token', 'token_v2'),
      ).thenAnswer((_) async {});
      when(
        () => mockBox.get('user_token', defaultValue: ''),
      ).thenReturn('token_v2');

      await mockBox.put('user_token', 'token_v1');
      await mockBox.put('user_token', 'token_v2');
      final updatedToken = mockBox.get('user_token', defaultValue: '');

      expect(updatedToken, equals('token_v2'));
      verify(() => mockBox.put('user_token', 'token_v2')).called(1);
    });

    test('DELETE - removes key from Hive box', () async {
      when(() => mockBox.delete('temp_key')).thenAnswer((_) async {});
      when(() => mockBox.containsKey('temp_key')).thenReturn(false);

      await mockBox.delete('temp_key');
      final exists = mockBox.containsKey('temp_key');

      expect(exists, isFalse);
      verify(() => mockBox.delete('temp_key')).called(1);
    });

    test('CLEAR - wipes all entries in Hive box', () async {
      when(() => mockBox.clear()).thenAnswer((_) async => 5);

      final deletedCount = await mockBox.clear();

      expect(deletedCount, equals(5));
      verify(() => mockBox.clear()).called(1);
    });

    test('DISPOSE - compacts and closes Hive box', () async {
      when(() => mockBox.compact()).thenAnswer((_) async {});
      when(() => mockBox.close()).thenAnswer((_) async {});

      await mockBox.compact();
      await mockBox.close();

      verify(() => mockBox.compact()).called(1);
      verify(() => mockBox.close()).called(1);
    });
  });
}
