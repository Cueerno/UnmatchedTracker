package com.radiuk.umdb_service.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "rule_cards", schema = "umdb-service")
public class RuleCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id")
    private Deck deck;

    private String title;

    private String text;

    private String quote;

    @Column(name = "image_url")
    private String imageUrl;
}