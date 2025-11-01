package com.radiuk.party_service.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "parties", schema = "party-service")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Party {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "move_order")
    private Short moveOrder;

    @Column(name = "final_hp")
    private Short finalHp;

    @Column(name = "is_winner")
    @Builder.Default
    private Boolean isWinner = false;

    @Column(name = "created_at")
    private Instant createdAt;

    @JoinColumn(name = "match_id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    private Match match;

    @JoinColumn(name = "team_id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    private Team team;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "deck_id")
    private Short deckId;

    @Column(name = "board_id")
    private Short boardId;

}