package com.radiuk.party_service.repository;

import com.radiuk.party_service.model.Party;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface PartyRepository extends JpaRepository<Party, Long> {

    List<Party> findByMatchId(Long matchId);

    @Query(nativeQuery = true, value = """
    select
        p.match_id
    from "party-service".parties p
    where p.user_id = :userId
    order by p.match_id desc;
    """)
    Set<Long> getPartiesByUserId(Long userId);

    @Query(nativeQuery = true, value = """
    select
        count(distinct p.match_id)
    from "party-service".parties p
    """)
    Long numberOfPartes();
}