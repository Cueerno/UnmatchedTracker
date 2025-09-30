package com.radiuk.user_service.controller;

import com.radiuk.user_service.dto.AuthDto;
import com.radiuk.user_service.dto.AuthResponse;
import com.radiuk.user_service.dto.RegistrationDto;
import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthService authService;

    @GetMapping
    public ResponseEntity<String> hello() {
        return new ResponseEntity<>("Hello", HttpStatus.OK);
    }

    @PostMapping("/register")
    public ResponseEntity<ResponseDto> register(@RequestBody RegistrationDto userRegistrationDto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(authService.register(userRegistrationDto));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody AuthDto userAuthDto) {
        return ResponseEntity.ok(authService.authenticate(userAuthDto));
    }
}
