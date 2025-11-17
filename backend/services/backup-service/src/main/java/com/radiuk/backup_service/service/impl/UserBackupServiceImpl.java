package com.radiuk.backup_service.service.impl;

import com.radiuk.backup_service.proxy.User;
import com.radiuk.backup_service.service.UserBackupService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

@Service
public class UserBackupServiceImpl implements UserBackupService {

    private final Path userCsvFile;

    public UserBackupServiceImpl(
            @Value("${backup.csv.path.user}") String userFilePath
    ) {
        this.userCsvFile  = Paths.get(userFilePath);
    }

    @PostConstruct
    private void init() {
        try {
            initFile(userCsvFile);
        } catch (IOException e) {
            throw new RuntimeException("Failed to initialize CSV backup paths", e);
        }
    }

    private void initFile(Path file) throws IOException {
        Path parent = file.getParent();
        if (parent != null && !Files.exists(parent)) {
            Files.createDirectories(parent);
        }
        if (!Files.exists(file)) {
            Files.createFile(file);
            Files.writeString(
                    file,
                    "user_id,username,password,email,role,registered_at,updated_at" + System.lineSeparator(),
                    StandardOpenOption.APPEND
            );
        }
    }

    @Override
    public void backupUser(User user) throws IOException {
        String line = String.format(
                "%d,%s,%s,%s,%s,%s%n,%s%n",
                user.getId(),
                user.getUsername(),
                user.getPassword(),
                user.getEmail(),
                user.getRole(),
                user.getRegisteredAt(),
                user.getUpdatedAt()
        );
        writeLine(userCsvFile, line);
    }

    private void writeLine(Path file, String line) throws IOException {
        Files.writeString(file, line, StandardOpenOption.APPEND);
    }
}
