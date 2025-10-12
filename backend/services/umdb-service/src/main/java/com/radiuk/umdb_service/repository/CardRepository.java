package com.radiuk.umdb_service.repository;

import com.radiuk.umdb_service.model.Card;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CardRepository extends JpaRepository<Card, Long> {

    @EntityGraph(value = "Card.withDecks")
    Optional<Card> findByTitle(String title);
}
