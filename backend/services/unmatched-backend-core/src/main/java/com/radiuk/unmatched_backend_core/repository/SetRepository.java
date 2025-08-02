package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Set;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
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
}