package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BoardRepository extends JpaRepository<Board, Short> {

    Optional<Board> findByName(String name);

    @Query(nativeQuery = true, value = """
    select
        b.*
    from parties p
    join boards b on p.board_id = b.id
    group by b.id, set_id, name, max_players, spaces, zones, feature, image_url
    order by count(distinct match_id) desc
    limit 1;
    """)
    Board getTheMostPopular();
}