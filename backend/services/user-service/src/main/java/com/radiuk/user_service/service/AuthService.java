package com.radiuk.user_service.service;

import com.radiuk.user_service.annotation.NoLogging;
import com.radiuk.user_service.dto.*;
import com.radiuk.user_service.exception.UserNotCreatedException;
import com.radiuk.user_service.mapper.UserMapper;
import com.radiuk.user_service.model.User;
import com.radiuk.user_service.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CachePut;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JwtEncoder jwtEncoder;
    private final ApplicationEventPublisher applicationEventPublisher;

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

        applicationEventPublisher.publishEvent(new UserEvent(savedUser));

        return userMapper.toResponseDto(savedUser);
    }

    @NoLogging
    @Transactional(readOnly = true)
    @CachePut(value = "user", key = "#dto.username()")
    public AuthResponse authenticate(AuthDto dto) {
        String username = dto.username();
        log.debug("Authenticating user {}", username);

        User user = userRepository.findByUsername(dto.username())
                .orElseThrow(() -> {
                    log.warn("Authentication failed: user '{}' not found", username);
                    return new BadCredentialsException("Invalid credentials, user with this username not found");
                });


        if (!passwordEncoder.matches(dto.password(), user.getPassword())) {
            log.warn("Authentication failed: invalid password");
            throw new BadCredentialsException("Invalid credentials, invalid password");
        }

        log.info("Authenticated user {}", username);
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
