package com.radiuk.backup_service.service;

import com.radiuk.backup_service.config.RabbitConfig;
import com.radiuk.backup_service.proxy.Party;
import com.radiuk.backup_service.proxy.User;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BackupConsumer {

    private final UserBackupService userBackupService;
    private final PartyBackupService partyBackupService;

    @RabbitListener(queues = RabbitConfig.USER_QUEUE)
    public void onUserCreated(User user) {
        userBackupService.backupUser(user);
    }

    @RabbitListener(queues = RabbitConfig.PARTY_QUEUE)
    public void onPartyCreated(Party party) {
        partyBackupService.backupParty(party);
    }
}
