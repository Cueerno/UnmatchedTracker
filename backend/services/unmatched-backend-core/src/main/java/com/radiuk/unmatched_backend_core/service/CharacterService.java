package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.CharacterDto;
import com.radiuk.unmatched_backend_core.dto.CharacterRatingDto;
import com.radiuk.unmatched_backend_core.mapper.CharacterMapper;
import com.radiuk.unmatched_backend_core.repository.CharacterRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CharacterService {

    private final CharacterRepository characterRepository;
    private final CharacterMapper characterMapper;

    @Transactional(readOnly = true)
    public List<CharacterDto> getAll(String sortBy, String direction) {
        String sortField = (sortBy == null || sortBy.isBlank()) ? "name" : sortBy;
        String dirParam = (direction == null || direction.isBlank()) ? "asc" : direction;

        Sort.Direction dir = Sort.Direction.fromString(dirParam.toLowerCase());

        Sort sort = Sort.by(dir, sortField);

        return characterMapper.toDtos(characterRepository.findAll(sort));
    }

    @Transactional(readOnly = true)
    public List<CharacterRatingDto> getTopByWins() {
        return characterRepository.getTopByWins();
    }

    @Transactional(readOnly = true)
    public CharacterDto getByName(String name) {
        return characterMapper.toDto(characterRepository.findByName(name).orElseThrow(() -> new EntityNotFoundException("Character with name " + name + " not found!")));
    }
}
