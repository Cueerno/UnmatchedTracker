package com.radiuk.party_service.proxy;

import com.radiuk.party_service.dto.proxy.DeckDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "umdb-service-deck", url = "http://localhost:8082")
public interface DeckProxy {

    @GetMapping("/api/v1/umdb/decks/name/{name}")
    DeckDto getDeckByName(@PathVariable String name);

    @GetMapping("/api/v1/umdb/decks/id/{id}")
    DeckDto getDeckById(@PathVariable Short id);
}
