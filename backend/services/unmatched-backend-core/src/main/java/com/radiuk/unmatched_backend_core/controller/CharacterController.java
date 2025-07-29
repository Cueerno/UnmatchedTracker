package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.CharacterService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/characters")
@RequiredArgsConstructor
public class CharacterController {

    private final CharacterService characterService;

    @GetMapping("top")
    public ResponseEntity<?> getFavoriteCharacters() {
        return ResponseEntity.ok(characterService.getRating());
    }
}
