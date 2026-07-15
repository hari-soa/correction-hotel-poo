package org.correction.hotel;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    private List<Room> allRooms;
    private List<RoomReservation> allReservations;

    public List<Room> searchFreeRoom(BigDecimal minPrice, BigDecimal maxPrice, Instant startDate, Instant endDate) {
        List<Room> freeRooms = new ArrayList<>();

        for (Room room : allRooms) {

            BigDecimal roomPrice = BigDecimal.valueOf(room.getPrice());

            boolean priceOk = roomPrice.compareTo(minPrice) >= 0 && roomPrice.compareTo(maxPrice) <= 0;

            if (priceOk) {
                if (isRoomFree(room, startDate, endDate)) {
                    freeRooms.add(room);
                }
            }
        }

        return freeRooms;
    }

    private boolean isRoomFree(Room room, Instant startDate, Instant endDate) {
        for (RoomReservation reservation : allReservations) {
            if (reservation.getRoom().getId().equals(room.getId())) {

                if (reservation.getStartDate().isBefore(endDate) && reservation.getEndDate().isAfter(startDate)) {
                    return false;
                }
            }
        }
        return true;
    }
}
