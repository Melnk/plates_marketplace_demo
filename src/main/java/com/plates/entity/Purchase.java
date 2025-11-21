package com.plates.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "purchases")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Purchase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "plate_id", nullable = false)
    private Plate plate;

    private String buyerName;

    private String status; // REQUESTED, APPROVED, REJECTED, COMPLETED

    private LocalDateTime createdAt = LocalDateTime.now();
}
