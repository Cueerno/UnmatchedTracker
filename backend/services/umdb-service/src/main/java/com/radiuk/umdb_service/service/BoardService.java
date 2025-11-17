package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.BoardDto;

import java.util.List;

public interface BoardService {

    List<BoardDto> getAll(String sortBy, String direction);

    BoardDto getById(Short id);

    BoardDto getByName(String name);
}
