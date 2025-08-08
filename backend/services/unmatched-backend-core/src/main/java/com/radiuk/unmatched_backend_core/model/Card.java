package com.radiuk.unmatched_backend_core.model;

import com.radiuk.unmatched_backend_core.model.types.CardType;
import jakarta.persistence.*;
import lombok.*;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;

    private String title;

    @Enumerated(EnumType.STRING)
    private CardType type;

    @Column(name = "character_name")
    private String characterName;

    private Short value;

    private Short boost;

    private Short quantity;

    @Column(name = "basic_text")
    private String basicText;

    @Column(name = "immediate_text")
    private String immediateText;

    @Column(name = "during_text")
    private String duringText;

    @Column(name = "after_text")
    private String afterText;

    @Column(name = "image_url")
    private String imageUrl;
}