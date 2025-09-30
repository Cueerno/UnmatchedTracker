package com.radiuk.user_service.dto;

import java.time.Instant;

public record ResponseDto(

        String username,

        String email,

        Instant registeredAt
) {
}
