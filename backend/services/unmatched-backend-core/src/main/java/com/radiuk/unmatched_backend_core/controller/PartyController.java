package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.PartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/parties")
@RequiredArgsConstructor
public class PartyController {

    private final PartyService partyService;

    @GetMapping("/{matchId}")
    public ResponseEntity<?> getPatry(@PathVariable Long matchId) {
        return ResponseEntity.ok(partyService.getPartyByMatchId(matchId));
    }
}
