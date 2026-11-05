# Stratégie de Migration vers une Version sans `build_runner` et Mise à Jour des APIs (ConnectyCube & ConnectivityPlus)

## 1. Analyse des Packages Clés

### ConnectyCube SDK (`connectycube_sdk ^3.0.3`)
- **Authentification & Sessions** : Remplacement des méthodes dépréciées (`signIn`, `signOut`, `signInByLogin`) par `createSession(user)`, `deleteSession()`, et `createSessionUsingFirebaseEmail(...)`.
- **Gestionnaire de Connexion** : Utilisation de `CubeSessionManager.instance.activeSession` et des gestionnaires de chat asynchrones.

### Connectivity Plus (`connectivity_plus ^7.3.1`)
- **API mise à jour** : La méthode `Connectivity().checkConnectivity()` retourne désormais une liste de résultats (`List<ConnectivityResult>`) au lieu d'un unique `ConnectivityResult`.
- **Vérification** :
  ```dart
  final connectivityResults = await Connectivity().checkConnectivity();
  if (connectivityResults.contains(ConnectivityResult.none)) {
    // Hors ligne
  }
  ```

---

## 2. Stratégie de Suppression de `build_runner` pour la Maintenabilité Long Terme

Pour s'affranchir complètement de `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`, `go_router_builder` et `flutter_gen`, voici les étapes de refactorisation :

### A. Modèles de Données & Entités (Remplacement de `Freezed` & `JsonSerializable`)
- **Actuel** : Classes annotées avec `@freezed` générant `.freezed.dart` et `.g.dart`.
- **Cible** : Classes Dart pures avec :
  - Constructeur standard et champs `final`.
  - Méthodes manuelles `fromJson(Map<String, dynamic> json)` et `toJson()`.
  - Méthode `copyWith(...)`.
  - Implémentation manuelle de `==` et `hashCode` (ou via package `equatable`).

### B. Providers Riverpod (Remplacement de `RiverpodGenerator`)
- **Actuel** : `@riverpod` générant des providers dans `.g.dart`.
- **Cible** : Déclaration explicite des providers :
  ```dart
  final authRepositoryProvider = Provider<AuthRepository>((ref) {
    return AuthRepository(...);
  });
  ```

### C. Routage GoRouter (Remplacement de `GoRouterBuilder`)
- **Actuel** : Routes typées générées par `go_router_builder`.
- **Cible** : Déclaration standard de `GoRouter` avec chemins en `String` :
  ```dart
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
  ```

### D. Gestion des Assets (Remplacement de `FlutterGen`)
- **Actuel** : Génération via `flutter_gen` (`Assets.images.foo`).
- **Cible** : Utilisation directe des chemins de chaînes de caractères :
  ```dart
  Image.asset('assets/images/foo.png')
  ```

---

## 3. Plan d'Action Recommandé
1. **Créer une branche dédiée** (`refactor/no-build-runner`).
2. **Migrer progressivement** module par module (ex: `features/auth`, puis `features/chat`, puis `features/devis`).
3. **Supprimer les dépendances de dev** `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`, `go_router_builder`, `flutter_gen_runner` du `pubspec.yaml`.
4. **Valider** l'absence d'erreurs d'analyse (`flutter analyze`) et le passage de tous les tests (`flutter test`).
