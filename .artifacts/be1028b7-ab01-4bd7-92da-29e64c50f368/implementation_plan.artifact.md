# Implementation Plan - Fix Assets and Code Generation

Fix the broken code generation for assets models and ensure all asset subdirectories are correctly declared in `pubspec.yaml`. Additionally, provide a Python script for image compression.

## User Review Required

> [!IMPORTANT]
> Some images referenced in `LocalImages` (under `assets/lottie/models/`) appear to be missing from the physical file system. This plan fixes the configuration to access existing files but cannot restore files that were not cloned or are missing from the repo.

## Proposed Changes

### [Build Configuration]

#### [MODIFY] [build.yaml](file:///C:/Users/soufi/StudioProjects/egote_services_v2/build.yaml)
- Add `lib/config/app_shared/images/*.dart` to the `json_serializable` builder `generate_for` list to enable code generation for image models.

### [Asset Configuration]

#### [MODIFY] [pubspec.yaml](file:///C:/Users/soufi/StudioProjects/egote_services_v2/pubspec.yaml)
- Add missing subdirectories to the `assets` list:
    - `assets/lottie/archive/amenagement/exterieur/piscines/`
    - `assets/lottie/image/` (already there, but ensuring consistency)
    - Ensure `assets/json/` and `assets/fonts/` are correctly mapped if needed (though they are already in the root assets list).

### [Code Repair]

#### [MODIFY] [assets_images.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/config/app_shared/images/assets_images.dart)
- Switch from `@Freezed()` to `@freezed` for consistency and better integration with `json_serializable`.

### [Automation Tools]

#### [NEW] [compress_images.py](file:///C:/Users/soufi/StudioProjects/egote_services_v2/scripts/compress_images.py)
- Create a Python script using the `Pillow` library to recursively compress PNG and JPG images in the `assets/` directory.

## Verification Plan

### Automated Tests
- Run `flutter pub get`.
- Run `dart run build_runner build --delete-conflicting-outputs`.
- Verify that `assets_images.g.dart` is generated without errors.

### Manual Verification
- Check if images in subdirectories (like `piscine_sussargue_1.jpg`) are now accessible in the app.
- Run the Python script (requires `pip install Pillow`) and verify file size reduction.
