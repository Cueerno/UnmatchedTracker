package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeckCardDto {

    private CardDto card;

    private Short boost;

    private Short quantity;

    private String imageUrl;
}
