package com.plates.repository;

import com.plates.entity.Plate;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
@Transactional
public class PlateRepository {

    private final SessionFactory sessionFactory;

    public PlateRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Plate> findAll() {
        return sessionFactory.getCurrentSession()
            .createQuery("from Plate", Plate.class)
            .list();
    }

    public void save(Plate plate) {
        sessionFactory.getCurrentSession().save(plate);
    }
}
