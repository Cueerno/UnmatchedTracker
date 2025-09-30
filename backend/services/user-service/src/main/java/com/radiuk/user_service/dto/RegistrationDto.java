package com.radiuk.user_service.dto;

public record RegistrationDto(

        String username,

        String password,

        String email
) {
}