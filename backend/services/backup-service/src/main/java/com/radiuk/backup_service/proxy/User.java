package com.radiuk.backup_service.proxy;

import lombok.*;

import java.time.Instant;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private Long id;

    private String username;

    private String password;

    private String email;

    private Role role;

    private Instant registeredAt;

    private Instant updatedAt;

    public enum Role {
        USER,
        ADMIN
    }
}
