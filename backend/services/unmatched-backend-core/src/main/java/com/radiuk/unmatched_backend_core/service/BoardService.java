package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardCacheService boardCacheService;

    public List<BoardDto> getAll(String sortBy, String direction) {
        log.debug("[BoardService] -> getAll called with sortBy={}, direction={}", sortBy, direction);
        List<BoardDto> boards = boardCacheService.getAllFromCache(sortBy, direction);
        log.info("[BoardService] -> getAll finished successfully: {} boards retrieved", boards.size());
        return boards;
    }

    public BoardDto getByName(String name) {
        log.debug("[BoardService] -> getByName called with name={}", name);
        BoardDto board = boardCacheService.getFromCache(name);
        log.info("[BoardService] -> getByName finished successfully: board={}", board.getName());
        return board;
    }
}
