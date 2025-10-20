package com.radiuk.party_service.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "matches")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String note;

    @Column(name = "created_at")
    private OffsetDateTime created_at;

    @Builder.Default
    @OneToMany(mappedBy = "match")
    private List<Team> teams = new ArrayList<>();

    @Builder.Default
    @OneToMany(mappedBy = "match")
    private List<Party> parties = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private MatchFormat format;

    public enum MatchFormat {
        HEADS_UP, TEAMS, FREE_FOR_ALL, COOP_PLAY
    }
}