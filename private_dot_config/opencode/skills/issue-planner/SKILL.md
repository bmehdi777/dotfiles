---
name: issue-planner
description: "Lit une issue GitLab via glab, analyse le repo, puis propose un plan de résolution."
---
## Objectif
Produire un plan d'implémentation clair et actionnable à partir d'une issue GitLab, sans modifier le code.
## Entrée attendue
- `issue_ref` (obligatoire) :
  - soit un ID d'issue (ex: `123`)
   - soit une URL GitLab de work item ou d'issue
    - ex: `https://gitlab.smartpanda-network.fr/.../-/work_items/1120`
    - ex: `https://gitlab.smartpanda-network.fr/.../-/issues/1120`
## Validation de l'entrée
- ID valide : `^[0-9]+$`
- URL valide (tolérante) : contient `/-/issues/` suivi d'un nombre
- Si la valeur n'est ni un ID ni une URL d'issue valide : demander une entrée correcte et arrêter.
## Workflow (ordre obligatoire)
1. Vérifier que `issue_ref` est fourni.
   - Si absent : demander `issue_ref` et arrêter.
2. Normaliser `issue_ref` en `issue_id` :
   - Si `issue_ref` est numérique, alors `issue_id = issue_ref`.
   - Sinon, extraire l'ID depuis l'URL (nombre après `/-/issues/`).
   - Si extraction impossible, demander une valeur valide et arrêter.
3. Lire l'issue avec la commande :
   - `glab issue view <issue_id>`
4. Extraire et structurer les éléments clés de l'issue :
   - Problème à résoudre
   - Contexte métier/technique
   - Critères d'acceptation
   - Contraintes explicites
   - Zones floues / questions ouvertes
5. Explorer le repository pour localiser les zones impactées :
   - Arborescence pertinente
   - Fichiers/modules potentiellement concernés
   - Dépendances et couplages
   - Tests existants liés au sujet
6. Construire un plan de résolution :
   - Découpage en étapes séquentielles
   - Fichiers à modifier par étape
   - Stratégie de validation (tests/checks)
   - Risques et mitigations
7. Retourner le plan final dans le format de sortie défini ci-dessous.
## Règles strictes
- Ne jamais modifier de fichiers.
- Ne jamais exécuter d'action destructive.
- Se limiter à l'analyse, la compréhension et la planification.
- Éviter les hypothèses non justifiées : signaler explicitement les inconnues.
- Prioriser le minimum de changements nécessaires.
- Si des informations manquent, poser des questions ciblées avant de finaliser le plan.
## Format de sortie attendu
1. `Résumé de l'issue` (3-6 lignes)
2. `Compréhension technique` (composants/fichiers impactés)
3. `Plan proposé` (liste numérotée d'étapes concrètes)
4. `Validation` (tests/commandes à exécuter)
5. `Risques et points à clarifier`
6. `Questions pour lever les ambiguïtés` (si nécessaire)
## Qualité attendue
- Plan précis, exécutable, sans fluff.
- Chaque étape indique un objectif clair.
- Les propositions restent cohérentes avec l'architecture existante.
