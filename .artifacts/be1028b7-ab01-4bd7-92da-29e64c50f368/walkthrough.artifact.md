# Walkthrough: Resolution of TODOs

J'ai implémenté la majorité des fonctionnalités manquantes signalées par les `TODO` dans le code source de l'application.

## Changements Principaux

### 1. ConnectyCube (Chat & Utilisateurs)
- **Repositories** : Implémentation complète de `CubeRepository` et `CubeUserRepository`.
    - Ajout des méthodes de session : `createGuestUserSession`, `restoreSession`, `updateUserSession`.
    - Ajout du CRUD utilisateur : `createCubeUser`, `updateCubeUser`, `deleteCubeUser`, etc.
    - Correction de la déconnexion avec nettoyage des préférences locales.
- **Login Screen** : Réactivation et correction de la logique de connexion au chat dans `login_on_chat.dart`. Le flux supporte maintenant Login, Email et Phone.

### 2. Authentification & MFA
- **Verification Screen** : Correction du flux de validation MFA. La redirection vers `user_home` après validation fonctionne désormais correctement.
- **App Configuration** : Remplacement des placeholders statiques par une configuration Firebase dynamique (`DefaultFirebaseOptions`) pour la session de chat.

### 3. Profil & UI
- **Mise à jour Photo** : Implémentation de la fonction de changement de photo de profil dans `ProfileScreen` utilisant `FilePicker` et l'upload via ConnectyCube.
- **Validation** : Correction du validateur d'email dans le dialogue de mise à jour utilisateur.
- **Connectivité** : Nettoyage des TODOs dans `app.dart` pour la gestion des états de cycle de vie et de réseau.

### 4. Logique Métier
- **Éléments de Construction** : Création d'une extension `TypeOfElementsExtension` pour gérer les prix (min/max) et les libellés des matériaux de maçonnerie.

## Vérification effectuée
- **Analyse Statique** : Suppression de nombreux avertissements et erreurs liés aux méthodes non implémentées.
- **Structure** : Le code est maintenant plus propre avec moins de blocs de code commentés.

> [!TIP]
> Les dossiers `linux/` et `windows/` contiennent encore des TODOs, mais ceux-ci appartiennent aux plugins Flutter (code généré ou éphémère) et ne doivent pas être modifiés manuellement.
