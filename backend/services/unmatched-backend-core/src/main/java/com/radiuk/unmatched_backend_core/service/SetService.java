package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class SetService {

    private final SetCacheService setCacheService;

    public List<SetDto> getAll(String sortBy, String direction) {
        log.debug("[SetService] -> getAll called with sortBy={}, direction={}", sortBy, direction);
        List<SetDto> sets = setCacheService.getAllFromCache(sortBy, direction);
        log.info("[SetService] -> getAll finished successfully: {} sets retrieved", sets.size());
        return sets;
    }

    public SetDto getByName(String name) {
        log.debug("[SetService] -> getByName called with name={}", name);
        SetDto set = setCacheService.getFromCache(name);
        log.info("[SetService] -> getByName finished successfully: set={}", set.getName());
        return set;
    }
}
