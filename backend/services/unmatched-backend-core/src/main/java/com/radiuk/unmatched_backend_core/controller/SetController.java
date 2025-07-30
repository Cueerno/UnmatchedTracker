package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.SetService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/sets")
@RequiredArgsConstructor
public class SetController {

    private final SetService setService;

    @GetMapping("/{name}")
    public ResponseEntity<?> getByName(@PathVariable String name) {
        return ResponseEntity.ok(setService.getByName(name));
    }
}
