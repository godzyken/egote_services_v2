# Tasks: Battery of Tests and Failures Implementation

- `[x]` Enhance `Failure` domain class
    - `[x]` Add new failure types (`serverError`, `networkError`, etc.)
    - `[x]` Improve error message handling
- `[x]` Domain Tests
    - `[x]` `test/features/common/domain/failures/failure_test.dart`
    - `[x]` `test/features/auth/domain/entities/user_entity_test.dart`
- `[x]` Infrastructure Tests (Repositories)
    - `[x]` `test/features/auth/infrastructure/auth_repository_test.dart`
    - `[x]` `test/features/chat/infrastructure/cube_repository_test.dart`
    - `[x]` `test/features/chat/infrastructure/cube_user_repository_test.dart`
- `[x]` Application Tests (Notifiers & Controllers)
    - `[x]` `test/features/auth/application/auth_controller_notifier_test.dart`
    - `[x]` `test/features/chat/application/cube_user_controller_test.dart`
    - `[x]` `test/features/devis/application/devis_usecase_test.dart` (Enhancement)
- `[x]` Configuration Tests
    - `[x]` `test/config/routes/router_notifier_test.dart`
- `[/]` Final Verification (Run all tests)
