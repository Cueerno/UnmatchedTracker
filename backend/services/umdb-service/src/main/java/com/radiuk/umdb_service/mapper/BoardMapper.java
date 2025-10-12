package com.radiuk.umdb_service.mapper;

import com.radiuk.umdb_service.dto.BoardDto;
import com.radiuk.umdb_service.model.Board;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface BoardMapper {

    BoardDto toDto(Board board);

    List<BoardDto> toDtos(List<Board> boards);
}
