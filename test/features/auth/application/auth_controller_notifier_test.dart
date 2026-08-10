import 'package:egote_services_v2/features/auth/presentation/states/auth/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/auth_controller_state.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class MockAuthRepository extends Mock implements AuthRepository {}
class MockGoTrueClient extends Mock implements supabase.GoTrueClient {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockGoTrueClient mockGoTrueClient;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockGoTrueClient = MockGoTrueClient();
    
    when(() => mockAuthRepository.authClient).thenReturn(mockGoTrueClient);
    when(() => mockGoTrueClient.onAuthStateChange).thenAnswer((_) => const Stream.empty());
  });

  ProviderContainer makeContainer() {
    return ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
      ],
    );
  }

  group('AuthControllerNotifier', () {
    test('initial state should be unauthenticated', () {
      final container = makeContainer();
      final state = container.read(authStateProvider);
      
      expect(state.maybeWhen(
        unauthenticated: () => true,
        orElse: () => false,
      ), true);
    });
  });
}
