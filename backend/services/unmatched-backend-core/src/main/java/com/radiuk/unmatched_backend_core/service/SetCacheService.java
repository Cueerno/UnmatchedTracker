package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import com.radiuk.unmatched_backend_core.mapper.SetMapper;
import com.radiuk.unmatched_backend_core.repository.SetRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class SetCacheService {

    private final SetRepository setRepository;
    private final SetMapper setMapper;

    @Cacheable(value = "setList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<SetDto> getAllFromCache(String sortBy, String direction) {
        return setMapper.toDtos(setRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "set", key = "#setName")
    @Transactional(readOnly = true)
    public SetDto getFromCache(String setName) {
        return setMapper.toDto(setRepository.findByName(setName).orElseThrow(() -> new EntityNotFoundException("Set with name " + setName + " not found!")));
    }
}
