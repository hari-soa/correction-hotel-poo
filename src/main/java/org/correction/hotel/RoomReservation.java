package org.correction.hotel;

import lombok.Getter;

import java.time.Instant;

@Getter
public class RoomReservation {
    private Room room;
    private String id;
    private Instant startDate;
    private Instant endDate;

}
