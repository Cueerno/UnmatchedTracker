package com.radiuk.umdb_service.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "heroes", schema = "umdb-service")
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