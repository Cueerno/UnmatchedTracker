package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;

@Getter
@Setter
@Entity
@Table(name = "decks")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Deck {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Short id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "set_id")
    private Set set;

    private String name;

    private String notes;

    @Column(name = "front_image_url")
    private String frontImageUrl;

    @Column(name = "back_image_url")
    private String backImageUrl;

    @OneToMany(mappedBy = "deck")
    private java.util.Set<Party> parties = new HashSet<>();

    @OneToOne(mappedBy = "deck")
    private Hero hero;

    @OneToOne(mappedBy = "deck")
    private Sidekick sidekick;

    @OneToMany(mappedBy = "deck")
    private java.util.Set<Card> cards = new HashSet<>();

    @OneToMany(mappedBy = "deck")
    private java.util.Set<RuleCard> ruleCards = new HashSet<>();

    @OneToMany(mappedBy = "deck")
    private java.util.Set<ExtraCharacter> extraCharacters = new HashSet<>();
}