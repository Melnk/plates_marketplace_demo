package com.plates.controller;

import com.plates.entity.Plate;
import com.plates.entity.SaleRequest;
import com.plates.repository.PlateRepository;
import com.plates.repository.SaleRequestRepository;
import com.plates.service.KafkaProducerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/requests")
public class SaleRequestController {

    private final SaleRequestRepository repo;
    private final PlateRepository plateRepo;
    private final KafkaProducerService kafka;

    public SaleRequestController(SaleRequestRepository repo,
                                 PlateRepository plateRepo,
                                 KafkaProducerService kafka) {
        this.repo = repo;
        this.plateRepo = plateRepo;
        this.kafka = kafka;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("requests", repo.findAll());
        return "requests/list";
    }

    @GetMapping("/new/{plateId}")
    public String newRequest(@PathVariable Long plateId, Model model) {
        Plate plate = plateRepo.findById(plateId).orElse(null);
        SaleRequest request = new SaleRequest();
        request.setPlate(plate);
        model.addAttribute("request", request);
        return "requests/add";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute SaleRequest request) {
        request.setStatus("PENDING");
        repo.save(request);

        kafka.sendPlateCreated(request.getPlate()); // или новый event "request.created"

        return "redirect:/requests";
    }

    @PostMapping("/{id}/approve")
    public String approve(@PathVariable Long id) {
        SaleRequest r = repo.findById(id).orElseThrow();
        r.setStatus("APPROVED");
        repo.save(r);
        return "redirect:/requests";
    }

    @PostMapping("/{id}/reject")
    public String reject(@PathVariable Long id) {
        SaleRequest r = repo.findById(id).orElseThrow();
        r.setStatus("REJECTED");
        repo.save(r);
        return "redirect:/requests";
    }
}
