package com.example.plates.web;

import com.example.plates.web.HomeController;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class HomeControllerTest {

    @Test
    void indexReturnsViewName() {
        HomeController c = new HomeController();
        assertEquals("index", c.index());
    }
}
