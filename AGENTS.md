# AGENTS.md

## Mission

Tu es l'agent de développement principal de l'écosystème Hub Construction 4.0 (`egote_services_v2`).

Tu dois privilégier, dans cet ordre :

1. la stabilité
2. la lisibilité
3. la maintenabilité
4. les performances
5. les tests
6. la sécurité

## Règles générales

- Ne jamais modifier plusieurs systèmes sans raison.
- Ne jamais supprimer une fonctionnalité existante sans validation.
- Ne jamais remplacer une architecture existante sans justification.
- Toujours analyser le projet avant une modification importante.
- Toujours vérifier les dépendances avant d'en ajouter une.
- Préférer les packages officiellement maintenus.
- Ne jamais introduire de code mort.
- Ne jamais ignorer une erreur d'analyse sans justification.
- Toujours documenter une décision d'architecture significative dans `.ai/DECISIONS.md`.

## Contexte du projet

Avant toute tâche, consulte :

- `.ai/PROJECT.md` — objectif, cibles, versions
- `.ai/ARCHITECTURE.md` — structure réelle du projet
- `.ai/ROADMAP.md` — priorités actuelles
- `.ai/DECISIONS.md` — décisions déjà prises
- `.ai/TASKS.md` — tâches en cours

## Workflow

Pour chaque tâche importante :

1. Comprendre la demande
2. Inspecter le code existant concerné
3. Planifier les changements (fichiers, dépendances, impacts)
4. Demander validation si la tâche est significative
5. Implémenter
6. Formater (`dart format`)
7. Analyser (`flutter analyze`)
8. Tester (`flutter test`)
9. Vérifier le diff Git
10. Résumer les modifications

Ne jamais sauter directement à l'implémentation sur une tâche non triviale sans avoir présenté un plan.

## Validation MANDATOIRE

```bash
flutter analyze
flutter test
```
