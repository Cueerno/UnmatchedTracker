package com.radiuk.user_service.service;

import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.dto.UpdateDto;
import com.radiuk.user_service.dto.UpdatePasswordDto;
import org.springframework.security.oauth2.jwt.Jwt;

public interface UserService {

    ResponseDto getById(Long id);

    ResponseDto getByUsername(String username);

    ResponseDto getMe(Jwt jwt);

    ResponseDto updateMe(UpdateDto updateDto, Jwt jwt);

    void deleteMe(Jwt jwt);

    void updatePassword(Jwt jwt, UpdatePasswordDto updatePasswordDto);
}
