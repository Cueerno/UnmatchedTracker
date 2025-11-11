package com.radiuk.party_service.service;

import com.radiuk.party_service.model.Party;

public record PartyEvent(
        Party party
) {
}
