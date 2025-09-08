package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.DeckCard;
import com.radiuk.unmatched_backend_core.model.id.DeckCardId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeckCardRepository extends JpaRepository<DeckCard, DeckCardId> {

}