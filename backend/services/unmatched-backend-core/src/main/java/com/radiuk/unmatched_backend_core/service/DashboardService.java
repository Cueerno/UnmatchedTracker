package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DashboardCacheService dashboardCacheService;

    public DashboardDto getDashboard() {
        log.debug("[DashboardService] -> getDashboard called");
        DashboardDto dashboard = dashboardCacheService.getDashboard();
        log.info("[DashboardService] -> getDashboard finished successfully");
        return dashboard;
    }
}
