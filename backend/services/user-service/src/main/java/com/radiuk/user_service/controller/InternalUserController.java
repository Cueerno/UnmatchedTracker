package com.radiuk.user_service.controller;

import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/internal/users")
public class InternalUserController {

    private final UserService userService;

    @GetMapping("/id/{id}")
    public ResponseEntity<ResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.status(HttpStatus.OK).body(userService.getById(id));
    }

    @GetMapping("/username/{username}")
    public ResponseEntity<ResponseDto> getByUsername(@PathVariable String username) {
        return ResponseEntity.status(HttpStatus.OK).body(userService.getByUsername(username));
    }
}