# Decisions

## DEC-001 : Adoption de Supabase comme Backend principal
- **Date** : 2025
- **Décision** : Remplacer Firebase Firestore/Database par Supabase (PostgreSQL + PostGIS) pour la gestion relationnelle et spatiale (Construction 4.0).
- **Statut** : Validé.

## DEC-002 : Maintien de FCM pour les Push Notifications
- **Date** : 2025
- **Décision** : Conserver `firebase_messaging` spécifiquement pour la fiabilité des notifications push mobiles (Android/iOS).
- **Statut** : Validé.

## DEC-003 : Utilisation de Talker
- **Date** : 2025
- **Décision** : Intégrer Talker pour le logging centralisé et le debug Riverpod à travers tout l'écosystème.
- **Statut** : Validé.

## DEC-004 : Schéma SQL Unifié (Clients, Chantiers, Devis, RDV, Messages)
- **Date** : 2025
- **Décision** : Création de la migration `supabase/migrations/001_initial_schema.sql` intégrant PostGIS et RLS pour unifier le Hub et `emap_services`.
- **Statut** : Validé.

## DEC-005 : Déploiement Web sur Netlify via GitHub Actions
- **Date** : 2025
- **Décision** : Utiliser Netlify avec un fichier `netlify.toml` et un workflow GitHub Actions
  (`.github/workflows/ci.yml`) pour automatiser le build et le déploiement du Hub web.
- **Statut** : Validé.

## DEC-006 : Workflow de Pont Emap Services ➔ Egote Services (Hub)
- **Date** : 2025
- **Décision** : Ne pas modifier les structures existantes d'Emap Services ou d'Egote Services, mais établir un workflow métier où un devis validé dans Emap Services déclenche automatiquement la création d'un projet/chantier dans Egote Services, permettant au client/artisan d'assurer le suivi et le pilotage via les outils du Hub.
- **Statut** : Validé.

## DEC-007 : Automatisation par Trigger PostgreSQL (Devis ➔ Chantier)
- **Date** : 2025
- **Décision** : Implémenter un trigger PostgreSQL (`supabase/migrations/002_devis_to_chantier_trigger.sql`) qui convertit automatiquement un devis validé (`status = 'accepted'`) en un chantier/projet actif, garantissant un découplage total entre le code des applications et la logique métier de la base de données.
- **Statut** : Validé.

## DEC-008 : Observateur Riverpod Personnalisé basé sur Talker
- **Date** : 2025
- **Décision** : Implémenter `TalkerProviderObserver` en s'appuyant sur le package `talker` (version 4.4.0) pour assurer un logging réactif des providers Riverpod sans conflit de dépendances avec les écosystèmes tiers.
- **Statut** : Validé.

## DEC-009 : Service de Notifications Multicanal & Bridge Realtime
- **Date** : 2025
- **Décision** : Implémenter `NotificationBridgeService` connecté au Realtime Supabase pour écouter les événements de devis, rendez-vous et messages, couplé à un guide d'intégration Brevo SMTP / Supabase Edge Functions pour la distribution e-mail.
- **Statut** : Validé.

## DEC-010 : Ajustement de la version de `sign_in_with_apple` pour compatibilité Dart SDK 3.7

- **Date** : 2026
- **Décision** : Rétroer `sign_in_with_apple` à la version `^6.1.0` pour assurer une compatibilité
  parfaite avec l'environnement Dart SDK `>=3.7.0 <4.0.0` utilisé par Flutter 3.29.x dans le
  pipeline CI/CD GitHub Actions.
- **Statut** : Validé.

## DEC-011 : Nettoyage préalable de `packages/shared_models` dans le workflow CI

- **Date** : 2026
- **Décision** : Ajouter `rm -rf packages/shared_models` avant l'étape de clonage Git dans le
  workflow GitHub Actions (`.github/workflows/ci.yml`) pour garantir l'idempotence et éviter
  l'erreur `fatal: destination path 'packages/shared_models' already exists`.
- **Statut** : Validé.

## DEC-012 : Isolation des Providers et Politiques de Démarrage (`BootPolicy`)

- **Date** : 2026
- **Décision** : Introduire une énumération `BootPolicy` (`blocking`, `nonBlocking`) et un wrapper
  sécurisé `initProviderSafely` pour l'initialisation des providers dans `initializeProvider`. Cela
  permet d'expliciter la criticité de chaque service au démarrage (Web vs Mobile), d'éliminer les
  erreurs silencieuses et d'assurer une journalisation structurée sans compromettre la stabilité de
  l'application.
- **Statut** : Validé.

## DEC-013 : Implémentation du Concurrency Guard avec `SyncNotifier`

- **Date** : 2026
- **Décision** : Introduire une classe `SyncNotifier` et `SyncState` basée sur Riverpod pour gérer
  la synchronisation des données (offline/online) avec un verrou de concurrence (*mutex guard*)
  intégré. Cela empêche les exécutions superposées de tâches de synchronisation et assure un suivi
  transparent des états (`idle`, `syncing`, `success`, `error`) sans erreurs silencieuses.
- **Statut** : Validé.
