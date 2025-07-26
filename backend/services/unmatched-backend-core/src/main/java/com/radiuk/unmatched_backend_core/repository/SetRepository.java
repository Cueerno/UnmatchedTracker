package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SetRepository extends JpaRepository<Set, Short> {
}