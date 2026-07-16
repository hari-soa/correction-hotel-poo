package org.correction.hotel;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- DÉMARRAGE DE L'APPLICATION HÔTEL ---");

        RoomService roomService = new RoomService();

        BigDecimal prixMin = new BigDecimal("50000.0");
        BigDecimal prixMax = new BigDecimal("200000.0");
        Instant debut = Instant.parse("2026-07-15T12:00:00Z");
        Instant fin = Instant.parse("2026-07-17T12:00:00Z");

        System.out.println("Recherche des chambres disponibles...");
        List<Room> chambresDisponibles = roomService.searchFreeRoom(prixMin, prixMax, debut, fin);

        if (chambresDisponibles.isEmpty()) {
            System.out.println("Aucune chambre libre trouvée pour ces critères.");
        } else {
            for (Room room : chambresDisponibles) {
                System.out.println("Chambre ID: " + room.getId() + " | Prix: " + room.getPrice() + " Ar");
            }
        }
    }
}