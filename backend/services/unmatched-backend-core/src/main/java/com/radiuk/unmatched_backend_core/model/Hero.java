package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "heroes")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Hero extends HeroBase {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;

    @Column(name = "special_ability")
    private String specialAbility;
}