package com.radiuk.user_service.controller;

import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.dto.UpdateDto;
import com.radiuk.user_service.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;

    @GetMapping("/me")
    public ResponseEntity<ResponseDto> getMe(@AuthenticationPrincipal Jwt jwt) {
        return ResponseEntity.status(HttpStatus.OK).body(userService.getMe(jwt));
    }

    @PatchMapping("/me")
    public ResponseEntity<ResponseDto> updateMe(@RequestBody UpdateDto updateDto, @AuthenticationPrincipal Jwt jwt) {
        return ResponseEntity.status(HttpStatus.OK).body(userService.updateMe(updateDto, jwt));
    }

    @DeleteMapping("/me")
    public ResponseEntity<Void> deleteMe(@AuthenticationPrincipal Jwt jwt) {
        userService.deleteMe(jwt);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
