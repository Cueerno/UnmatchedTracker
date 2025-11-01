package com.radiuk.party_service.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;
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
    private Instant created_at;

    @Builder.Default
    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToMany(mappedBy = "match", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Team> teams = new ArrayList<>();

    @Builder.Default
    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToMany(mappedBy = "match", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Party> parties = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private MatchFormat format;

    public enum MatchFormat {
        HEADS_UP, TEAMS, FREE_FOR_ALL, COOP_PLAY
    }
}