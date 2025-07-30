package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.BoardDto;
import com.radiuk.unmatched_backend_core.model.Board;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface BoardMapper {

    BoardDto toDto(Board board);

    List<BoardDto> toDtos(List<Board> boards);
}
