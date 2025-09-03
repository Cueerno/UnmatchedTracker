package com.radiuk.unmatched_backend_core.model;

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

    @OneToMany(mappedBy = "match")
    private List<Team> teams = new ArrayList<>();

    @OneToMany(mappedBy = "match")
    private List<Party> parties = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private MatchFormat format;

    public enum MatchFormat {
        HEADS_UP, TEAMS, FREE_FOR_ALL, COOP_PLAY
    }
}