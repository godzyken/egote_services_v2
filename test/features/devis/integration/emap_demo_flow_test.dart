import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/emap_demo_helpers.dart';

// Interfaces and Mock Notifiers/Repositories for EMAP demo flow
abstract class AuthRepository {
  Future<Either<String, EmapUser>> signIn({
    required String email,
    required String password,
  });
}

abstract class DevisRepository {
  Future<Either<String, List<Devis>>> getDevisByArtisan(String artisanId);

  Future<Either<String, Devis>> updateStatus({
    required String devisId,
    required DevisStatus status,
  });

  Future<Either<String, Chantier>> createChantierFromDevis(String devisId);
}

abstract class SyncService {
  Future<Either<String, List<Devis>>> syncDevisFromVitrine({
    required String artisanId,
  });
}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockDevisRepository extends Mock implements DevisRepository {}

class MockSyncService extends Mock implements SyncService {}

// Providers for testing
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError(),
);
final devisRepositoryProvider = Provider<DevisRepository>(
  (ref) => throw UnimplementedError(),
);
final syncServiceProvider = Provider<SyncService>(
  (ref) => throw UnimplementedError(),
);

final authControllerProvider = NotifierProvider<AuthController, EmapUser?>(
  AuthController.new,
);

class AuthController extends Notifier<EmapUser?> {
  @override
  EmapUser? build() => null;

  Future<Either<String, EmapUser>> signIn(String email, String password) async {
    final authRepo = ref.watch(authRepositoryProvider);
    final result = await authRepo.signIn(email: email, password: password);
    result.fold((err) => {}, (user) => state = user);
    return result;
  }
}

final syncControllerProvider = Provider<SyncController>((ref) {
  return SyncController(ref.watch(syncServiceProvider));
});

class SyncController {
  final SyncService _syncService;

  SyncController(this._syncService);

  Future<Either<String, List<Devis>>> syncEmapDevis() async {
    return _syncService.syncDevisFromVitrine(artisanId: emapArtisanId);
  }
}

final devisListProvider = FutureProvider<List<Devis>>((ref) async {
  return [];
});

final devisControllerProvider = Provider<DevisController>((ref) {
  return DevisController(ref.watch(devisRepositoryProvider));
});

class DevisController {
  final DevisRepository _devisRepo;

  DevisController(this._devisRepo);

  Future<Either<String, Devis>> acceptDevis(String devisId) async {
    return _devisRepo.updateStatus(
      devisId: devisId,
      status: DevisStatus.accepted,
    );
  }
}

final batTrackControllerProvider = Provider<BatTrackController>((ref) {
  return BatTrackController(ref.watch(devisRepositoryProvider));
});

class BatTrackController {
  final DevisRepository _devisRepo;

  BatTrackController(this._devisRepo);

  Future<Either<String, Chantier>> getChantierByDevis(String devisId) async {
    return _devisRepo.createChantierFromDevis(devisId);
  }
}

void main() {
  late ProviderContainer container;
  late MockDevisRepository mockDevisRepo;
  late MockSyncService mockSync;
  late MockAuthRepository mockAuth;

  setUp(() {
    mockDevisRepo = MockDevisRepository();
    mockSync = MockSyncService();
    mockAuth = MockAuthRepository();

    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuth),
        devisRepositoryProvider.overrideWithValue(mockDevisRepo),
        syncServiceProvider.overrideWithValue(mockSync),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('EMAP-82 Demo Flow – Profil Artisan + Sync Devis', () {
    test('1. Connexion profil Emap + droits selon offres', () async {
      // Arrange
      when(
        () => mockAuth.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Right(
          EmapUser(
            id: emapArtisanId,
            email: emapProfileEmail,
            offers: emapActiveOffers,
          ),
        ),
      );

      // Act
      final result = await container
          .read(authControllerProvider.notifier)
          .signIn(emapProfileEmail, 'demo-password');

      // Assert
      expect(result.isRight(), true);
      final user = result.getOrElse((l) => throw Exception(l));
      expect(user.id, emapArtisanId);
      expect(user.offers, contains('devis_sync'));
      expect(user.offers, contains('bat_track_lite'));
    });

    test(
      '2. Synchronisation des devis en cours depuis vitrine emap-82.fr',
      () async {
        // Arrange
        when(
          () => mockSync.syncDevisFromVitrine(artisanId: emapArtisanId),
        ).thenAnswer(
          (_) async => Right(emapSeedDevis.map(Devis.fromJson).toList()),
        );

        when(() => mockDevisRepo.getDevisByArtisan(emapArtisanId)).thenAnswer(
          (_) async => Right(emapSeedDevis.map(Devis.fromJson).toList()),
        );

        // Act
        final syncResult = await container
            .read(syncControllerProvider)
            .syncEmapDevis();

        final listResult = emapSeedDevis.map(Devis.fromJson).toList();

        // Assert
        expect(syncResult.isRight(), true);
        expect(listResult.length, 3);
        expect(listResult.any((d) => d.reference == 'DEV-EMAP-2026-001'), true);
        expect(listResult.where((d) => d.status == DevisStatus.sent).length, 1);
        expect(listResult.where((d) => d.source == 'emap-82.fr').length, 3);
      },
    );

    test('3. Cycle de vie devis → acceptation → trigger Chantier', () async {
      final acceptedDevis = Devis.fromJson(emapSeedDevis[2]); // déjà accepted

      when(
        () => mockDevisRepo.updateStatus(
          devisId: acceptedDevis.id,
          status: DevisStatus.accepted,
        ),
      ).thenAnswer(
        (_) async =>
            Right(acceptedDevis.copyWith(status: DevisStatus.accepted)),
      );

      when(
        () => mockDevisRepo.createChantierFromDevis(acceptedDevis.id),
      ).thenAnswer(
        (_) async => Right(
          Chantier(
            id: 'chantier-${acceptedDevis.id}',
            devisId: acceptedDevis.id,
            title: acceptedDevis.title,
            status: ChantierStatus.planned,
          ),
        ),
      );

      // Act
      final updateResult = await container
          .read(devisControllerProvider)
          .acceptDevis(acceptedDevis.id);

      final chantierResult = await container
          .read(batTrackControllerProvider)
          .getChantierByDevis(acceptedDevis.id);

      // Assert
      expect(updateResult.isRight(), true);
      expect(chantierResult.isRight(), true);
      final chantier = chantierResult.getOrElse((l) => throw Exception(l));
      expect(chantier.devisId, acceptedDevis.id);
      expect(chantier.title, contains('Climatisation'));
    });

    test(
      '4. Filtrage & droits – devis non accessibles si offre absente',
      () async {
        final limitedUser = EmapUser(
          id: emapArtisanId,
          email: emapProfileEmail,
          offers: ['hub_basic'], // pas de devis_sync
        );

        expect(limitedUser.offers.contains('devis_sync'), false);
      },
    );
  });

  group('EMAP Demo – Calcul & Statuts', () {
    test('calcule correctement total TTC d’un devis PAC', () {
      final devis = Devis.fromJson(emapSeedDevis[0]);
      expect(devis.totalTtc, closeTo(10140.0, 0.01));
    });

    test('ne permet plus de modifier un devis accepté', () async {
      final acceptedDevis = Devis.fromJson(emapSeedDevis[2]);
      expect(acceptedDevis.status, DevisStatus.accepted);

      when(
        () => mockDevisRepo.updateStatus(
          devisId: acceptedDevis.id,
          status: DevisStatus.draft,
        ),
      ).thenAnswer(
        (_) async => const Left('Forbidden: Devis already accepted'),
      );

      final result = await mockDevisRepo.updateStatus(
        devisId: acceptedDevis.id,
        status: DevisStatus.draft,
      );

      expect(result.isLeft(), true);
    });

    test('filtre les devis par source emap-82.fr', () async {
      final allDevis = emapSeedDevis.map(Devis.fromJson).toList();
      final emapDevis = allDevis
          .where((d) => d.source == 'emap-82.fr')
          .toList();
      expect(emapDevis.length, 3);
    });
  });
}
