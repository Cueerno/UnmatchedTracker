package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.HashSet;

@Getter
@Setter
@Entity
@Table(name = "sets")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedEntityGraph(
        name = "Set.withAll",
        attributeNodes = {
                @NamedAttributeNode("boards"),
                @NamedAttributeNode(value = "characters", subgraph = "character-sidekick")
        },
        subgraphs = {
                @NamedSubgraph(
                        name = "character-sidekick",
                        attributeNodes = @NamedAttributeNode("sidekick")
                )
        }
)
public class Set {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    private String name;

    private String description;

    @Column(name = "release_date")
    private OffsetDateTime releaseDate;

    @OneToMany(mappedBy = "set")
    private java.util.Set<Board> boards = new HashSet<>();

    @OneToMany(mappedBy = "set")
    private java.util.Set<Character> characters = new HashSet<>();

}