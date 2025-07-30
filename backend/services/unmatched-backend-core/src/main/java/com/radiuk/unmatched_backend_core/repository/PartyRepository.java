package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Party;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PartyRepository extends JpaRepository<Party, Long> {

    List<Party> findByMatchId(Long matchId);

    @Query(nativeQuery = true, value = """
    select
        p.match_id
    from parties p
    where p.user_id = :userId;
    """)
    List<Long> getPartiesByUserId(Long userId);
}