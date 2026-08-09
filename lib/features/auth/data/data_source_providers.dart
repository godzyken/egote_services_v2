import 'package:egote_services_v2/features/auth/data/data_sources/database/source_base.dart';
import 'package:egote_services_v2/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repository/user_repository_interface.dart';
import '../presentation/controller/user_notifier.dart';
import 'data_sources/database/auth_user_database_impl.dart';

// 1. Database Provider
final usersDatabaseProvider = Provider<SourceBase>(
      (ref) => AuthUserDatabaseImpl.instance,
  name: 'UsersDatabaseProvider',
);

// 2. Repository Provider
final usersRepoProvider = Provider<UserRepositoryInterface>(
      (ref) {
    final database = ref.watch(usersDatabaseProvider);
    return AuthRepositoryImpl(database);
  },
  name: 'UsersRepoProvider',
);

// 3. FutureProvider (Riverpod 3)
final userFutureProvider = FutureProvider<SourceBase>(
      (ref) async {
    // Conservation du state en mémoire si souhaité (remplace l'absence d'autoDispose)
    ref.keepAlive();

    final database = ref.watch(usersDatabaseProvider);
    final repository = ref.watch(usersRepoProvider);

    // Enregistrement des callbacks de nettoyage au dispose
    ref.onDispose(() {
      database.close();
      repository.closeDatabase();
    });

    // Écoute réactive des changements d'état du formulaire via ref.listen
    ref.listen(
      userFormStateNotifierProvider,
          (previous, next) {
        if (next.userEntityModel.name.isNotEmpty) {
          final entityJson = next.userEntityModel.toJson();
          database.insertUser(entityJson);
        }
      },
    );

    return database;
  },
  name: 'UserFutureProvider',
);