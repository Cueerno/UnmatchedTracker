package com.radiuk.backup_service.service;

import com.radiuk.backup_service.proxy.User;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

@Component
public class UserBackupService {

    private final Path userCsvFile;

    public UserBackupService(
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

    public void backupUser(User user) {
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

    private void writeLine(Path file, String line) {
        try {
            Files.writeString(file, line, StandardOpenOption.APPEND);
        } catch (IOException e) {
            throw new RuntimeException("Failed to write CSV backup to " + file, e);
        }
    }
}

