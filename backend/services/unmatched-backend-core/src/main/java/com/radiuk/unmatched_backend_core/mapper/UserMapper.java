package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.model.User;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserMapper {

    UserDto toDto(User board);

    User toEntity(UserDto userDto);

    List<UserDto> toDtos(List<User> boards);
}
