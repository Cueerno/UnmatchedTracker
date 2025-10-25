package com.radiuk.party_service.dto.proxy;


public record BoardDto (

        Short id,
        String name,
        Short maxPlayers,
        Short spaces,
        Short zones,
        String feature,
        String imageUrl
) {}