# Guide d'Installation & Déploiement - egote_services_v2

## 1. Prérequis Techniques

- **Flutter SDK** : `>=3.0.0` (recommandé : version stable récente).
- **Dart SDK** : Compatible avec l'environnement SDK du projet.
- **Git** pour le versioning.
- IDE recommandé : **Android Studio** ou **VS Code** avec les extensions Flutter/Dart.

---

## 2. Configuration Initiale & Environnements

### A. Fichiers de Configuration JSON

Les configurations par environnement (URLs Supabase, clés API Datadog, identifiants ConnectyCube)
sont stockées dans le dossier `assets/json/` :

- `assets/json/development.config.json`
- `assets/json/local.config.json`
- `assets/json/production.config.json`

Grâce à la classe utilitaire `Environment.load()`, si un fichier est absent ou si une redirection
SPA Web (ex: Netlify 404) est interceptée, l'application bascule automatiquement sur un profil de
développement par défaut en mémoire, évitant tout crash au démarrage.

### B. Commandes d'Installation

1. Cloner le dépôt et se placer à la racine du projet.
2. Récupérer les dépendances :
   ```bash
   flutter pub get
   ```
3. Générer les fichiers de code (Freezed / JSON serialization si modification des modèles) :
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

---

## 3. Exécution de l'Application

### A. En Local / Développement (Web)

Pour lancer l'application sur Chrome avec des symboles de débogage non minifiés et des stack traces
lisibles :

```bash
flutter run -d chrome
```

### B. Avec un Flavor Spécifique

```bash
flutter run --flavor development -t lib/main_development.dart
flutter run --flavor production -t lib/main_production.dart
flutter run --flavor local -t lib/main_local.dart
```

---

## 4. Déploiement CI/CD (Web / Netlify)

Le projet intègre un pipeline CI/CD automatisé via **GitHub Actions** (`.github/workflows/ci.yml`)
et **Netlify** (`netlify.toml`) :

- À chaque `git push` sur la branche principale, le workflow GitHub Actions valide le code, exécute
  les tests unitaires et compile l'application Web.
- Netlify déploie le build statique généré.
- Les règles de routage SPA (`/* /index.html 200`) sont configurées dans Netlify pour garantir le
  bon fonctionnement de GoRouter.
