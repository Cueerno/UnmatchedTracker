package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "sidekicks")
public class Sidekick {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Short id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id")
    private Character character;

    private String name;

    private Short count;

    private Short hp;

    private Short move;

    @Column(name = "attack_type")
    @Enumerated(EnumType.STRING)
    private AttackType attackType;
}