package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
public class SetService {

    private final SetCacheService setCacheService;

    public List<SetDto> getAll(String sortBy, String direction) {
        return setCacheService.getAllFromCache(sortBy, direction);
    }

    @Transactional(readOnly = true)
    public SetDto getByName(String setName) {
        return setCacheService.getFromCache(setName);
    }
}