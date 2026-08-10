# Walkthrough: Manuel & Modular Routing Migration

J'ai migré le système de routing vers une architecture manuelle et modulaire, supprimant les dépendances aux générateurs pour cette partie.

## Changements Principaux

### 1. Architecture Écosystème
- **`AppModule`** : Création d'une interface de base pour permettre à n'importe quel futur module (ex: `bat_track_v1`, `Compta4me`) d'injecter ses propres routes de manière isolée.
- **`CoreModule`** : Centralisation des routes existantes de l'application principale dans une classe modulaire.

### 2. Migration Riverpod (Manuel)
- **`AppRouterNotifier`** : Conversion en un `NotifierProvider` manuel dans `router_notifier.dart`. Ce notifier sert de source de rafraîchissement (`Listenable`) pour GoRouter.
- **`goRouterProvider`** : Déclaré manuellement dans `router.dart`. Il assemble désormais les routes provenant de tous les modules actifs.

### 3. Migration GoRouter (Manuel)
- Suppression de `go_router_builder` et des annotations `@TypedGoRoute`.
- Toutes les routes sont désormais définies via des instances de `GoRoute` standards, ce qui facilite la concaténation dynamique des routes de différents packages/modules.
- Mise à jour de `lib/l10n/` pour assurer la génération correcte des localisations sans dépendre de l'ancien flag global de génération automatique qui entrait parfois en conflit.

### 4. Stabilization du Code
- Correction de nombreuses entités **Freezed** qui causaient des erreurs de "Missing concrete implementation" en les déclarant explicitement comme `abstract`.
- Migration du modèle `AuthUser` vers le nouveau modèle `User` de Supabase dans les convertisseurs et contrôleurs d'authentification.
- Correction des conflits de noms de providers entre `router.dart` et `providers.dart`.

## Vérification effectuée
- Nettoyage des fichiers générés obsolètes (`*.g.dart` liés au routing).
- Exécution de `build_runner` pour valider les modèles de données restants.
- Analyse statique du code.

> [!TIP]
> Pour ajouter une nouvelle application à l'écosystème, créez une classe implémentant `AppModule` et ajoutez ses routes dans le tableau `allRoutes` du fichier `lib/config/routes/router.dart`.
