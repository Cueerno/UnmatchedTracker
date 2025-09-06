package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "extra_characters")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExtraCharacter extends HeroBase {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;
}