create table sets
(
    id           smallserial primary key,
    name         varchar(255) not null unique,
    description  text,
    release_date timestamptz  not null,
    image_url    text         not null
);

create table boards
(
    id          smallserial primary key,
    set_id      smallint     not null references sets (id),
    name        varchar(255) not null unique,
    max_players smallint     not null,
    spaces      smallint     not null,
    zones       smallint     not null,
    feature     text,
    image_url   text         not null
);

create table board_tokens
(
    id       smallserial primary key,
    board_id smallint     not null references boards (id),
    name     varchar(100) not null,
    value    smallint,
    type     varchar(30) check (type in ('ATTACK', 'VERSATILE', 'DEFENSE', 'SCHEME')),
    ability  text
);

create table decks
(
    id              smallserial primary key,
    set_id          smallint references sets (id),
    name            varchar(255) not null,
    notes           text,
    quote           text,
    art_image_url   text         not null,
    front_image_url text         not null,
    back_image_url  text         not null
);

create table cards
(
    id     bigserial primary key,
    title  varchar(255) not null unique,
    type   varchar(30) check (type in ('ATTACK', 'VERSATILE', 'DEFENSE', 'SCHEME')),
    value  smallint,
    effect text
);

create table decks_cards
(
    deck_id        smallint references decks (id),
    card_id        smallint references cards (id),
    character_name varchar  not null,
    boost          smallint not null,
    quantity       smallint default 1,
    image_url      text     not null,

    primary key (deck_id, card_id)
);

create table rule_cards
(
    id        smallserial primary key,
    deck_id   smallint     not null references decks (id),
    title     varchar(255) not null,
    text      text,
    quote     text,
    image_url text
);

create table heroes
(
    id              smallserial primary key,
    deck_id         smallint references decks (id),
    name            varchar(255) not null,
    special_ability text,
    quantity        smallint     not null,
    hp              smallint     not null,
    move            smallint     not null,
    attack_type     varchar(20)  not null check (attack_type in ('MELEE', 'RANGED', 'UNKNOWN')),
    image_url       text,

    unique (name, deck_id)
);

create table sidekicks
(
    id          smallserial primary key,
    deck_id     smallint     not null references decks (id),
    name        varchar(100) not null unique,
    quantity    smallint     not null,
    hp          smallint     not null,
    move        smallint     not null,
    attack_type varchar(20)  not null check (attack_type in ('MELEE', 'RANGED', 'UNKNOWN')),
    image_url   text
);

create table extra_characters
(
    id              smallserial primary key,
    deck_id         smallint references decks (id),
    name            varchar(255) not null,
    special_ability text,
    quantity        smallint     not null,
    hp              smallint     not null,
    move            smallint     not null,
    attack_type     varchar(20)  not null check (attack_type in ('MELEE', 'RANGED', 'UNKNOWN')),
    image_url       text
);



