# Budget Trip Planner — Modèle de données

Schéma de base de données du projet **Budget Trip Planner**, une application web de
planification de voyage selon budget, préférences et contraintes. **PostgreSQL**.
Projet de groupe — ESIEE Paris (E5, 2025/2026).

> Vue d'ensemble du projet : https://github.com/Budget-Trip-Planner
> Portfolio : https://afouanee.dev/projects/budget-trip-planner

---

## Stack

PostgreSQL · PL/pgSQL

---

## Rôle dans l'architecture

Définit le schéma relationnel utilisé par l'API Spring Boot (via Spring Data JPA).

```
Front Angular  ──▶  API Spring Boot  ──JPA──▶  PostgreSQL (ce dépôt)
```

---

## Contenu

Scripts SQL / PL-pgSQL décrivant les tables, contraintes et éventuelles fonctions
du domaine (voyages, budgets, préférences, utilisateurs…).

---

## Utilisation

```bash
# Appliquer le schéma sur une base PostgreSQL existante
psql -h <hôte> -U <utilisateur> -d <base> -f <script>.sql
```

Adapter le nom du script et les paramètres de connexion à votre environnement.

---

## Équipe

Projet de groupe — ESIEE Paris (E5, 2025/2026).
