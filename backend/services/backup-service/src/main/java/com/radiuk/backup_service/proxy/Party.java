package com.radiuk.backup_service.proxy;

import lombok.*;

import java.time.Instant;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Party {

    private Long id;

    private Short moveOrder;

    private Short finalHp;

    private Boolean isWinner;

    private Instant createdAt;

    private Long matchId;

    private Long teamId;

    private Long userId;

    private Short deckId;

    private Short boardId;
}
