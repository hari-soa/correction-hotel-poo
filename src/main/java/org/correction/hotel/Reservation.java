package org.correction.hotel;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.Instant;
import java.util.List;

@Getter
public class Reservation {
    private String id;
    private Instant creatAt;
    private boolean hasCheckout;
    private boolean hasChecking;
    private ReservationStatus status;
    private Employee employee;
    private Payment payment;
    private List<RoomReservation> roomReservations;

    public void cancel(){
        this.status = ReservationStatus.CANCELED;
    }

    public BigDecimal getTotalCount(){
        BigDecimal total = BigDecimal.ZERO;

        for (RoomReservation roomReservation : roomReservations){
            long days = Duration.between(roomReservation.getStartDate(), roomReservation.getEndDate()).toDays();

            if (days <= 0){
                days = 1;
            }

         double price = roomReservation.getRoom().getPrice();
            BigDecimal costForThisRoom = BigDecimal.valueOf(price).multiply(BigDecimal.valueOf(days));

            total = total.add(costForThisRoom);
        }

        return total;
    }
}
