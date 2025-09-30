package com.radiuk.user_service.service;

import com.radiuk.user_service.dto.AuthDto;
import com.radiuk.user_service.dto.AuthResponse;
import com.radiuk.user_service.dto.RegistrationDto;
import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.exception.UserNotCreatedException;
import com.radiuk.user_service.mapper.UserMapper;
import com.radiuk.user_service.model.User;
import com.radiuk.user_service.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.JwsHeader;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JwtEncoder jwtEncoder;

    @Value("${jwt.expiration}")
    private long tokenExpirySeconds;

    @Transactional
    public ResponseDto register(RegistrationDto userRegistrationDto) {
        if (userRepository.existsByEmail(userRegistrationDto.email())) {
            throw new UserNotCreatedException("User with this email already exists");
        }

        if (userRepository.existsByUsername(userRegistrationDto.username())) {
            throw new UserNotCreatedException("User with this username already exists");
        }

        User user = userMapper.fromRegistrationDto(userRegistrationDto);
        user.setPassword(passwordEncoder.encode(userRegistrationDto.password()));
        user.setRole(User.Role.USER);

        User savedUser = userRepository.save(user);

        return userMapper.toResponseDto(savedUser);
    }

    @Transactional(readOnly = true)
    public AuthResponse authenticate(AuthDto dto) {
        User user = userRepository.findByUsername(dto.username())
                .orElseThrow(() -> new BadCredentialsException("Invalid credentials, user with this username not found"));

        if (!passwordEncoder.matches(dto.password(), user.getPassword())) {
            throw new BadCredentialsException("Invalid credentials, invalid password");
        }

        return new AuthResponse(generateToken(user), "Bearer", tokenExpirySeconds);
    }

    private String generateToken(User user) {
        Instant now = Instant.now();
        JwtClaimsSet claims = JwtClaimsSet.builder()
                .issuer("user-service")
                .issuedAt(now)
                .expiresAt(now.plusSeconds(tokenExpirySeconds))
                .subject(user.getUsername())
                .claim("authorities", user.getRole().name())
                .claim("userId", user.getId())
                .build();

        JwtEncoderParameters params = JwtEncoderParameters.from(
                JwsHeader.with(MacAlgorithm.HS256).build(), claims
        );

        return jwtEncoder.encode(params).getTokenValue();
    }
}
