package org.correction.hotel;

import lombok.Getter;

import java.util.List;

import jakarta.persistence.*;

@Getter

@Entity
@Table(name = "room")
public class Room {
    @Id
    @Column(name = "id")
    private  String id;
    @Column(name = "price", nullable = false)
    private double price;
    @Column(name = "capacity", nullable = false)
    private int capacity;
    private List<Feature> features;
}
