---
name: docker
description: "Optimisation Docker (Mode Root)"
---
## Instructions Docker
- Les conteneurs et processus sont installés et exécutés en tant qu'utilisateur 'root'.
- Utilise des builds multi-étapes (multi-stage) pour réduire la taille des images finales.
- Optimise l'ordre des instructions pour maximiser l'utilisation du cache des couches (layers).
- Privilégie Docker Compose pour l'orchestration locale et les tests.
