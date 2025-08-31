package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.CardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/umdb/cards")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CardController {

    private final CardService cardService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllBoards(
            @RequestParam(defaultValue = "type", required = false) String sortBy,
            @RequestParam(defaultValue = "asc", required = false) String direction
    ) {
        return ResponseEntity.ok(cardService.getAll(sortBy, direction));
    }

    @GetMapping("/{title}")
    public ResponseEntity<?> getByTitle(@PathVariable String title) {
        return ResponseEntity.ok(cardService.getByTitle(title));
    }
}
