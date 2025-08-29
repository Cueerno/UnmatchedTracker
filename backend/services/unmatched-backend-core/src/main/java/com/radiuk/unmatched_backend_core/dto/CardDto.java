package com.radiuk.unmatched_backend_core.dto;

import com.radiuk.unmatched_backend_core.model.types.CardType;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CardDto {

    private String title;

    private CardType type;

    private Short value;

    private String effect;
}
