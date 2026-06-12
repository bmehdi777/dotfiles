---
name: gitlab_mr_review
description: "Review technique de Merge Requests GitLab via glab"
---
## Objectif
Effectuer une review de MR GitLab structurée, reproductible et orientée risques, en s'appuyant sur `glab mr diff` pour analyser les changements.
## Workflow (ordre obligatoire)
1. Identifier la MR cible.
   - Si un ID/IID est fourni, l'utiliser.
   - Sinon, demander l'ID/IID de la MR avant de continuer.
2. Récupérer le diff complet avec:
   - `glab mr diff <IID>`
3. Construire le résumé global de la MR:
   - But fonctionnel de la MR
   - Composants/fichiers impactés
   - Comment les changements interagissent entre eux (flux de données, dépendances, enchaînement backend/frontend, DB/API)
   - Effets de bord possibles et zones à risque
4. Analyser le diff par priorité:
   - Bugs potentiels (logique, null/undefined, conditions limites)
   - Sécurité (injection, secrets, authz/authn, validation entrées)
   - Régressions fonctionnelles
   - Performance (N+1, complexité, appels inutiles)
   - Maintenabilité (lisibilité, duplication, dette)
5. Produire des remarques actionnables:
   - Inclure fichier + contexte de code + impact concret.
   - Proposer une correction claire (snippet ou pseudo-correction).
6. Conclure avec une recommandation:
   - `approve` si aucun point bloquant
   - `request_changes` si au moins un point critique/majeur
## Règles
- Baser les observations sur le diff observé, pas sur des suppositions.
- Être factuel, concis, et orienté impact produit.
- Ne pas signaler des préférences de style comme bloquantes.
- Prioriser les problèmes réels de fiabilité, sécurité et comportement.
## Format de sortie attendu
### Résumé de la MR
- **But**: ce que la MR cherche à accomplir
- **Changements clés**: 3 à 7 points maximum
- **Interactions**: comment les modifications se combinent entre elles
- **Impact global**: comportement attendu après merge
- **Risques transverses**: points sensibles à valider
### Verdict
- `approve` ou `request_changes`
### Findings
- `[SEVERITY] <titre court>`
- **Fichier**: `<path>:<line si connue>`
- **Problème**: description précise
- **Impact**: pourquoi c'est important
- **Suggestion**: correction proposée
### Quick Wins (optionnel)
- 1 à 3 améliorations non bloquantes à forte valeur.
## Échelle de sévérité
- `CRITICAL`: fail sécurité ou bug majeur en production
- `MAJOR`: comportement incorrect significatif
- `MINOR`: amélioration utile non bloquante
- `NIT`: remarque cosmétique (non bloquante)
## Commandes utiles
- Diff MR: `glab mr diff <IID>`
- Détails MR: `glab mr view <IID>`
- Lister MRs: `glab mr list`
