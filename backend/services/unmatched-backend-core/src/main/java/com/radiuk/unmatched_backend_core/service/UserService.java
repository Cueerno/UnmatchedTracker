package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.mapper.UserMapper;
import com.radiuk.unmatched_backend_core.model.User;
import com.radiuk.unmatched_backend_core.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @Transactional
    public void createUser(UserDto userDto) {
        log.debug("[UserService] -> createUser called with userDto={}", userDto);
        User user = userMapper.toEntity(userDto);
        user.setRegisteredAt(OffsetDateTime.now());
        userRepository.save(user);
        log.info("[UserService] -> createUser finished successfully for username={}", userDto.getUsername());
    }
}
