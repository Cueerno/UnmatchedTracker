package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {
}