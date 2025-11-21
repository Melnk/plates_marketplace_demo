package com.plates.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "plates")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Plate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String number;

    @Column(nullable = false)
    private String region;

    @Column(nullable = false)
    private String status;

    public Plate(String number, String region, String status) {
        this.number = number;
        this.region = region;
        this.status = status;
    }
}
