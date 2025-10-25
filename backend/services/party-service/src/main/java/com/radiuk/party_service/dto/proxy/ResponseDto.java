package com.radiuk.party_service.dto.proxy;

import java.time.Instant;

public record ResponseDto(

        Long id,
        String username,
        String email,
        Instant registeredAt
) {
}
