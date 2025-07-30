package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.service.PartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/parties")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class PartyController {

    private final PartyService partyService;

    @GetMapping("/{matchId}")
    public ResponseEntity<?> getPatry(@PathVariable Long matchId) {
        return ResponseEntity.ok(partyService.getPartyByMatchId(matchId));
    }

    @PostMapping("")
    public ResponseEntity<?> createParty(@RequestBody PartyDto partyDto) {
        return ResponseEntity.ok(partyService.createParty(partyDto));
    }
}
