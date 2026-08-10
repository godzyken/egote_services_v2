# Plan de Migration Routing Manuel et Modulaire (Version Finale)

Ce plan détaille la suppression de `riverpod_generator` et `go_router_builder` pour passer à une architecture manuelle et extensible, permettant d'injecter dynamiquement des modules comme `bat_track_v1` et `Compta4me`.

## Changements Majeurs

1.  **Suppression de la génération de code** : Retrait des annotations `@riverpod`, `@TypedGoRoute`, et des fichiers `.g.dart` associés.
2.  **Architecture Modulaire** : Introduction d'une interface `AppModule` pour centraliser les routes de chaque sous-application.
3.  **Providers Manuels** : Déclaration explicite des Providers Riverpod.

## Proposed Changes

### 1. Fondations Modulaires
#### [NEW] `lib/config/routes/app_module.dart`
- Définition de l'interface `AppModule` :
  ```dart
  abstract class AppModule {
    List<RouteBase> get routes;
    // On pourra ajouter ici des listeners ou des middleware spécifiques au module plus tard
  }
  ```

### 2. Router Notifier (Riverpod Manuel)
#### [MODIFY] `lib/config/routes/router_notifier.dart`
- Retrait de `@riverpod` et `part 'router_notifier.g.dart'`.
- Déclaration manuelle : `final appRouterNotifierProvider = NotifierProvider<AppRouterNotifier, void>(AppRouterNotifier.new);`.
- La classe héritera de `Notifier<void>`.

### 3. Routes (GoRouter Manuel)
#### [MODIFY] `lib/config/routes/routes.dart`
- Retrait de `part 'routes.g.dart'`.
- Conversion de toutes les classes `GoRouteData` en fonctions ou constantes retournant des `GoRoute` / `ShellRoute`.
- Organisation des routes par domaine (Auth, Home, Devis, Settings, Chat).

### 4. Configuration du Router Central
#### [MODIFY] `lib/config/routes/router.dart`
- Déclaration manuelle : `final goRouterProvider = Provider<GoRouter>((ref) => ...);`.
- Assemblage des routes :
  ```dart
  final allRoutes = [
    ...AuthRoutes.routes,
    ...HomeRoutes.routes,
    ...DevisRoutes.routes,
    // Futurs branchements :
    // ...BatTrackModule().routes,
    // ...Compta4meModule().routes,
  ];
  ```

### 5. Nettoyage
- Suppression physique des fichiers :
    - `lib/config/routes/router.g.dart`
    - `lib/config/routes/router_notifier.g.dart`
    - `lib/config/routes/routes.g.dart`
- Mise à jour de `pubspec.yaml` pour retirer les générateurs du `dev_dependencies` si plus utilisés ailleurs.

## Verification Plan

### Automated Tests
- Lancer `dart analyze` pour valider la structure des types et des providers.
- Vérifier que les redirections (Guard d'authentification) fonctionnent toujours manuellement.

### Manual Verification
- Navigation complète dans l'application : Login -> Home -> Devis -> Chat.
- Test du changement de thème et de langue pour vérifier que le `refreshListenable` du router réagit bien au `appRouterNotifierProvider`.
