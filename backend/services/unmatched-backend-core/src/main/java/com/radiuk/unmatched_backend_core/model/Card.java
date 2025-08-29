package com.radiuk.unmatched_backend_core.model;

import com.radiuk.unmatched_backend_core.model.types.CardType;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "cards")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "card")
    private Set<DeckCard> decks = new HashSet<>();

    private String title;

    @Enumerated(EnumType.STRING)
    private CardType type;

    private Short value;

    private String effect;
}