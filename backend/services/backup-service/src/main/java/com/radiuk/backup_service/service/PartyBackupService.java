package com.radiuk.backup_service.service;

import com.radiuk.backup_service.proxy.Party;
import java.io.IOException;

public interface PartyBackupService {

    void backupParty(Party party) throws IOException;
}
