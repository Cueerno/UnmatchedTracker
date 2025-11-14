package com.radiuk.backup_service.service;

import com.radiuk.backup_service.proxy.User;
import java.io.IOException;

public interface UserBackupService {

    public void backupUser(User user) throws IOException;
}

