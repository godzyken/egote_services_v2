# Plan d'implémentation - Correction des erreurs de compilation et de logique

Ce plan vise à résoudre la longue liste d'erreurs de compilation signalées, allant des dépendances manquantes aux erreurs de syntaxe Freezed et aux problèmes de types Null-Safe.

## Changements proposés

### 1. Dépendances et Configuration

#### [MODIFY] [pubspec.yaml](file:///C:/Users/soufi/StudioProjects/egote_services_v2/pubspec.yaml)
- Ajouter `sign_in_with_apple: ^6.1.1` pour résoudre l'absence de `AppleIDAuthorizationScopes`.

#### [MODIFY] [auth_repository.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/infrastructure/repositories/auth_repository.dart)
- Ajouter l'import `package:sign_in_with_apple/sign_in_with_apple.dart`.

### 2. Correction Supabase et Riverpod

#### [MODIFY] [auth_controller_state.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/controller/auth_controller_state.dart)
- Corriger l'accès à `onAuthStateChange` : `_repository.authClient.onAuthStateChange` au lieu de `_repository.authClient.auth.onAuthStateChange`.

#### [MODIFY] [cube_settings_provider.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/application/providers/cube_settings_provider.dart)
- Utiliser `AsyncNotifierProvider` pour `CubeUserController` et `NotifierProvider` pour `FilterLoginTypeNotifier`.
- Corriger le type de retour de la closure `onSessionRestore` pour éviter de retourner `Null` quand un `Future<CubeSession>` est attendu.

### 3. Modèles Freezed et Génération de Code

#### [MODIFY] [user_form_state.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/states/user/user_form_state.dart)
- Corriger la syntaxe du constructeur factory (manque de virgule ou mauvais placement des paramètres).

#### [MODIFY] [auth_state.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/states/auth/auth_state.dart)
- Assurer que les types sont corrects pour la génération.

### 4. Corrections de Types (Null Safety)

#### [MODIFY] [user_list_view_model.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/views/models/userlist/user_list_view_model.dart)
- Utiliser des valeurs par défaut ou des assertions non-null pour les paramètres `DateTime` (ex: `lastSignInAt ?? now`).

#### [MODIFY] [sign_up_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/views/screens/connection/sign_up_screen.dart)
- Même correction pour les arguments `DateTime`.

### 5. Assets et UI

#### [MODIFY] [login_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/views/screens/connection/login_screen.dart) et [sign_up_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/views/screens/connection/sign_up_screen.dart)
- Remplacer `authProvider` par `authStateProvider`.

#### [MODIFY] [login_on_chat.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/presentation/views/screens/login_on_chat.dart)
- Supprimer ou corriger la référence à `logoTchat1022x1024` qui n'existe pas dans les assets générés.

#### [MODIFY] [verification_screen.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/auth/presentation/views/screens/mfa/verification_screen.dart)
- Supprimer `const` lors de l'instanciation de `UserModel` car `CubeUser()` n'est pas const.

### 6. Firebase et ConnectyCube

#### [MODIFY] [cube_repository.dart](file:///C:/Users/soufi/StudioProjects/egote_services_v2/lib/features/chat/infrastructure/repositories/cube_repository.dart)
- Gérer l'absence de `firebase_options.dart`. Si le fichier est manquant physiquement, nous devrons peut-être mocker `DefaultFirebaseOptions` ou le commenter temporairement pour permettre la compilation.

## Plan de vérification

### Tests automatisés
- `flutter pub get`
- `dart run build_runner build --delete-conflicting-outputs`
- `dart analyze`

### Vérification manuelle
- Vérifier que l'application se lance et que les écrans d'authentification fonctionnent.
