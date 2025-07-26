package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.CharacterDto;
import com.radiuk.unmatched_backend_core.model.Character;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CharacterMapper {

    CharacterDto toDto(Character character);

    List<CharacterDto> toDtos(List<Character> characters);
}
