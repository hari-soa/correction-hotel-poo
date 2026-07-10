package org.correction.hotel;

import java.math.BigDecimal;
import java.time.Instant;

public class Reservation {
    private String id;
    private Instant creatAt;
    private boolean hasCheckout;
    private boolean hasChecking;
    private ReservationStatus status;

    public void cancel(){
        this.status = ReservationStatus.CANCELED;
    }

    public BigDecimal getTotalCount(){

    }
}
