package com.radiuk.umdb_service.controller;

import com.radiuk.umdb_service.model.Match;
import com.radiuk.umdb_service.service.DeckService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/decks")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class DeckController {

    private final DeckService deckService;

    @GetMapping("/top")
    public ResponseEntity<?> getTop(@RequestParam(name = "format", required = false) Match.MatchFormat format) {
        return ResponseEntity.ok(deckService.getTop(format));
    }

    @GetMapping("/random")
    public ResponseEntity<?> getRandom(@RequestParam(defaultValue = "1") Short quantity) {
        return ResponseEntity.ok(deckService.getRandom(quantity));
    }
}
