package org.correction.hotel;

import lombok.Getter;

import java.util.List;

@Getter

public class Room {
    private  String id;
    private double price;
    private int capacity;
    private List<Feature> features;
}
