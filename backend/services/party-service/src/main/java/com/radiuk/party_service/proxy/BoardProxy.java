package com.radiuk.party_service.proxy;

import com.radiuk.party_service.dto.proxy.BoardDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "umdb-service-board", url = "http://localhost:8082")
public interface BoardProxy {

    @GetMapping("/api/v1/umdb/boards/name/{name}")
    BoardDto getBoardByName(@PathVariable String name);

    @GetMapping("/api/v1/umdb/boards/id/{id}")
    BoardDto getBoardById(@PathVariable Short id);
}
