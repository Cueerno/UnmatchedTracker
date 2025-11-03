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
    public ResponseEntity<?> getPartiesByUserUsername(@PathVariable String username) {
        return ResponseEntity.ok(partyService.getPartiesByUserUsername(username));
    }

    @PostMapping("")
    public ResponseEntity<?> create(@RequestBody PartyDto partyDto) {
        partyService.create(partyDto);
        return ResponseEntity.ok(new MessageResponse("Party created successfully"));
    }

    @PatchMapping("/{matchId}")
    public ResponseEntity<?> update(@PathVariable Long matchId, @RequestBody PartyDto updatedPartyDto) {
        partyService.update(matchId, updatedPartyDto);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{matchId}")
    public ResponseEntity<?> delete(@PathVariable Long matchId) {
        partyService.delete(matchId);
        return ResponseEntity.noContent().build();
    }
}
