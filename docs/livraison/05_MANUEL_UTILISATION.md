# Manuel d'Utilisation - egote_services_v2 (Hub Construction 4.0)

## 1. Introduction

Ce manuel présente les principaux parcours utilisateurs et fonctionnalités disponibles au sein de la
plateforme `egote_services_v2`.

---

## 2. Parcours d'Authentification & Sécurité

- **Connexion & Inscription** : Accès par e-mail/mot de passe ou authentification unifiée connectée
  à Supabase Auth.
- **Validation Multi-Facteurs (MFA)** : Flux de sécurité renforcé pour la validation des accès
  sensibles.
- **Restauration de Session** : Récupération transparente de la session utilisateur au redémarrage
  via le gestionnaire de session sécurisé.

---

## 3. Gestion des Chantiers & Devis

- **Tableau de Bord Chantiers** : Vue synthétique des projets en cours, des statuts d'avancement et
  des indicateurs clés.
- **Module Devis** : Création, calcul et suivi des chiffrages, reliés au moteur de règles métier et
  au trigger de transformation automatique en chantier actif.

---

## 4. Messagerie & Chat Chantiers (ConnectyCube)

- **Salons par Chantier** : Communication en temps réel entre les artisans, les conducteurs de
  travaux et les clients.
- **Partage de Médias** : Envoi de photos, plans et documents directement dans les fils de
  discussion du chantier.

---

## 5. Paramètres, Thèmes & Accessibilité

- **Personnalisation Visuelle** : Basculement dynamique entre le mode clair et le mode sombre via
  l'outil de thématisation FlexColorScheme.
- **Choix des Couleurs & Surfaces** : Ajustement des modes de surface, des niveaux de mélange
  (*blend level*) et des couleurs primaires/secondaires.
- **Gestion du Stockage Local** : Possibilité de basculer l'implémentation de stockage local (Hive,
  SharedPreferences, Mémoire) depuis l'écran des paramètres de développement.
