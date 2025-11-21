package com.plates.service;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class PurchaseConsumer {

    @KafkaListener(topics = "purchase.created", groupId = "plates-group")
    public void onPurchase(String message) {
        System.out.println("📥 Покупка создана: " + message);
    }
}
