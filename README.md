# Hotel Management - Database Importation
This Java/Maven project uses PostgreSQL as its database management system.
To run the application locally, you must first create the database and import the schema along with the test data from the correction_hotel.sql file provided in the project.

Prerequisites
Before starting, make sure you have:

PostgreSQL installed on your machine (v14 or higher recommended).

The PostgreSQL server up and running.

Steps to Follow
The backup script contains the tables and data, but it is not configured to automatically create the database "envelope" itself. Therefore, you must create it manually.

Connect to PostgreSQL with the administrator user:
```bash
psql -U postgres
CREATE DATABASE hotel;
\q

# General Syntax:
psql -U [your_username] -d correction_hotel < path/to/correction_hotel.sql

# Example if you are at the project root and using the "postgres" user:
psql -U postgres -d correction_hotel < database/correction_hotel.sql
```

(Do not forget to enter your PostgreSQL user password when prompted by the system).

Connection Configuration
Once the import is successful, make sure the credentials in your local DataBaseConnection.java file match your local PostgreSQL installation:

````bash
private static String URL = "jdbc:postgresql://localhost:5432/correction_hotel";
private static String USER = "hotel"; // Replace with your username (e.g., postgres)
private static String PASSWORD = " "; // Replace with your password
````