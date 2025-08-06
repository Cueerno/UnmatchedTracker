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
public class Hero {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    private String name;

    private String specialAbility;

    private Short quantity;

    private Short hp;

    private Short move;

    @Column(name = "attack_type")
    @Enumerated(EnumType.STRING)
    private AttackType attackType;

    @Column(name = "image_url")
    private String imageUrl;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "deck_id", nullable = false)
    private Deck deck;

}