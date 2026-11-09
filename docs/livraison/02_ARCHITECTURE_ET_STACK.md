# Architecture Technique & Stack - egote_services_v2

## 1. Vue d'Ensemble de l'Architecture

`egote_services_v2` repose sur une architecture propre (*Clean Architecture*) et modulaire,
favorisant la séparation des préoccupations entre la couche présentation (UI), la couche
application/domain (logique métier) et la couche infrastructure (données et API).

```
lib/
├── config/             # Configuration globale (routes GoRouter, environnements, flavors, providers init)
├── features/           # Modules fonctionnels par domaine (auth, chantier, chat, settings, theme, devis)
│   ├── auth/
│   ├── chantier/
│   ├── chat/
│   ├── settings/
│   └── theme/
├── l10n/               # Internationalisation (localize, arb)
├── app.dart            # Widget racine de l'application
└── main.dart           # Points d'entrée (flavors)
```

---

## 2. Pile Technologique Détaillée

### A. Framework & UI

- **Flutter** (SDK stable récent, Material 3).
- **FlexColorScheme** : Moteur de thématisation avancé permettant le basculement dynamique entre
  thèmes clairs et sombres, avec des options de seed color et de niveaux de surface.

### B. Gestion d'État & Injection de Dépendances

- **Riverpod** : Utilisé pour la gestion d'état réactive et l'injection de dépendances sans
  boilerplate excessif.
- **Notifiers / AsyncNotifiers** : Remplacement des anciens `StateNotifier` pour une gestion moderne
  et typée des états synchrones et asynchrones.
- **Talker & Talker Riverpod Logger** : Centralisation complète des logs applicatifs, interception
  des mises à jour de providers et journalisation structurée des erreurs en console et vers
  Sentry/Datadog.

### C. Navigation & Routing

- **GoRouter** : Routing déclaratif basé sur une architecture modulaire (*AppModule*), permettant
  l'intégration transparente de sous-modules ERP.

### D. Persistance & Stockage Local

- **Interface `KeyValueDb`** : Abstraction de stockage clé-valeur permettant d'interchanger
  dynamiquement l'implémentation sous-jacente :
    - `KeyValueDbHive` : Stockage local haute performance avec adaptateurs Hive typés pour les
      énumérations et objets graphiques.
    - `KeyValueDbPrefs` : Stockage basé sur SharedPreferences.
    - `KeyValueDbMem` : Stockage volatile en mémoire.

### E. Backends & Services Cloud

- **Supabase** : Base de données relationnelle et spatiale (PostgreSQL + PostGIS), authentification,
  et synchronisation en temps réel (*Realtime*).
- **Firebase** : Utilisé pour les notifications push (`firebase_messaging`), l'authentification et
  les options de plateforme.
- **ConnectyCube SDK** : Gestion de la messagerie instantanée, des salons de discussion par chantier
  et des appels audio/vidéo.
- **Monitoring** : Sentry (suivi des erreurs et traces de performance) & Datadog (RUM et logs de
  production).
