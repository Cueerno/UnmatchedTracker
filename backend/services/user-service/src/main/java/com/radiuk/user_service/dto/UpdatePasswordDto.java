package com.radiuk.user_service.dto;

public record UpdatePasswordDto(

        String currentPassword,

        String newPassword
) {
}
