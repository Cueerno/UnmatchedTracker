package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Match;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatchRepository extends JpaRepository<Match, Long> {
}