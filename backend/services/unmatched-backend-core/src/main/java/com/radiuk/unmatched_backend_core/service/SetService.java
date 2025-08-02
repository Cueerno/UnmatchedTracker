package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.SetDto;
import com.radiuk.unmatched_backend_core.mapper.*;
import com.radiuk.unmatched_backend_core.model.Set;
import com.radiuk.unmatched_backend_core.repository.SetRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;


@Service
@RequiredArgsConstructor
public class SetService {

    private final SetRepository setRepository;
    private final SetMapper setMapper;

    @Transactional(readOnly = true)
    public List<SetDto> getAll(String sortBy, String direction) {
        return setMapper.toDtos(setRepository.findAll(getSort(sortBy, direction)));
    }

    @Transactional(readOnly = true)
    public SetDto getByName(String setName) {
        Set set = setRepository.findByName(setName).orElseThrow(() -> new EntityNotFoundException("Set with name " + setName + " not found!"));

        return setMapper.toDto(set);
    }
}
