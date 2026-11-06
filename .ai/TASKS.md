# Tasks

## Terminé
- [x] Initialisation du système d'agents .ai et documentation de la roadmap.
- [x] Création du schéma SQL de migration Supabase (`supabase/migrations/001_initial_schema.sql`).
- [x] Configuration Netlify (`netlify.toml`) et Pipeline CI/CD GitHub Actions
  (`.github/workflows/ci.yml`).
- [x] Audit fonctionnel d'Egote Services (Hub) et définition du workflow de pont avec Emap Services (Devis validé ➔ Projet Egote Services).
- [x] Implémentation du trigger SQL Supabase (`supabase/migrations/002_devis_to_chantier_trigger.sql`) pour l'automatisation de la transformation Devis ➔ Chantier sans modifier les applications.
- [x] Intégration de Talker (`talker`, `talker_flutter`) et du `TalkerProviderObserver` pour le logging centralisé et le suivi Riverpod.
- [x] Implémentation du service de notifications multicanal en temps réel (`NotificationBridgeService`) et guide d'intégration e-mail Brevo/Supabase Edge Functions.

## En cours
- [none] Toutes les tâches de la roadmap de transformation sont complétées avec succès.
