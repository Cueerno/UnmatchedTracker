package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.BoardDto;
import com.radiuk.umdb_service.mapper.BoardMapper;
import com.radiuk.umdb_service.repository.BoardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.umdb_service.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;
    private final BoardMapper boardMapper;

    @Cacheable(value = "boardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<BoardDto> getAll(String sortBy, String direction) {
        return boardMapper.toDtos(boardRepository.findAll(getSort(sortBy, direction)));
    }

    @Transactional(readOnly = true)
    @Cacheable(value = "board", key = "#id")
    public BoardDto getById(Short id) {
        return boardRepository.findById(id)
                .map(boardMapper::toDto)
                .orElseThrow(() -> new EntityNotFoundException("Board with id " + id + " not found!"));
    }

    @Transactional(readOnly = true)
    @Cacheable(value = "board", key = "#name")
    public BoardDto getByName(String name) {
        return boardRepository.findByName(name)
                .map(boardMapper::toDto)
                .orElseThrow(() -> new EntityNotFoundException("Board with name " + name + " not found!"));
    }
}
