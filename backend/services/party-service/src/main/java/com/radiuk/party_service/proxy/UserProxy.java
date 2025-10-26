package com.radiuk.party_service.proxy;

import com.radiuk.party_service.config.FeignInternalAuthConfig;
import com.radiuk.party_service.dto.proxy.ResponseDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(
        name = "user-service",
        url = "http://localhost:8081",
        configuration = FeignInternalAuthConfig.class
)
public interface UserProxy {

    @GetMapping("/api/v1/internal/users/username/{username}")
    ResponseDto getUserByUsername(@PathVariable String username);

    @GetMapping("/api/v1/internal/users/id/{id}")
    ResponseDto getUserById(@PathVariable Long id);
}
