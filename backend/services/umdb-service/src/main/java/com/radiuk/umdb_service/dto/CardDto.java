package com.radiuk.umdb_service.dto;

import com.radiuk.umdb_service.model.types.CardType;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CardDto {

    private String title;

    private CardType type;

    private Short value;

    private String effect;
}
