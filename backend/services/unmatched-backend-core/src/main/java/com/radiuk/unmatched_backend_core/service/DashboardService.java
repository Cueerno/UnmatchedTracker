package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DashboardCacheService dashboardCacheService;

    public DashboardDto getDashboard() {
        return dashboardCacheService.getDashboard();
    }
}
