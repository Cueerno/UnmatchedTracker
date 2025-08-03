package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.service.PartyService;
import com.radiuk.unmatched_backend_core.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class UserController {

    private final UserService userService;
    private final PartyService partyService;

    @GetMapping("/{username}")
    public ResponseEntity<?> getFavoriteCharacters(@PathVariable String username) {
        return ResponseEntity.ok(userService.getFavoriteCharactersByUsername(username));
    }

    @GetMapping("/{username}/parties")
    public ResponseEntity<?> getParties(@PathVariable String username) {
        return ResponseEntity.ok(partyService.getAllPartiesByUsername(username));
    }

    @PostMapping("")
    public ResponseEntity<?> createUser(@RequestBody UserDto userDto) {
        userService.createUser(userDto);
        return ResponseEntity.ok().build();
    }
}
