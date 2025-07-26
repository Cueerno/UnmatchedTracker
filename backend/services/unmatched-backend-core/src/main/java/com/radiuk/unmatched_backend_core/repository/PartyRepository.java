package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Party;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PartyRepository extends JpaRepository<Party, Long> {
}