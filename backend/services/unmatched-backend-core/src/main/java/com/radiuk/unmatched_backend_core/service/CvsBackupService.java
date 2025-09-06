package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.model.Party;
import com.radiuk.unmatched_backend_core.model.User;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.*;

@Component
@Slf4j
public class CvsBackupService {

    private final Path partyCsvFile;
    private final Path userCsvFile;

    public CvsBackupService(
            @Value("${backup.csv.path.party}") String partyFilePath,
            @Value("${backup.csv.path.user}")  String userFilePath
    ) {
        this.partyCsvFile = Paths.get(partyFilePath);
        this.userCsvFile  = Paths.get(userFilePath);
    }

    @PostConstruct
    private void init() {
        try {
            // Создаём файлы и сразу пишем заголовки
            initFile(partyCsvFile, "party_id,match_id,team_id,user_id,deck_id,board_id,move_order,final_hp,is_winner,created_at");
            initFile(userCsvFile,  "user_id,username,registered_at");
        } catch (IOException e) {
            log.error("Failed to initialize CSV backup paths", e);
        }
    }

    private void initFile(Path file, String header) throws IOException {
        Path parent = file.getParent();
        if (parent != null && !Files.exists(parent)) {
            Files.createDirectories(parent);
            log.info("Created backup directory: {}", parent);
        }
        if (!Files.exists(file)) {
            Files.createFile(file);
            log.info("Created CSV backup file: {}", file);
            Files.writeString(
                    file,
                    header + System.lineSeparator(),
                    StandardOpenOption.APPEND
            );
            log.info("Wrote CSV header to: {}", file);
        }
    }

    public void backupParty(Party party) {
        String line = String.format(
                "%d,%d,%d,%d,%d,%s,%d,%d,%b,%s%n",
                party.getId(),
                party.getMatch().getId(),
                party.getTeam().getId(),
                party.getUser().getId(),
                party.getDeck().getId(),
                party.getBoard() != null ? party.getBoard().getId() : "",
                party.getMoveOrder(),
                party.getFinalHp(),
                party.getIsWinner(),
                party.getCreatedAt()
        );
        writeLine(partyCsvFile, line);
    }

    public void backupUser(User user) {
        String line = String.format(
                "%d,%s,%s%n",
                user.getId(),
                user.getUsername(),
                user.getRegisteredAt()
        );
        writeLine(userCsvFile, line);
    }

    private void writeLine(Path file, String line) {
        try {
            Files.writeString(file, line, StandardOpenOption.APPEND);
        } catch (IOException e) {
            log.error("Failed to write CSV backup to {}", file, e);
        }
    }
}
