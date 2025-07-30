package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.CharacterDto;
import com.radiuk.unmatched_backend_core.dto.CharacterRatingDto;
import com.radiuk.unmatched_backend_core.mapper.CharacterMapper;
import com.radiuk.unmatched_backend_core.repository.CharacterRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CharacterService {

    private final CharacterRepository characterRepository;
    private final CharacterMapper characterMapper;

    @Transactional(readOnly = true)
    public List<CharacterDto> getAll() {
        return characterMapper.toDtos(characterRepository.findAll());
    }

    @Transactional(readOnly = true)
    public List<CharacterRatingDto> getRating() {
        return characterRepository.getRating();
    }

    @Transactional(readOnly = true)
    public CharacterDto getByName(String name) {
        return characterMapper.toDto(characterRepository.findByName(name).orElseThrow(EntityNotFoundException::new));
    }
}
