package com.radiuk.unmatched_backend_core.controller;

import com.radiuk.unmatched_backend_core.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/boards")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllBoards(
            @RequestParam(defaultValue = "releaseDate", required = false) String sortBy,
            @RequestParam(defaultValue = "asc", required = false) String direction
    ) {
        return ResponseEntity.ok(boardService.getAll(sortBy, direction));
    }

    @GetMapping("/{name}")
    public ResponseEntity<?> getAllBoards(@PathVariable String name) {
        return ResponseEntity.ok(boardService.getByName(name));
    }
}
