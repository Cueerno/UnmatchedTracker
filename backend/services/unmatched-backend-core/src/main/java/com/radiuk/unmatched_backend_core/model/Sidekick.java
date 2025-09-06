package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "sidekicks")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Sidekick extends HeroBase {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;
}