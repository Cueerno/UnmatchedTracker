package com.radiuk.user_service.mapper;

import com.radiuk.user_service.dto.RegistrationDto;
import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.dto.UpdateDto;
import com.radiuk.user_service.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface UserMapper {

    ResponseDto toResponseDto(User user);

    User fromRegistrationDto(RegistrationDto registrationDto);

    void updateUserFromDto(UpdateDto updateDto, @MappingTarget User user);
}
