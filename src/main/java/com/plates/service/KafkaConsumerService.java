package com.plates.service;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumerService {

    @KafkaListener(topics = "plate.created", groupId = "plates-group")
    public void listen(String message) {
        System.out.println("Kafka received: " + message);
    }
}
