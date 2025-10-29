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
    public ResponseEntity<?> getById(@PathVariable Long matchId) {
        return ResponseEntity.ok(partyService.getPartyByMatchId(matchId));
    }

    @GetMapping("/user/{username}")
    public ResponseEntity<?> getUsersPatry(@PathVariable String username) {
        return ResponseEntity.ok(partyService.getAllPartiesByUsername(username));
    }

    @PostMapping("")
    public ResponseEntity<?> create(@RequestBody PartyDto partyDto) {
        partyService.createParty(partyDto);
        return ResponseEntity.ok(new MessageResponse("Party created successfully"));
    }

    @PatchMapping("/{matchId}")
    public ResponseEntity<?> update(@PathVariable Long matchId) {
        partyService.update(matchId);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{matchId}")
    public ResponseEntity<?> delete(@PathVariable Long matchId) {
        partyService.delete(matchId);
        return ResponseEntity.noContent().build();
    }
}
