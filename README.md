# egote_services_v2

## Présentation du Projet
`egote_services_v2` est la nouvelle itération de la plateforme de services et d'ERP (Enterprise Resource Planning) dédiée au secteur de la construction et du bâtiment. L'objectif est de fournir une solution intégrée pour la gestion complète de projets, allant de l'estimation initiale à la livraison finale, tout en facilitant la communication entre les différents acteurs via un système de chat intégré.

### Vision
Centraliser et optimiser les flux de travail des entreprises du bâtiment par une approche modulaire, permettant d'agréger diverses applications spécialisées (Ecosystème Egote Services).

## Écosystème Egote Services
L'application est conçue comme un hub central capable d'intégrer dynamiquement d'autres modules et applications, tels que :
- **bat_track_v1** : Suivi de chantier et gestion des ressources.
- **Compta4me** : Gestion comptable et financière.
- Et d'autres modules à venir.

Cette modularité est assurée par une architecture de routing extensible où chaque module définit ses propres routes via l'interface `AppModule`.

## Architecture Technique
Le projet utilise les dernières technologies et standards du développement Flutter :

- **Framework** : Flutter (Material 3)
- **Gestion d'État** : Riverpod (Utilisation manuelle pour une flexibilité accrue et suppression des générateurs sur les parties critiques).
- **Navigation** : GoRouter (Architecture modulaire, sans `go_router_builder`).
- **Backends** : 
  - **Supabase** : Base de données principale, Authentification et Realtime.
  - **Firebase** : Notifications push et services d'authentification secondaires.
- **Communication** : SDK ConnectyCube pour le système de chat.
- **Qualité de Code** : Freezed pour l'immutabilité et une batterie complète de tests unitaires.

## Détails des Travaux Effectués (Récent)
1. **Migration du Routing** : 
   - Passage de `go_router_builder` à une configuration manuelle plus souple.
   - Implémentation du système `AppModule` pour l'injection dynamique de routes.
   - Migration de `AppRouterNotifier` vers un `NotifierProvider` manuel.
2. **Infrastructure Chat** :
   - Implémentation complète des repositories ConnectyCube (`CubeRepository`, `CubeUserRepository`).
   - Finalisation de la logique de session (Guest, Social, Restore).
   - Nettoyage des classes de migration (`Mig`) au profit du package d'origine.
3. **Authentification & MFA** :
   - Correction du flux de validation Multi-Facteurs (MFA).
   - Dynamisation de la configuration Firebase.
4. **Profil Utilisateur** :
   - Ajout de la mise à jour de la photo de profil avec upload via ConnectyCube.
5. **Gestion des Erreurs** :
   - Enrichissement de la classe `Failure` pour couvrir tous les cas d'erreurs (Réseau, Serveur, Cache, etc.).
6. **Tests Unitaires** :
   - Mise en place d'une suite de tests couvrant le Domain, l'Infrastructure et l'Application.

## État d'Avancement

| Fonctionnalité | Statut | Détails |
| :--- | :---: | :--- |
| Authentification Supabase | ✅ | Opérationnel (Sign-in, Sign-up) |
| MFA (Multi-Factor) | ✅ | Validé et redirection fixée |
| Chat (ConnectyCube) | 🔄 | Repositories OK, UI en cours |
| Gestion des Devis | 🔄 | Logique de calcul en place |
| Profil Utilisateur | ✅ | Mise à jour photo et infos OK |
| Architecture Modulaire | ✅ | `AppModule` opérationnel |
| Batterie de Tests | 🔄 | En cours d'extension (60%+) |

## Installation & Configuration
(Instructions à venir pour la configuration des fichiers `google-services.json` et des clés API Supabase).

---
*Projet développé par Godzy.*
