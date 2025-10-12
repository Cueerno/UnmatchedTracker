package com.radiuk.umdb_service.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "sidekicks", schema = "umdb-service")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Sidekick extends HeroBase {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;
}