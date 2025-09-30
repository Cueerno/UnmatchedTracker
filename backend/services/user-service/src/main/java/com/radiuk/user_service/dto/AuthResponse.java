package com.radiuk.user_service.dto;

public record AuthResponse(

        String accessToken,

        String tokenType,

        long expiresIn
) {
}
