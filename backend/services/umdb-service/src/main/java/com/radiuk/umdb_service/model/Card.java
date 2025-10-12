package com.radiuk.umdb_service.model;

import com.radiuk.umdb_service.model.types.CardType;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "cards", schema = "umdb-service")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedEntityGraph(
        name = "Card.withDecks",
        attributeNodes = {
                @NamedAttributeNode(value = "decks", subgraph = "deckCard-subgraph")
        },
        subgraphs = {
                @NamedSubgraph(
                        name = "deckCard-subgraph",
                        attributeNodes = {
                                @NamedAttributeNode(value = "deck", subgraph = "deck-subgraph")
                        }
                ),
                @NamedSubgraph(
                        name = "deck-subgraph",
                        attributeNodes = {
                                @NamedAttributeNode("hero"),
                                @NamedAttributeNode("sidekick")
                        }
                )
        }
)
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Builder.Default
    @OneToMany(mappedBy = "card")
    private Set<DeckCard> decks = new HashSet<>();

    private String title;

    @Enumerated(EnumType.STRING)
    private CardType type;

    private Short value;

    private String effect;
}