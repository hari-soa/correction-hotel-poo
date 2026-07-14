package org.correction.hotel;

import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter

public class Customer extends Person {
    private List<Reservation> reservations = new ArrayList<>();

    public void createReservation(List<RoomReservation> roomReservations) {
        Reservation newReservation = new Reservation();

        newReservation.setCreatedAt(Instant.now());
        newReservation.setHasCheckedIn(false);
        newReservation.setHasCheckedOut(false);
        newReservation.setStatus(ReservationStatus.PENDING);

        newReservation.setRoomReservations(roomReservations);
        this.reservations.add(newReservation);
    }
}
