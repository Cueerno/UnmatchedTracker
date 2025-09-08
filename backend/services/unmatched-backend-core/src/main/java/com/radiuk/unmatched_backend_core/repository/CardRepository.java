package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Card;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CardRepository extends JpaRepository<Card, Long> {

    @EntityGraph(value = "Card.withDecks")
    Optional<Card> findByTitle(String title);
}
