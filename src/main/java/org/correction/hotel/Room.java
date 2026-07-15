package org.correction.hotel;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter

public class Room {
    private  String id;
    private double price;
    private int capacity;
    private List<Feature> features;

    public Room(String id, double price) {
        this.id = id;
        this.price = price;
    }
}
