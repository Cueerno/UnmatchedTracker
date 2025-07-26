package com.radiuk.unmatched_backend_core.repository;

import com.radiuk.unmatched_backend_core.model.TeamMember;
import com.radiuk.unmatched_backend_core.model.id.TeamMemberId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamMemberRepository extends JpaRepository<TeamMember, TeamMemberId> {
}