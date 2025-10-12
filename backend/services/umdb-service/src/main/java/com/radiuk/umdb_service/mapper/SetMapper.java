package com.radiuk.umdb_service.mapper;

import com.radiuk.umdb_service.dto.SetDto;
import com.radiuk.umdb_service.model.Set;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface SetMapper {

    SetDto toDto(Set set);

    List<SetDto> toDtos(List<Set> sets);
}
