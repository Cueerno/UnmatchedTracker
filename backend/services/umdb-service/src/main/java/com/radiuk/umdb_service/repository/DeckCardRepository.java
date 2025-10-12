package com.radiuk.umdb_service.repository;

import com.radiuk.umdb_service.model.DeckCard;
import com.radiuk.umdb_service.model.id.DeckCardId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeckCardRepository extends JpaRepository<DeckCard, DeckCardId> {

}