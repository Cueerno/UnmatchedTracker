package com.radiuk.user_service.service;

import com.radiuk.user_service.dto.AuthDto;
import com.radiuk.user_service.dto.AuthResponse;
import com.radiuk.user_service.dto.RegistrationDto;
import com.radiuk.user_service.dto.ResponseDto;

public interface AuthService {

    ResponseDto register(RegistrationDto userRegistrationDto);

    AuthResponse authenticate(AuthDto dto);
}
