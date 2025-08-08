package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.service.DeckService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/umdb/decks")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class DeckController {

    private final DeckService deckService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(
            @RequestParam(defaultValue = "name", required = false) String sortBy,
            @RequestParam(defaultValue = "asc", required = false) String direction
    ) {
        return ResponseEntity.ok(deckService.getAll(sortBy, direction));
    }

    @GetMapping("/{name}")
    public ResponseEntity<?> getByName(@PathVariable String name) {
        return ResponseEntity.ok(deckService.getByName(name));
    }

    @GetMapping("/top")
    public ResponseEntity<?> getTop(@RequestParam(name = "format", required = false) Match.MatchFormat format) {
        return ResponseEntity.ok(deckService.getTop(format));
    }
}
