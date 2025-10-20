package com.radiuk.party_service.exception;

public class PartyNotFoundException extends RuntimeException {
    public PartyNotFoundException(String message) {
        super(message);
    }
}
