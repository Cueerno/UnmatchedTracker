package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
