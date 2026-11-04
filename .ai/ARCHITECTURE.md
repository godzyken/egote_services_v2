# Architecture

## Overview

`egote_services_v2` est structuré en architecture Clean / Feature-first :
- `lib/config/` : Routage (`go_router`), thèmes, extensions.
- `lib/features/` : Modules fonctionnels (auth, chat, devis, settings, common).
- `shared_models/` : Package partagé pour les entités et modèles communs.

## State Management

- **Riverpod** (`flutter_riverpod` + `riverpod_annotation`) pour la gestion d'état réactive.
- **GoRouter** pour le routage déclaratif multi-plateforme.

## Backend & Services

- **Supabase** (Base de données PostgreSQL, Auth, Realtime).
- **Firebase Cloud Messaging (FCM)** pour les notifications push mobiles.
- **Talker** pour la journalisation centralisée et le debugging.
