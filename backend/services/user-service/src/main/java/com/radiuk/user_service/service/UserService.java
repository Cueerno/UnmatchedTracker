package com.radiuk.user_service.service;

import com.radiuk.user_service.dto.ResponseDto;
import com.radiuk.user_service.dto.UpdateDto;
import com.radiuk.user_service.exception.UserNotFoundException;
import com.radiuk.user_service.exception.UserNotUpdatedException;
import com.radiuk.user_service.mapper.UserMapper;
import com.radiuk.user_service.model.User;
import com.radiuk.user_service.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @Transactional(readOnly = true)
    public ResponseDto getMe(Jwt jwt) {
        String username = jwt.getSubject();

        return userRepository.findByUsername(username)
                .map(userMapper::toResponseDto)
                .orElseThrow(() -> new UserNotFoundException("User not found"));
    }

    @Transactional
    public ResponseDto updateMe(UpdateDto updateDto, Jwt jwt) {
        String email = jwt.getSubject();

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        if (updateDto.email() != null && !updateDto.email().equals(user.getEmail())
                && userRepository.existsByEmail(updateDto.email())) {
            throw new UserNotUpdatedException("User with this email already exists");
        }

        if (updateDto.username() != null && !updateDto.username().equals(user.getUsername())
                && userRepository.existsByUsername(updateDto.username())) {
            throw new UserNotUpdatedException("User with this username already exists");
        }

        userMapper.updateUserFromDto(updateDto, user);

        User updatedUser = userRepository.save(user);


        return userMapper.toResponseDto(updatedUser);
    }

    @Transactional
    public void deleteMe(Jwt jwt) {
        String email = jwt.getSubject();

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        userRepository.deleteById(user.getId());
    }
}
