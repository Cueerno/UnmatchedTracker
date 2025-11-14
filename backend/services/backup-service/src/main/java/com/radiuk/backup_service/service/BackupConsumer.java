package com.radiuk.backup_service.service;

import com.radiuk.backup_service.proxy.Party;
import com.radiuk.backup_service.proxy.User;

import java.io.IOException;


public interface BackupConsumer {

    void onUserCreated(User user) throws IOException;

    void onPartyCreated(Party party) throws IOException;
}
