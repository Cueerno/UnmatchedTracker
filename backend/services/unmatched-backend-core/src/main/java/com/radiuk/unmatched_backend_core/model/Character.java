package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "characters")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Character {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    private String name;

    private Short count;

    private Short hp;

    private Short move;

    @Column(name = "attack_type")
    @Enumerated(EnumType.STRING)
    private AttackType attackType;

    @OneToOne(mappedBy = "character")
    private Sidekick sidekick;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Set set;

    @OneToMany(mappedBy = "character")
    private List<Party> parties = new ArrayList<>();

}