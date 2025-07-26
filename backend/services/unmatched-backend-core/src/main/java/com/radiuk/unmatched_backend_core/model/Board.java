package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "boards")
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Short id;

    private String name;

    @Column(name = "max_players")
    private Short maxPlayers;

    private Short spaces;

    private Short zones;

    private String feature;

    @Column(name = "image_url")
    private String imageUrl;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "set_id")
    private Set set;

    @OneToMany(mappedBy = "board")
    private List<Party> parties = new ArrayList<>();
}