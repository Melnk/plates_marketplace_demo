package com.plates.controller;

import com.plates.entity.Plate;
import com.plates.entity.Purchase;
import com.plates.repository.PlateRepository;
import com.plates.repository.PurchaseRepository;
import com.plates.service.KafkaProducerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

    private final PurchaseRepository purchaseRepository;
    private final PlateRepository plateRepo;
    private final KafkaProducerService kafka;

    public PurchaseController(PurchaseRepository purchaseRepository, PlateRepository plateRepo, KafkaProducerService kafka) {
        this.purchaseRepository = purchaseRepository;
        this.plateRepo = plateRepo;
        this.kafka = kafka;
    }

    @GetMapping("/new/{plateId}")
    public String newPurchase(@PathVariable Long plateId, Model model) {
        Plate plate = plateRepo.findById(plateId).orElseThrow();
        Purchase p = new Purchase();
        p.setPlate(plate);
        model.addAttribute("purchase", p);
        return "purchase/add";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute Purchase purchase) {
        purchase.setStatus("REQUESTED");
        purchaseRepo.save(purchase);

        kafka.send("purchase.created", purchase);

        return "redirect:/plates/" + purchase.getPlate().getId();
    }

    @PostMapping("/{id}/approve")
    public String approve(@PathVariable Long id) {
        Purchase p = purchaseRepository.findById(id).orElseThrow();
        p.setStatus("COMPLETED");
        purchaseRepository.save(p);

        Plate plate = p.getPlate();
        plate.setStatus("SOLD");
        plateRepo.save(plate);

        return "redirect:/plates";
    }
}
