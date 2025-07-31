package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.dto.CharacterRatingDto;
import com.radiuk.unmatched_backend_core.model.Character;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterRepository extends JpaRepository<Character, Short> {

    Optional<Character> findByName(String name);

    @Query(nativeQuery = true, value = """
    select
        c.*,
        count(*) usage_count
    from parties p
    join users u on p.user_id = u.id
    join characters c on p.character_id = c.id
    where u.username = :username
    group by c.id, c.set_id, c.name
    order by usage_count desc;
    """)
    List<Character> findFavoriteCharactersByUserUsername(String username, Pageable pageable);

    List<Character> findBySetName(String setName);

    @Query(nativeQuery = true, value = """
    select
        row_number() over (order by count(*) desc) rank,
        c.name,
        count(*) win_count
    from parties p
    join characters c on p.character_id = c.id
    where p.is_winner = true
    group by c.name
    order by win_count desc
    """)
    List<CharacterRatingDto> getTopByWins();
}