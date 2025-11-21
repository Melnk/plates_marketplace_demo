package com.plates.repository;

import com.plates.entity.Plate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PlateRepository extends JpaRepository<Plate, Long> {
    // findAll(), save(), findById(), deleteById()

    Plate findByNumber(String number);
    List<Plate> findByRegion(String region);
}
