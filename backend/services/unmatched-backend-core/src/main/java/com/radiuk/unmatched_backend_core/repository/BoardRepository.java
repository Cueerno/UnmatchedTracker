package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BoardRepository extends JpaRepository<Board, Short> {

    Optional<Board> findByName(String name);

    List<Board> findBySetName(String setName);
}