package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.dto.DashboardBoardDto;
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
        b.name, b.max_players, b.spaces, b.zones, b.image_url
    from parties p
    join boards b on p.board_id = b.id
    group by b.name, b.max_players, b.spaces, b.zones, b.image_url
    order by count(distinct match_id) desc
    limit 1;
    """)
    DashboardBoardDto getTheMostPopular();
}