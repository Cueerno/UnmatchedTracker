package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardCacheService boardCacheService;

    public List<BoardDto> getAll(String sortBy, String direction) {
        return boardCacheService.getAllFromCache(sortBy, direction);
    }

    public BoardDto getByName(String name) {
        return boardCacheService.getFromCache(name);
    }
}
