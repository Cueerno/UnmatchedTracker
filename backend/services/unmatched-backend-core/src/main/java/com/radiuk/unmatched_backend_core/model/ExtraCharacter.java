package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "extra_characters")
public class ExtraCharacter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;

    private String name;

    @Column(name = "special_ability")
    private String specialAbility;

    private Short quantity;

    private Short hp;

    private Short move;

    @Column(name = "attack_type")
    private String attackType;

    @Column(name = "image_url")
    private String imageUrl;

}