package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import com.radiuk.unmatched_backend_core.mapper.BoardMapper;
import com.radiuk.unmatched_backend_core.repository.BoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class BoardCacheService {

    private final BoardRepository boardRepository;
    private final BoardMapper boardMapper;

    @Cacheable(value = "boardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<BoardDto> getAllFromCache(String sortBy, String direction) {
        return boardMapper.toDtos(boardRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "board", key = "#name")
    public BoardDto getFromCache(String name) {
        return boardMapper.toDto(boardRepository.findByName(name).orElseThrow(() -> new EntityNotFoundException("Board with name " + name + " not found!")));
    }
}
