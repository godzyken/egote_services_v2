import 'package:egote_services_v2/features/auth/data/data_sources/database/source_base.dart';
import 'package:egote_services_v2/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/repository/user_repository.dart';
import '../presentation/controller/user_notifier.dart';
import 'data_sources/database/auth_user_database_impl.dart';

final usersDatabaseProvider = Provider<SourceBase>(
        (_) => AuthUserDatabaseImpl.instance);

final usersRepoProvider = Provider<UserRepositoryInterface>(
        (ref) => AuthRepositoryImpl(ref.watch(usersDatabaseProvider)),
  dependencies: [usersDatabaseProvider],
  name: 'User repository provider'
);

final userFutureProvider = FutureProvider.autoDispose(
        (ref) async {
  final response = usersDatabaseProvider.read(ref.container);
  ref.onDispose(() => response.close());

  final handler = usersRepoProvider.read(ref.container);
  ref.onDispose(() => handler.closeDatabase());

  final form = userFormStateNotifierProvider.notifier.select((value) => value.stream);
  form.select((value) => value.listen((event) {
    do {
      final entity = event.userEntityModel.toJson();
      response.insertUser(entity);
    } while (event.userEntityModel.name.isNotEmpty);
  }));
  ref.keepAlive();
  return response;
},
    dependencies: [
      usersDatabaseProvider,
      usersRepoProvider,
      userFormStateNotifierProvider],
    name: 'User future repository provider'
);