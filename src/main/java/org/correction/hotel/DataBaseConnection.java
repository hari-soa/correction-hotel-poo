package org.correction.hotel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
        public static Connection getConnection() throws SQLException {
                var connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/hotel",
                        "postgres",
                        " "
        }

}
