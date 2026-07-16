# Gestion Hôtel - Importation de la Base de Données

Ce projet Java/Maven utilise **PostgreSQL** comme système de gestion de base de données.
Pour faire fonctionner l'application localement, vous devez d'abord créer la base de données et y importer le schéma ainsi que les données de test à partir du fichier `correction_hotel.sql` fourni dans le projet.

---

## Prérequis

Avant de commencer, assurez-vous d'avoir :
1. **PostgreSQL** installé sur votre machine (v14 ou supérieure recommandée).
2. Le serveur PostgreSQL démarré.

---

## Voici les étapes à suivre

Le script de sauvegarde contient les tables et les données, mais il n'est pas configuré pour créer automatiquement la base de données "enveloppe". Vous devez donc la créer manuellement.

Connectez-vous à PostgreSQL avec l'utilisateur administrateur :
```bash
psql -U postgres
CREATE DATABASE hotel;
\q
# Syntaxe générale :
psql -U [votre_utilisateur] -d hotel < chemin/vers/correction_hotel.sql

# Exemple si vous êtes à la racine du projet et utilisez l'utilisateur "postgres" :
psql -U postgres -d hotel < database/correction_hotel.sql
````
(N'oubliez pas de saisir le mot de passe de votre utilisateur PostgreSQL lorsque le système vous le demande)

Une fois l'importation réussie, assurez-vous que les identifiants de votre fichier local DataBaseConnection.java correspondent à votre installation PostgreSQL :

````bash
private static String URL = "jdbc:postgresql://localhost:5432/correction_hotel";
private static String USER = "hotel"; // Remplacez par votre utilisateur (ex: postgres)
private static String PASSWORD = " "; // Remplacez par votre mot de passe
````