package org.correction.hotel;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public class Reservation {
    private String id;
    private Instant creatAt;
    private boolean hasCheckout;
    private boolean hasChecking;
    private ReservationStatus status;
    private Customer customer;
    private Employee employee;
    private Payment payment;
    private List<RoomReservation> roomReservations;

    public void cancel(){
        this.status = ReservationStatus.CANCELED;
    }

    public BigDecimal getTotalCount(){

    }
}
