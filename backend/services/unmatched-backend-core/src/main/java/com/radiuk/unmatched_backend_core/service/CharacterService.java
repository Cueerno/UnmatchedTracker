package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.CharacterRatingDto;
import com.radiuk.unmatched_backend_core.repository.CharacterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CharacterService {

    private final CharacterRepository characterRepository;

    @Transactional(readOnly = true)
    public List<CharacterRatingDto> getRating() {
        return characterRepository.getRating();
    }
}
