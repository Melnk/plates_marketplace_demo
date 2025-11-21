package com.plates.repository;

import com.plates.entity.SaleRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SaleRequestRepository extends JpaRepository<SaleRequest, Long> {
    List<SaleRequest> findByStatus(String status);
}
