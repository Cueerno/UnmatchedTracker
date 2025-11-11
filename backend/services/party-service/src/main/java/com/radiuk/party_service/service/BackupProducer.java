package com.radiuk.party_service.service;

import com.radiuk.party_service.config.RabbitConfig;
import com.radiuk.party_service.dto.PartyDto;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

@Service
@RequiredArgsConstructor
public class BackupProducer {

    private final RabbitTemplate rabbitTemplate;

    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void sendPartyCreatedEvent(PartyDto partyBackupDto) {
        rabbitTemplate.convertAndSend(
                RabbitConfig.EXCHANGE_NAME,
                RabbitConfig.PARTY_ROUTING_KEY,
                partyBackupDto
        );
    }
}
