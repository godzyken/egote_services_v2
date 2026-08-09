# Tasks

- `[x]` Fix `pubspec.yaml` dependency conflict
- `[x]` Migration to Riverpod 3 (`NotifierProvider`)
    - `[x]` Update `lib/app.dart` usage of `drawerWidthProvider`
    - `[x]` Identify and migrate any remaining `StateProvider`/`StateNotifierProvider`
- `[x]` Reconnect ConnectyCube and remove "Rescue" code
    - `[x]` Restore `lib/config/providers.dart` initializations
    - `[x]` Replace `CubeUserMig` with `CubeUser` in all files
    - `[x]` Replace `CubeDialogMig` with `CubeDialog` in all files
    - `[x]` Remove mock entity files
- `[x]` Repair UI and Screens
- `[x]` Verify with code generation and build
