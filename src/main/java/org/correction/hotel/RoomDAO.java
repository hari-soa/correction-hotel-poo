package org.correction.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    public List<Room> findAll() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT id, price FROM room";

        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String id = rs.getString("id");
                double price = rs.getDouble("price");

                rooms.add(new Room(id, price));
            }

        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des chambres : " + e.getMessage());
        }

        return rooms;
    }
}