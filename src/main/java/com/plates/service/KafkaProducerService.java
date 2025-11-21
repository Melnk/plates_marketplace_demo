package com.plates.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.plates.entity.Plate;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaProducerService {

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper mapper = new ObjectMapper();

    public KafkaProducerService(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void sendPlateCreated(Plate plate) {
        try {
            String json = mapper.writeValueAsString(plate);
            kafkaTemplate.send("plate.created", json);
            System.out.println("Sent to Kafka" + json);
        } catch (Exception e) {
            throw new RuntimeException("Failed to send plate to Kafka: " + plate.getNumber(), e);
        }
    }
}
