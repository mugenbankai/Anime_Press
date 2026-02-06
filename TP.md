# 🧪 TP noté — SymfonyPress

**Authentification, sécurité et logique métier**

---

## 🕒 Cadre général

- **Projet** : SymfonyPress (continuation du projet fil rouge)
- **Date de rendu** : 15 Février 2025 à 23h59
- **Type** : Travaux Pratiques évalués
- **Notation** : /20

**Technologies :**

- Symfony
- Doctrine ORM
- Twig
- Composant Security

---

## 🎯 Objectifs pédagogiques

Ce TP vise à évaluer votre capacité à :

- Comprendre et faire évoluer une application Symfony existante
- Implémenter une authentification fonctionnelle
- Sécuriser des routes et des actions métier
- Manipuler Doctrine dans un contexte réaliste
- Produire un code lisible et structuré selon l'architecture MVC

---

## 🧭 Contexte

L'application **SymfonyPress** propose actuellement :

- Un front public (articles, catégories)
- Un back-office CRUD pour les articles

Ce back-office **n'est pas encore sécurisé** et les articles ne sont pas liés à un utilisateur.

**Votre mission** consiste à transformer cette application en une application web réaliste, avec authentification, sécurité et règles métier cohérentes.

---

## 🧩 Travail demandé

### 1️⃣ Mettre en place l'authentification (OBLIGATOIRE)

L’application doit proposer :

- Une page d'inscription
- Une page de connexion
- Une déconnexion fonctionnelle

📌 **Attendus :**

- Création de l'entité `User`
- Mots de passe hashés
- Authentification via formulaire Symfony

📚 **Doc :** https://symfony.com/doc/current/security.html

---

### 2️⃣ Lier les articles à un utilisateur (OBLIGATOIRE)

Chaque article doit être :

- Associé à un utilisateur
- Automatiquement lié à l'utilisateur connecté lors de la création

📌 **Attendus :**

- Relation `Article` → `ManyToOne` → `User`
- Migration associée
- Champ `user_id` non nullable

---

### 3️⃣ Sécuriser l'accès au back-office (OBLIGATOIRE)

Toutes les routes `/admin` doivent :

- Être accessibles uniquement aux utilisateurs authentifiés

📌 **Méthodes acceptées :**

- `access_control` dans `security.yaml`
- Ou vérification dans les contrôleurs

✅ Toute solution fonctionnelle est acceptée.

---

### 4️⃣ Empêcher l'édition/suppression des articles d'un autre utilisateur (OBLIGATOIRE)

Un utilisateur ne doit **PAS** pouvoir :

- Modifier un article qu'il n'a pas créé
- Supprimer un article qu'il n'a pas créé

📌 **Attendus :**

- Vérification de la propriété de l'article
- Blocage effectif (403 ou redirection)

📌 **Implémentation libre :**

- Condition simple dans le contrôleur
- `denyAccessUnlessGranted`
- Toute autre solution cohérente

⚠️ La sophistication de la solution n’est pas évaluée, uniquement le résultat fonctionnel.

---

### 5️⃣ Valider les formulaires (OBLIGATOIRE)

Les formulaires doivent être validés via le composant **Validator**.

📌 **Attendus :**

- Contraintes définies dans l'entité `Article`
- Au minimum :
    - `NotBlank`
    - `Length`

📚 **Doc :** https://symfony.com/doc/current/validation.html

---

### 6️⃣ Créer au moins une requête Doctrine personnalisée (OBLIGATOIRE)

Créer une méthode dans un `Repository`, par exemple :

- Derniers articles publiés
- Articles d'un utilisateur
- Articles par catégorie

📌 **Contraintes :**

- `QueryBuilder` obligatoire
- SQL brut interdit

📚 **Doc :** https://symfony.com/doc/current/doctrine.html#querying-for-objects-the-repository

---

## 🚀 Bonus (OPTIONNEL)

Ces éléments sont **facultatifs** et permettent de gagner des points supplémentaires.

⚠️ **Un seul bonus suffit** pour obtenir les points.

### ⭐ Bonus A — Upload d'image (+2 points)

- Ajout d'un champ `image` à `Article`
- Upload via formulaire
- Stockage sur le serveur
- Affichage côté front

📚 **Doc :** https://symfony.com/doc/current/controller/upload_file.html

### ⭐ Bonus B — Pages d'erreur (+2 points)

Pages personnalisées :

- 403
- 404
- 500

Héritent de `base.html.twig`

📚 **Doc :** https://symfony.com/doc/current/controller/error_pages.html

---

## 📊 Barème détaillé (/20)

| Critère évalué                               | Points |
| -------------------------------------------- | ------ |
| Authentification fonctionnelle               | 4      |
| Relation Article ↔ User                      | 3      |
| Sécurisation des routes /admin               | 3      |
| Validation des formulaires (Assert)          | 2      |
| Sécurité métier (ownership des articles)     | 3      |
| Requête Doctrine personnalisée               | 3      |
| Qualité globale (MVC, lisibilité, cohérence) | 2      |
| **Sous-total**                               | **20** |
| Bonus (image OU pages d'erreur)              | +2 max |

⚠️ La note finale est plafonnée à **20/20**.

---

## 📝 Consignes importantes

- ✅ Toute solution **fonctionnelle et cohérente** est acceptée
- L'évaluation porte sur :
    - La compréhension
    - La logique métier
    - La capacité à structurer le code
- Les implémentations expertes (voters avancés, abstractions complexes) ne sont **pas exigées**

---

## 📦 Livrable attendu

À la fin du TP, vous devez fournir un lien vers un dépôt **GitHub**.

---

## 🧑‍🏫 Message du formateur

> Je n'évalue pas la complexité de votre solution,
> mais le fait que les problèmes soient correctement traités.
