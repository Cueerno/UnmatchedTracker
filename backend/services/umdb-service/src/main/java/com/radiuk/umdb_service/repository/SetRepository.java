package com.radiuk.umdb_service.repository;

import com.radiuk.umdb_service.dto.HomeDashboardSummary;
import com.radiuk.umdb_service.model.Set;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SetRepository extends JpaRepository<Set, Short> {

    @EntityGraph("Set.withAll")
    @Override
    List<Set> findAll(Sort sort);

    @EntityGraph("Set.withAll")
    Optional<Set> findByName(String name);

    @Query(nativeQuery = true, value = """
    select
        s.name,
        s.image_url
    from parties p
    join decks d on d.id = p.deck_id
    join sets s on s.id = d.set_id
    group by s.name, s.image_url
    order by sum(case when p.is_winner then 1 else 0 end )::float / count(*) desc
    limit 1;
    """)
    HomeDashboardSummary getTheStrongest();

    @Query(nativeQuery = true, value = """
    select
        s.name,
        s.image_url
    from parties p
    join decks d on d.id = p.deck_id
    join sets s on s.id = d.set_id
    group by s.name, s.image_url
    order by count(distinct p.match_id) desc
    limit 1;
    """)
    HomeDashboardSummary getTheMostPopular();
}