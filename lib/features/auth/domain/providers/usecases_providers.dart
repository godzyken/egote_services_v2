
import 'package:egote_services_v2/features/auth/data/data_source_providers.dart';
import 'package:egote_services_v2/features/auth/domain/usecases/usescases_extention.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserListUseCaseProvider = Provider<GetUserListCase>(
    (ref) => GetUserListCaseImpl(ref.watch(usersRepoProvider)),
  dependencies: [usersRepoProvider],
  name: 'Use Case Get Users List Entities'
);

final createUserUseCaseProvider = Provider<CreateUserCase>(
        (ref) => CreateUserCaseImpl(ref.watch(usersRepoProvider)),
    dependencies: [usersRepoProvider],
    name: 'Use Case create User'
);

final deleteUserUseCaseProvider = Provider<DeleteUserCase>(
        (ref) => DeleteUserCaseImpl(ref.watch(usersRepoProvider)),
    dependencies: [usersRepoProvider],
    name: 'Use Case Delete User'
);

final updateUserUseCaseProvider = Provider<UpdateUserCase>(
        (ref) => UpdateUserCaseImpl(ref.watch(usersRepoProvider)),
    dependencies: [usersRepoProvider],
    name: 'Use Case Update User'
);