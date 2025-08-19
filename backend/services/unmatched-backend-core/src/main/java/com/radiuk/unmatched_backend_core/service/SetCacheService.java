package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import com.radiuk.unmatched_backend_core.mapper.SetMapper;
import com.radiuk.unmatched_backend_core.repository.SetRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Slf4j
@Service
@RequiredArgsConstructor
public class SetCacheService {

    private final SetRepository setRepository;
    private final SetMapper setMapper;

    @Cacheable(value = "setList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<SetDto> getAllFromCache(String sortBy, String direction) {
        log.debug("[SetCacheService] -> getAllFromCache called with sortBy={}, direction={}", sortBy, direction);

        List<SetDto> sets = setMapper.toDtos(setRepository.findAll(getSort(sortBy, direction)));

        log.info("[SetCacheService] -> getAllFromCache finished successfully: found {} sets", sets.size());
        return sets;
    }

    @Cacheable(value = "set", key = "#name")
    @Transactional(readOnly = true)
    public SetDto getFromCache(String name) {
        log.debug("[SetCacheService] -> getFromCache called with name={}", name);

        return setRepository.findByName(name).map(entity -> {
            SetDto dto = setMapper.toDto(entity);
            log.info("[SetCacheService] -> getFromCache finished successfully: set retrieved with name={}", dto.getName());
            return dto;
        }).orElseThrow(() -> {
            log.warn("[SetCacheService] -> getFromCache entity not found: type=Set, key={}", name);
            return new EntityNotFoundException("Set with name " + name + " not found!");
        });
    }
}
