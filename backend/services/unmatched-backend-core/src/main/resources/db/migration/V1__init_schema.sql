create table users
(
    id            bigserial primary key,
    username      varchar(255) not null unique,
    registered_at timestamptz  not null default now()
);

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
    id             bigserial primary key,
    deck_id        smallint references decks (id),
    title          varchar(255) not null,
    type           varchar(30) check (type in ('ATTACK', 'VERSATILE', 'DEFENSE', 'SCHEME')),
    character_name varchar      not null,
    value          smallint,
    boost          smallint     not null,
    quantity       smallint     not null,
    basic_text     varchar,
    immediate_text varchar,
    during_text    varchar,
    after_text     varchar,
    image_url      text         not null
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

create table matches
(
    id         bigserial primary key,
    format     varchar(30) not null check (format in ('HEADS_UP', 'TEAMS', 'FREE_FOR_ALL', 'COOP_PLAY')),
    note       text,
    created_at timestamptz not null default now()
);

create table teams
(
    id         bigserial primary key,
    match_id   bigint      not null references matches (id),
    name       varchar(255),
    created_at timestamptz not null default now()
);

create table parties
(
    id         bigserial primary key,
    match_id   bigint      not null references matches (id),
    team_id    bigint      not null references teams (id),
    user_id    bigint      not null references users (id),
    deck_id    smallint    not null references decks (id),
    board_id   smallint references boards (id),
    move_order smallint    not null,
    final_hp   smallint    not null,
    is_winner  boolean     not null,
    created_at timestamptz not null default now()
);








