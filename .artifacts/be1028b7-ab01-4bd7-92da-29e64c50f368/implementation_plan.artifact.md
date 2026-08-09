# Project Repair and Migration Plan

Repair the project by fixing dependency conflicts, migrating to Riverpod 3 (`NotifierProvider`), reconnecting ConnectyCube SDK, and removing temporary rescue code.

## User Review Required

> [!IMPORTANT]
> The migration to Riverpod 3 involves changing `StateProvider` to `NotifierProvider`. This changes how state is accessed and modified in the UI (e.g., `ref.read(provider.notifier).state = ...` vs `ref.read(provider.notifier).update(...)`).

> [!WARNING]
> Removing "rescue" code will restore full dependency on ConnectyCube SDK. Ensure the environment variables (AppId, AuthKey, etc.) are correctly configured in the environment JSON files.

## Proposed Changes

### [Core Configuration]

#### [MODIFY] [pubspec.yaml](file:///C:/Users/soufi/StudioProjects/egote_services_v2/pubspec.yaml)
- Remove `intl: ^0.19.0` from `dependency_overrides` to fix the `flutter_localizations` conflict.
- Verify `connectycube_sdk` version.

### [Riverpod 3 Migration]

#### [MODIFY] [used_key_value_db_provider.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/common/application/controllers/used_key_value_db_provider.dart)
- Convert `StateProvider` to `NotifierProvider`.

#### [MODIFY] [drawer_width_provider.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart)
- Convert `StateProvider` to `NotifierProvider`.

#### [MODIFY] [app.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/app.dart)
- Update `MyApp` to use the new `NotifierProvider` syntax for `drawerWidthProvider`.
- Reconnect `connectivityStateSubscription` and `CubeChatConnection` logic.

### [ConnectyCube Reconnection & Rescue Code Removal]

#### [MODIFY] [providers.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/config/providers.dart)
- Remove `CubeDialogMig` and `CubeUserMig` imports and usages.
- Restore `connectycube_sdk` imports.
- Re-enable commented-out initializations in `initializeProvider`.
- Remove hardcoded values (like `'1335'`).
- Fix `ChatDialogScreen` instantiation to correctly pass `CubeDialog`.

#### [MODIFY] [cube_providers.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/config/providers/cube/cube_providers.dart)
- Re-enable `CubeChatConnection` related providers.

#### [DELETE] [cube_user_mig.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/domain/models/entities/cube_user/cube_user_mig.dart)
- Remove the mock user model.

#### [DELETE] [cube_dialog_mig.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/domain/models/entities/cube_dialog/cube_dialog_mig.dart)
- Remove the mock dialog model.

### [UI Repairs]

#### [MODIFY] [chat_dialog_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/presentation/views/screens/chat_dialog_screen.dart)
- Update to use `CubeUser` and `CubeDialog` from the SDK.

#### [MODIFY] [select_dialog_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/presentation/views/screens/select_dialog_screen.dart)
- Update to use `CubeUser` and `CubeDialog` from the SDK.

## Verification Plan

### Automated Tests
- Run `flutter pub get` to verify dependency resolution.
- Run `dart run build_runner build --delete-conflicting-outputs` to verify code generation.
- Run existing unit tests if applicable.

### Manual Verification
- Launch the app and verify the Chat feature reconnects correctly.
- Check the settings and drawer to ensure Riverpod 3 providers are working.
- Verify the UI displays correctly on both Android and iOS (if applicable).
