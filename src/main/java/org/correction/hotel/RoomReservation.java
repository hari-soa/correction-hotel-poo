package org.correction.hotel;

import lombok.Getter;

import java.time.Instant;

@Getter

public class RoomReservation {
    private Room room;
    private String id;
    private Instant startDate;
    private Instant endDate;

    public RoomReservation(Room room, String id, Instant startDate, Instant endDate) {
        this.room = room;
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
    }
}
