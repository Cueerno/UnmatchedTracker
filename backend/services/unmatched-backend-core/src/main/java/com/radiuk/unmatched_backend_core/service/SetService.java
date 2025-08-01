package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import com.radiuk.unmatched_backend_core.mapper.*;
import com.radiuk.unmatched_backend_core.model.Board;
import com.radiuk.unmatched_backend_core.model.Character;
import com.radiuk.unmatched_backend_core.model.Set;
import com.radiuk.unmatched_backend_core.repository.BoardRepository;
import com.radiuk.unmatched_backend_core.repository.CharacterRepository;
import com.radiuk.unmatched_backend_core.repository.SetRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SetService {

    private final SetRepository setRepository;
    private final CharacterRepository characterRepository;
    private final BoardRepository boardRepository;
    private final BoardMapper boardMapper;
    private final CharacterMapper characterMapper;

    @Transactional(readOnly = true)
    public SetDto getByName(String setName) {
        Set set = setRepository.findByName(setName).orElseThrow(() -> new EntityNotFoundException("Set with name " + setName + " not found!"));
        List<Character> characters = characterRepository.findBySetName(setName);
        List<Board> boards = boardRepository.findBySetName(setName);

        return SetDto.builder()
                .name(setName)
                .characters(characterMapper.toDtos(characters))
                .description(set.getDescription())
                .boards(boardMapper.toDtos(boards))
                .releaseDate(set.getReleaseDate())
                .build();
    }
}
