package com.radiuk.party_service.service;

import com.radiuk.party_service.dto.PartyDto;

import java.util.List;

public interface PartyService {

    PartyDto getPartyByMatchId(Long matchId);

    List<PartyDto> getPartiesByUserUsername(String username);

    void create(PartyDto partyDto);

    void update(Long matchId, PartyDto updatedPartyDto);

    void delete(Long matchId);
}
