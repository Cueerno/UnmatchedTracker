package com.radiuk.party_service.repository;

import com.radiuk.party_service.model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {


    List<Team> findByMatchId(Long matchId);
}