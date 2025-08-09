package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardCacheService boardCacheService;

    @Transactional(readOnly = true)
    public List<BoardDto> getAll(String sortBy, String direction) {
        return boardCacheService.getAllFromCache(sortBy, direction);
    }

    @Transactional(readOnly = true)
    public BoardDto getByName(String name) {
        return boardCacheService.getFromCache(name);
    }
}
