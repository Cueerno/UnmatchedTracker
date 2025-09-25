package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.mapper.UserMapper;
import com.radiuk.unmatched_backend_core.model.User;
import com.radiuk.unmatched_backend_core.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final CvsBackupService cvsBackupService;

    @Transactional
    public void createUser(UserDto userDto) {
        User user = userMapper.toEntity(userDto);

        User savedUser = userRepository.save(user);
        cvsBackupService.backupUser(savedUser);
    }
}
