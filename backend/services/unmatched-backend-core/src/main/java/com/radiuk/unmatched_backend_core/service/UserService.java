package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.UserDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.mapper.UserMapper;
import com.radiuk.unmatched_backend_core.model.User;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import com.radiuk.unmatched_backend_core.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;
    private final UserMapper userMapper;

    @Transactional(readOnly = true)
    public List<DeckDto> getFavoriteCharactersByUsername(String username) {
        log.debug("[UserService] -> getFavoriteCharactersByUsername called with username={}", username);
        Pageable pageable = PageRequest.of(0, 3);
        List<DeckDto> favorites = deckMapper.toDtos(deckRepository.findFavoriteCharactersByUserUsername(username, pageable));
        log.info("[UserService] -> getFavoriteCharactersByUsername finished successfully: {} decks retrieved", favorites.size());
        return favorites;
    }

    @Transactional
    public void createUser(UserDto userDto) {
        log.debug("[UserService] -> createUser called with userDto={}", userDto);
        User user = userMapper.toEntity(userDto);
        user.setRegisteredAt(OffsetDateTime.now());
        userRepository.save(user);
        log.info("[UserService] -> createUser finished successfully for username={}", userDto.getUsername());
    }
}
