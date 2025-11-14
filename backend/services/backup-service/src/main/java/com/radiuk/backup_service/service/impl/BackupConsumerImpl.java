package com.radiuk.backup_service.service.impl;

import com.radiuk.backup_service.config.RabbitConfig;
import com.radiuk.backup_service.proxy.Party;
import com.radiuk.backup_service.proxy.User;
import com.radiuk.backup_service.service.BackupConsumer;
import com.radiuk.backup_service.service.PartyBackupService;
import com.radiuk.backup_service.service.UserBackupService;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class BackupConsumerImpl implements BackupConsumer {

    private final UserBackupService userBackupService;
    private final PartyBackupService partyBackupService;

    @Override
    @RabbitListener(queues = RabbitConfig.USER_QUEUE)
    public void onUserCreated(User user) throws IOException {
        userBackupService.backupUser(user);
    }

    @Override
    @RabbitListener(queues = RabbitConfig.PARTY_QUEUE)
    public void onPartyCreated(Party party) throws IOException {
        partyBackupService.backupParty(party);
    }
}
