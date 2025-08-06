package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.mapper.UserMapper;
import com.radiuk.unmatched_backend_core.model.User;
import com.radiuk.unmatched_backend_core.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;
    private final UserMapper userMapper;

    @Transactional(readOnly = true)
    public List<DeckDto> getFavoriteCharactersByUsername(String usernmame) {
        Pageable pageable = PageRequest.of(0, 3);
        return deckMapper.toDtos(deckRepository.findFavoriteCharactersByUserUsername(usernmame, pageable));
    }

    @Transactional
    public void createUser(UserDto userDto) {
        User user = userMapper.toEntity(userDto);
        user.setRegisteredAt(OffsetDateTime.now());
        userRepository.save(user);
    }
}
