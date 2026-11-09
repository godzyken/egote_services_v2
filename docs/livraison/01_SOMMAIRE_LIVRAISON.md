# Dossier de Livraison Officiel - egote_services_v2 (Hub Construction 4.0)

## 1. Informations Générales de Livraison

- **Nom du Projet** : `egote_services_v2` (Hub Construction 4.0)
- **Version** : 2.0.0 (Release Candidate / Production Ready)
- **Date de Livraison** : 2026
- **Écosystème Cible** : Web, Mobile (Android / iOS), Desktop
- **Auteur / Équipe** : Équipe de Développement Principal (`egote_services_v2`)

---

## 2. Contenu du Dossier de Livraison

Ce dossier de livraison regroupe l'ensemble des éléments techniques, architecturaux, de test et
d'exploitation nécessaires pour la prise en main, le déploiement et la maintenance de la
plateforme :

1.
**[01_SOMMAIRE_LIVRAISON.md](file:///C:/Users/soufi/StudioProjects/egote_services_v2/docs/livraison/01_SOMMAIRE_LIVRAISON.md)** :
Sommaire et vue d'ensemble de la livraison.
2.
**[02_ARCHITECTURE_ET_STACK.md](file:///C:/Users/soufi/StudioProjects/egote_services_v2/docs/livraison/02_ARCHITECTURE_ET_STACK.md)** :
Description détaillée de l'architecture technique, des choix de design et des patterns utilisés.
3.
**[03_GUIDE_INSTALLATION_ET_DEPLOIEMENT.md](file:///C:/Users/soufi/StudioProjects/egote_services_v2/docs/livraison/03_GUIDE_INSTALLATION_ET_DEPLOIEMENT.md)** :
Guide pas à pas pour l'installation locale, la configuration des environnements et le déploiement
CI/CD.
4.
**[04_RAPPORT_TESTS_ET_STABILITE.md](file:///C:/Users/soufi/StudioProjects/egote_services_v2/docs/livraison/04_RAPPORT_TESTS_ET_STABILITE.md)** :
Bilan des tests unitaires (83/83 validés) et rapport de résolution des anomalies Web (minification
Dart2JS, gestion des environnements et résilience des bases locales).
5.
**[05_MANUEL_UTILISATION.md](file:///C:/Users/soufi/StudioProjects/egote_services_v2/docs/livraison/05_MANUEL_UTILISATION.md)** :
Guide fonctionnel des parcours utilisateurs (Authentification, MFA, Chantiers, Chat ConnectyCube,
Paramètres de thèmes).

---

## 3. Synthèse des Modules Livrés

- **Socle & Routing** : GoRouter modulaire avec injection dynamique de modules (`AppModule`).
- **Gestion d'État** : Riverpod (Notifiers / AsyncNotifiers) avec observateur Talker
  (`TalkerRiverpodObserver`) et journalisation avancée.
- **Backends** :
    - **Supabase** (PostgreSQL + PostGIS, Auth, Realtime).
    - **Firebase** (Cloud Messaging FCM, Auth secondaire).
    - **ConnectyCube** (Chat chantiers temps réel).
- **Stockage Local** : Double implémentation interchangeable (`KeyValueDbHive` avec adaptateurs de
  type personnalisés et `KeyValueDbPrefs` via SharedPreferences) avec gardes d'initialisation
  robustes.
