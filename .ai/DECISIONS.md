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
