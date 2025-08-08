package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.model.Deck;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DeckRepository extends JpaRepository<Deck, Short> {

    @EntityGraph(attributePaths = {"hero", "sidekick", "ruleCards", "extraCharacters", "cards"})
    @Override
    List<Deck> findAll(Sort sort);

    @EntityGraph(attributePaths = {"hero", "sidekick", "ruleCards", "extraCharacters", "cards"})
    Optional<Deck> findByName(String name);

    @Query(nativeQuery = true, value = """
    select
        s.name
    from decks d
    join sets s on d.set_id = s.id
    where d.name = :name
    """)
    String getSetNameByName(String name);

    @Query(nativeQuery = true, value = """
    select
        d.*,
        count(*) usage_count
    from parties p
    join users u on p.user_id = u.id
    join decks d on p.deck_id = d.id
    where u.username = :username
    group by d.id, d.set_id, d.name
    order by usage_count desc;
    """)
    List<Deck> findFavoriteCharactersByUserUsername(String username, Pageable pageable);

    @Query(nativeQuery = true, value = """
    select
        row_number() over (order by count(*) desc) rank,
        d.name,
        count(*) win_count
    from parties p
    join decks d on p.deck_id = d.id
    join matches m on p.match_id = m.id
    where p.is_winner = true and m.format like :formatName
    group by d.name
    order by win_count desc
    """)
    List<DeckRatingDto> getTop(String formatName);
}