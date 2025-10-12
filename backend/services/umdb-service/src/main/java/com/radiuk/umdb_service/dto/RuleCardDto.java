package com.radiuk.umdb_service.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RuleCardDto {

    private String title;

    private String text;

    private String quote;

    private String imageUrl;
}
