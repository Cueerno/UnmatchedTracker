package com.radiuk.unmatched_backend_core.dto;

import com.radiuk.unmatched_backend_core.model.Card;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CardDto {

    private String title;

    private Card.CardType type;

    private String characterName;

    private Short value;

    private Short boost;

    private Short quantity;

    private String basicText;

    private String immediateText;

    private String duringText;

    private String afterText;

    private String imageUrl;
}
