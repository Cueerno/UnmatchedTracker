package com.radiuk.party_service.controller;

import com.radiuk.party_service.dto.PartyDto;
import com.radiuk.party_service.service.PartyService;
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
        partyService.createParty(partyDto);
        return ResponseEntity.ok(new MessageResponse("Party created successfully"));
    }
}
