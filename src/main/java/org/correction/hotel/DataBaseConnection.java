package org.correction.hotel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
    private static  String URL = "jdbc:postgresql://localhost:5432/correction_hotel";
    private static  String USER = "hotel";
    private static  String PASSWORD = "tsarasoa";

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur : Le pilote JDBC PostgreSQL est introuvable !");
            throw new SQLException("Impossible de charger le pilote JDBC.", e);
        }

        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);

        if (connection == null) {
            throw new SQLException("La connexion à la base de données a retourné un objet nul.");
        }

        return connection;
    }
}