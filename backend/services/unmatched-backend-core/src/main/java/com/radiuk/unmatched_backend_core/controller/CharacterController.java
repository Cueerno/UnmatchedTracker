package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.CharacterService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/characters")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CharacterController {

    private final CharacterService characterService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(
            @RequestParam(defaultValue = "name", required = false) String sortBy,
            @RequestParam(defaultValue = "asc", required = false) String direction
    ) {
        return ResponseEntity.ok(characterService.getAll(sortBy, direction));
    }

    @GetMapping("/top")
    public ResponseEntity<?> getTopByWins() {
        return ResponseEntity.ok(characterService.getTopByWins());
    }

    @GetMapping("/{name}")
    public ResponseEntity<?> getByName(@PathVariable String name) {
        return ResponseEntity.ok(characterService.getByName(name));
    }
}
