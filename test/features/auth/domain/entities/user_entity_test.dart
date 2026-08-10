import 'package:flutter_test/flutter_test.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';

void main() {
  group('UserEntityModel', () {
    test('should create an empty UserEntityModel', () {
      final user = UserEntityModel.empty();
      expect(user.id.value, 0);
      expect(user.name, '');
      expect(user.isComplete, false);
    });

    test('should create a new UserEntityModel with create factory', () {
      final now = DateTime.now();
      final user = UserEntityModel.create(
        'Test User',
        'admin',
        true,
        now,
        now,
        null,
        null,
        null,
      );
      
      expect(user.name, 'Test User');
      expect(user.role, 'admin');
      expect(user.isComplete, true);
    });

    test('complete() should return a model with isComplete true', () {
      final user = UserEntityModel.empty().complete();
      expect(user.isComplete, true);
    });

    test('uncomplete() should return a model with isComplete false', () {
      final user = UserEntityModel.empty().complete().uncomplete();
      expect(user.isComplete, false);
    });
  });

  group('UserModel', () {
    test('create() factory should return an uncomplete model', () {
      final id = const UserId(value: 123);
      final userModel = UserModel.create(
        id: id,
        email: 'test@example.com',
        name: 'Test Name',
      );

      expect(userModel.id, id);
      expect(userModel.maybeWhen(
        unComplete: (id, model, auth) => true,
        orElse: () => false,
      ), true);
    });
  });
}
