package com.radiuk.party_service.service;

import com.radiuk.unmatched_backend_core.model.Party;
import com.radiuk.unmatched_backend_core.model.User;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

@Component
public class CvsBackupService {

    private final Path partyCsvFile;
    private final Path userCsvFile;

    public CvsBackupService(
            @Value("${backup.csv.path.party}") String partyFilePath,
            @Value("${backup.csv.path.user}") String userFilePath
    ) {
        this.partyCsvFile = Paths.get(partyFilePath);
        this.userCsvFile  = Paths.get(userFilePath);
    }

    @PostConstruct
    private void init() {
        try {
            initFile(partyCsvFile, "party_id,match_id,team_id,user_id,deck_id,board_id,move_order,final_hp,is_winner,created_at");
            initFile(userCsvFile,  "user_id,username,registered_at");
        } catch (IOException e) {
            // исключение можно обработать или пробросить
            throw new RuntimeException("Failed to initialize CSV backup paths", e);
        }
    }

    private void initFile(Path file, String header) throws IOException {
        Path parent = file.getParent();
        if (parent != null && !Files.exists(parent)) {
            Files.createDirectories(parent);
        }
        if (!Files.exists(file)) {
            Files.createFile(file);
            Files.writeString(
                    file,
                    header + System.lineSeparator(),
                    StandardOpenOption.APPEND
            );
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
            throw new RuntimeException("Failed to write CSV backup to " + file, e);
        }
    }
}
