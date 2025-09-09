create index match_id_idx on parties using hash (match_id);

create index user_id_idx on parties using hash (user_id);

create index deck_id_idx on parties using hash (deck_id);