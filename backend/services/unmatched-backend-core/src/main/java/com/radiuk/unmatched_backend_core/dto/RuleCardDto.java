package com.radiuk.unmatched_backend_core.dto;

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
