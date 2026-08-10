import 'package:flutter_test/flutter_test.dart';
import 'package:egote_services_v2/features/chat/infrastructure/repositories/cube_user_repository.dart';

void main() {
  late CubeUserRepository repository;

  setUp(() {
    repository = CubeUserRepository();
  });

  group('CubeUserRepository', () {
    test('initialization', () {
      expect(repository, isNotNull);
    });
  });
}
