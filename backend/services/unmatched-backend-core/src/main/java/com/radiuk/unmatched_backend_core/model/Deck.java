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
@NamedEntityGraph(
        name = "Deck.withAll",
        attributeNodes = {
                @NamedAttributeNode("set"),
                @NamedAttributeNode("hero"),
                @NamedAttributeNode("sidekick"),
                @NamedAttributeNode(value = "cards", subgraph = "deckCard-with-card"),
                @NamedAttributeNode("ruleCards"),
                @NamedAttributeNode("extraCharacters")
        },
        subgraphs = @NamedSubgraph(
                name = "deckCard-with-card",
                attributeNodes = @NamedAttributeNode("card")
        )
)
public class Deck {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "set_id")
    private Set set;

    private String name;

    private String notes;

    private String quote;

    @Column(name = "art_image_url")
    private String artImageUrl;

    @Column(name = "front_image_url")
    private String frontImageUrl;

    @Column(name = "back_image_url")
    private String backImageUrl;

    @Builder.Default
    @OneToMany(mappedBy = "deck")
    private java.util.Set<Party> parties = new HashSet<>();

    @OneToOne(mappedBy = "deck")
    private Hero hero;

    @OneToOne(mappedBy = "deck")
    private Sidekick sidekick;

    @Builder.Default
    @OneToMany(mappedBy = "deck")
    private java.util.Set<DeckCard> cards = new HashSet<>();

    @Builder.Default
    @OneToMany(mappedBy = "deck")
    private java.util.Set<RuleCard> ruleCards = new HashSet<>();

    @Builder.Default
    @OneToMany(mappedBy = "deck")
    private java.util.Set<ExtraCharacter> extraCharacters = new HashSet<>();
}