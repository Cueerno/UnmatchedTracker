package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import com.radiuk.unmatched_backend_core.mapper.BoardMapper;
import com.radiuk.unmatched_backend_core.repository.BoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;
    private final BoardMapper boardMapper;

    @Cacheable(value = "boardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<BoardDto> getAll(String sortBy, String direction) {
        log.debug("[BoardService] -> getAll called with sortBy={}, direction={}", sortBy, direction);

        List<BoardDto> boards = boardMapper.toDtos(boardRepository.findAll(getSort(sortBy, direction)));

        log.info("[BoardService] -> getAll finished successfully: found {} boards", boards.size());
        return boards;
    }

    @Cacheable(value = "board", key = "#name")
    @Transactional(readOnly = true)
    public BoardDto getByName(String name) {
        log.debug("[BoardService] -> getByName called with name={}", name);

        return boardRepository.findByName(name).map(board -> {
            BoardDto dto = boardMapper.toDto(board);
            log.info("[BoardService] -> getByName finished successfully: board retrieved with name={}", dto.getName());
            return dto;
        }).orElseThrow(() -> {
            log.warn("[BoardService] -> getByName entity not found: type=Board, key={}", name);
            return new EntityNotFoundException("Board with name " + name + " not found!");
        });
    }
}
