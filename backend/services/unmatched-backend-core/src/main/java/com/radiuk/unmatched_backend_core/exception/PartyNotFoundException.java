package com.radiuk.unmatched_backend_core.exception;

public class PartyNotFoundException extends RuntimeException {
    public PartyNotFoundException(String message) {
        super(message);
    }
}
