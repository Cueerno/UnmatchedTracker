package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import com.radiuk.unmatched_backend_core.model.Set;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface SetMapper {

    SetDto toDto(Set set);
}
