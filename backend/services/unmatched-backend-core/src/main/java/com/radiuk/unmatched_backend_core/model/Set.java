package com.radiuk.unmatched_backend_core.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "sets")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Set {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    private String name;

    private String description;

    @Column(name = "release_date")
    private OffsetDateTime releaseDate;

    @OneToMany(mappedBy = "set")
    private List<Board> boards = new ArrayList<>();

    @OneToMany(mappedBy = "set")
    private List<Character> characters = new ArrayList<>();

}