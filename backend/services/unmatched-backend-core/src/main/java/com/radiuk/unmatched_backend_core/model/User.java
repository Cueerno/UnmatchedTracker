package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "users")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;

    @Column(name = "registered_at")
    private OffsetDateTime registeredAt;


    @OneToMany(mappedBy = "user")
    private List<Party> parties = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private List<TeamMember> teamMembers = new ArrayList<>();

}