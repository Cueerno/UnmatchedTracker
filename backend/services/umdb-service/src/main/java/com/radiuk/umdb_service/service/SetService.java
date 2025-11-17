package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.SetDto;

import java.util.List;

public interface SetService {

    List<SetDto> getAll(String sortBy, String direction);

    SetDto getByName(String name);
}
