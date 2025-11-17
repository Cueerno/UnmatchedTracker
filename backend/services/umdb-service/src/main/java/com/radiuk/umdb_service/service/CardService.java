package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.CardDto;
import com.radiuk.umdb_service.dto.CardWithDecksDto;

import java.util.List;

public interface CardService {

    List<CardDto> getAll(String sortBy, String direction);

    CardWithDecksDto getByTitle(String title);
}
