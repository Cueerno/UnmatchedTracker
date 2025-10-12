package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.SetDto;
import com.radiuk.umdb_service.mapper.SetMapper;
import com.radiuk.umdb_service.repository.SetRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.umdb_service.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class SetService {

    private final SetRepository setRepository;
    private final SetMapper setMapper;

    @Cacheable(value = "setList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<SetDto> getAll(String sortBy, String direction) {
        return setMapper.toDtos(setRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "set", key = "#name")
    @Transactional(readOnly = true)
    public SetDto getByName(String name) {
        return setRepository.findByName(name)
                .map(setMapper::toDto)
                .orElseThrow(() -> new EntityNotFoundException("Set with name " + name + " not found!"));
    }
}
