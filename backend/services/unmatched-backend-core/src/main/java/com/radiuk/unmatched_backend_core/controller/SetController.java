package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.SetService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/umdb/sets")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class SetController {

    private final SetService setService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(
            @RequestParam(defaultValue = "releaseDate", required = false) String sortBy,
            @RequestParam(defaultValue = "asc", required = false) String direction
    ) {
        return ResponseEntity.ok(setService.getAll(sortBy, direction));
    }

    @GetMapping("/{name}")
    public ResponseEntity<?> getByName(@PathVariable String name) {
        return ResponseEntity.ok(setService.getByName(name));
    }
}
