# Plan de Consolidation : "Batterie Complète de Tests et Failures"

Ce plan définit une stratégie exhaustive pour couvrir 100% de la logique métier (domain et application) et de l'infrastructure via des tests unitaires et une gestion d'erreurs robuste.

## User Review Required

> [!IMPORTANT]
> L'objectif est d'atteindre une couverture maximale sur les dossiers `lib/features`. Les tests UI (widgets) seront limités aux composants ayant une logique complexe. Les dépendances externes (Supabase, Firebase, SDK ConnectyCube) seront systématiquement mockées.

## Proposed Changes

### 1. Domain : Gestion des Erreurs et Entités
#### [MODIFY] `lib/features/common/domain/failures/failure.dart`
- Expansion de la classe `Failure` pour inclure :
    - `serverError` : Erreurs API 500+.
    - `networkError` : Absence d'internet ou timeout.
    - `cacheError` : Erreur de lecture/écriture locale.
    - `tooManyRequests` : Rate limiting.
    - `permissionDenied` : Droits insuffisants.
    - `invalidCredentials` : Erreur auth spécifique.
- Ajout d'un message descriptif pour chaque type.

#### [NEW] `test/features/common/domain/failures/failure_test.dart`
- Vérifier que chaque type de failure retourne le bon message et type.

#### [NEW] `test/features/auth/domain/entities/user_entity_test.dart`
- Tests des factories `fromFirestore`, `create`, `empty`.

### 2. Infrastructure : Repositories
#### [NEW] `test/features/auth/infrastructure/auth_repository_test.dart`
- Tests exhaustifs de `AuthRepository` (Sign in, Sign up, Sign out, OTP verification).
#### [NEW] `test/features/chat/infrastructure/cube_repository_test.dart`
- Tests de `CubeRepository` (Sessions, Social Login, Upload).
#### [NEW] `test/features/chat/infrastructure/cube_user_repository_test.dart`
- Tests de `CubeUserRepository` (CRUD complet).

### 3. Application : Notifiers et Controllers
#### [NEW] `test/features/auth/application/auth_controller_notifier_test.dart`
- Tester le changement d'état (`AuthState`) en fonction des événements du `onAuthStateChange`.
#### [NEW] `test/features/chat/application/cube_user_controller_test.dart`
- Tester la gestion de l'état de l'utilisateur ConnectyCube.
#### [MODIFY] `test/features/devis/application/devis_usecase_test.dart`
- Compléter les tests pour couvrir les calculs de prix et la validation des devis.

### 4. Routing
#### [NEW] `test/config/routes/router_notifier_test.dart`
- Vérifier que `notifyListeners` est bien appelé lors des changements d'état.

## Verification Plan

### Automated Tests
- Commande : `flutter test --coverage`
- Analyse de la couverture via `lcov`.
- Vérifier qu'aucun test ne dépend d'une connexion internet réelle.

### Manual Verification
- Simulation d'erreurs réseau pour vérifier que les nouvelles `Failure` sont bien capturées et affichées.
