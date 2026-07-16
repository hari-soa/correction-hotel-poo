import org.correction.hotel.Reservation;
import org.correction.hotel.Room;
import org.correction.hotel.RoomReservation;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ReservationTest {

    private Reservation reservation;

    @BeforeEach
    void setUp() {
        this.reservation = new Reservation();
        this.reservation.setRoomReservations(new ArrayList<>());
    }

    @Test
    void test_GetTotalCost_WithMultipleRoomsAndDifferentDurations() {
        var luxuryRoom = new Room("101", 150_000.0);
        var standardRoom = new Room("102", 80_000.0);

        Instant start1 = Instant.parse("2026-07-15T12:00:00Z");
        Instant end1 = Instant.parse("2026-07-17T12:00:00Z");
        var reservation1 = new RoomReservation(standardRoom, "3", start1, end1);

        Instant start2 = Instant.parse("2026-07-15T12:00:00Z");
        Instant end2 = Instant.parse("2026-07-18T12:00:00Z");
        var reservation2 = new RoomReservation(luxuryRoom, "1", start2, end2);

        reservation.getRoomReservations().add(reservation1);
        reservation.getRoomReservations().add(reservation2);
        BigDecimal expectedTotal = BigDecimal.valueOf(610_000.0);

        BigDecimal actualTotal = reservation.getTotalCost();


        assertEquals(0, expectedTotal.compareTo(actualTotal),
                "Le coût total calculé est incorrect pour plusieurs chambres.");
    }

    @Test
    void testGetTotalCost_WhenNoRoomsReserved() {

        BigDecimal expectedTotal = BigDecimal.ZERO;

        BigDecimal actualTotal = reservation.getTotalCost();

        assertEquals(0, expectedTotal.compareTo(actualTotal),
                "Une réservation vide devrait coûter 0.0.");
    }
}