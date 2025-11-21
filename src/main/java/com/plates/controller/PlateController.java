package com.plates.controller;

import com.plates.entity.Plate;
import com.plates.repository.PlateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/plates")
public class PlateController {

    @Autowired
    private PlateRepository plateRepository;

    @GetMapping
    public String listPlates(Model model) {
        List<Plate> plates = plateRepository.findAll();
        model.addAttribute("plates", plates);
        return "plates";
    }

    @GetMapping("/add-test")
    public String addTestData() {
        Plate plate1 = new Plate("А123АА", "777", "PUBLISHED");
        Plate plate2 = new Plate("Е456ЕЕ", "198", "PUBLISHED");
        Plate plate3 = new Plate("Х777ХХ", "716", "PUBLISHED");

        plateRepository.save(plate1);
        plateRepository.save(plate2);
        plateRepository.save(plate3);

        return "redirect:/plates";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("plate", new Plate());
        return "plates/add";
    }

    @PostMapping("/add")
    public String addPlate(@ModelAttribute Plate plate) {
        plateRepository.save(plate);
        return "redirect:/plates";
    }

    @GetMapping("/{id}")
    public String getPlate(@PathVariable Long id, Model model) {
        Plate plate = plateRepository.findById(id).orElse(null);
        model.addAttribute("plate", plate);
        return "plates/details";
    }
}
