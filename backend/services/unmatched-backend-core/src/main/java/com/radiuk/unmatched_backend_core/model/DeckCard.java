package com.radiuk.unmatched_backend_core.model;

import com.radiuk.unmatched_backend_core.model.id.DeckCardId;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Builder
@Table(name = "decks_cards")
@NoArgsConstructor
@AllArgsConstructor
public class DeckCard {
    @EmbeddedId
    private DeckCardId id;

    @MapsId("deckId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;

    @MapsId("cardId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_id")
    private Card card;

    @Column(name = "character_name")
    private String characterName;

    private Short boost;

    private Short quantity;

    @Column(name = "image_url")
    private String imageUrl;
}