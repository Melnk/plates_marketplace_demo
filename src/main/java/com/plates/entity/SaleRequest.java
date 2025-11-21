package com.plates.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "sale_request")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SaleRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "plate_id", nullable = false)
    private Plate plate;

    @Column(nullable = false)
    private String sellerName;

    @Column(nullable = false)
    private String status;

    private LocalDateTime createdAt = LocalDateTime.now();
}
