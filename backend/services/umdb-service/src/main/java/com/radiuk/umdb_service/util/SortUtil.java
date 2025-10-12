package com.radiuk.umdb_service.util;

import org.springframework.data.domain.Sort;

public class SortUtil {

    public static Sort getSort(String sortBy, String direction) {
        String sortField = (sortBy == null || sortBy.isBlank()) ? "name" : sortBy;
        String dirParam = (direction == null || direction.isBlank()) ? "asc" : direction;

        Sort.Direction dir = Sort.Direction.fromString(dirParam.toLowerCase());

        return Sort.by(dir, sortField);
    }
}
