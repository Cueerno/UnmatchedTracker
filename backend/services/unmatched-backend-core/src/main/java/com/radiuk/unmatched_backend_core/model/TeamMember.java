package com.radiuk.unmatched_backend_core.model;

import com.radiuk.unmatched_backend_core.model.id.TeamMemberId;
import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@Entity
@Table(name = "team_members")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamMember {
    @EmbeddedId
    private TeamMemberId id;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id")
    private User user;

    @MapsId("teamId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "team_id")
    private Team team;
}