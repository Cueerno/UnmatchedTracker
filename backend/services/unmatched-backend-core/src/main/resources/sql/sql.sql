create table users(
                      id bigserial primary key,
                      username varchar(255) not null unique,
                      registered_at timestamptz not null default now()
);
insert into users(username, registered_at) values
                                               ('Cuerno',   '2023-01-22 00:01:00.111000 +03:00'),
                                               ('sisenok',  '2023-01-22 00:02:00.111000 +03:00'),
                                               ('Mateush',  '2023-01-22 00:03:00.111000 +03:00'),
                                               ('Lizyonok', '2023-01-22 00:04:00.111000 +03:00'),

                                               ('Arrrishh', '2023-03-22 00:04:00.111000 +03:00'),
                                               ('Roma',     '2023-03-22 00:04:00.111000 +03:00'),
                                               ('Luoridesu','2025-03-22 00:04:00.111000 +03:00'),


                                               ('Yura (dojo)','2025-06-22 00:04:00.111000 +03:00'),
                                               ('Ilya (dojo)','2025-06-22 00:04:00.111000 +03:00'),
                                               ('Varya (dojo)','2025-06-22 00:04:00.111000 +03:00'),
                                               ('Veronika (dojo)','2025-06-22 00:04:00.111000 +03:00'),
                                               ('Masha mal (dojo)','2025-06-22 00:04:00.111000 +03:00'),

                                               ('Misha','2025-07-22 00:04:00.111000 +03:00'),

                                               ('Ulyana','2025-08-01 00:04:00.111000 +03:00'),
                                               ('Petya',    '2025-06-05 17:01:00.111000 +03:00'),

                                               ('AI','2020-01-01 00:00:00.111000 +00:00');
----------------------------------------------------------------------------------------------
create table sets(
                     id smallserial primary key,
                     name varchar(255) not null unique,
                     description text,
                     release_date timestamptz,
                     image_url text
);
insert into sets(name, release_date, image_url) values
                                                    ('Battle of Legends',                                   '2019-09-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Robin Hood vs. Bigfoot',                              '2019-10-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Bruce Lee old',                                       '2019-10-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Jurassic Park - Ingen vs. Rapptors',                  '2020-04-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Cobble & Fog',                                        '2020-07-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Buffy the Vampire Slayer',                            '2020-10-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Little Red Riding Hood vs. Beowulf',                  '2020-10-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Deadpool',                                            '2021-07-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Battle of Legends, Volume Two',                       '2022-01-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Redemption Row',                                      '2022-05-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Hell''s Kitchen',                                     '2022-05-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('JJurassic Park - Sattler vs. T-Rex',                  '2022-05-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Houdini vs. The Genie',                               '2022-12-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Teen Spirit',                                         '2023-03-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('For King and Country',                                '2023-04-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Brains and Brawn',                                    '2023-07-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Unmatched Adventures - Tales to Amaze',               '2023-08-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Sun''s Origin',                                       '2024-01-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Slings & Arrows',                                     '2024-05-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Realm''s Fall',                                       '2024-12-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Steel and Silver',                                    '2024-12-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Battle of Legends, Volume Three',                     '2025-07-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Muhammad Ali vs Bruce Lee',                           '2026-11-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Shredder and Krang Hero Decks',                       '2026-11-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Unmatched Adventures - Teenage Mutant Ninja Turtles', '2026-11-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Stars and Stripes',                                   '2026-11-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg'),
                                                    ('Hellboy',                                             '2026-11-01 00:00:00.111000 +00:00','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754399275/UM-BoL-Vol-R-Release-News-1_gjx4jw.jpg');
----------------------------------------------------------------------------------------------
create table boards(
                       id smallserial primary key,
                       set_id smallint not null references sets(id) on delete cascade,
                       name varchar(255) not null unique,
                       max_players smallint not null,
                       spaces smallint not null,
                       zones smallint not null,
                       feature text,
                       image_url text not null
);
insert into boards(set_id, name, max_players, spaces, zones, feature, image_url) values
                                                                                     (1, 'Marmoreal',           4,31,8, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164152/marmoreal_hsmsub.jpg'),
                                                                                     (1, 'Sarpedon',            4,38,6, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164189/sarpedon_sox31r.jpg'),
                                                                                     (2, 'Sherwood Forest',     2,30,7, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164203/sherwood-forest_vgnrp4.jpg'),
                                                                                     (2, 'Yukon',               2,31,7, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164289/yukon_ipzj9t.jpg'),
                                                                                     (4, 'Raptor Paddock',      2,28,6, 'Has one-way arrows that only allow fighters to move in one direction. Fighters can still make attacks between those spaces.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164179/raptor-paddock_zalqmu.jpg'),
                                                                                     (5, 'SoHo',                4,29,7, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164208/soho_ztxqkl.jpg'),
                                                                                     (5, 'Baskerville Manor',   4,32,7, 'Has secret passages which connect distant parts of the map for movement, but not for attacks.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164091/baskerville-manor_z9npep.jpg'),
                                                                                     (6, 'Sunnydale High',      4,31,6, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164239/sunnydale-high_zzpdcw.png'),
                                                                                     (6, 'The Bronze',          4,35,6, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164279/the-bronze_ipftce.png'),
                                                                                     (7, 'Heorot',              2,30,7, 'Has doors which can be opened and closed during a maneuver to impede movement and attacks. Opening a door costs 1 space of movement, but closing a door is free.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164131/heorot_sgmmw4.jpg'),
                                                                                     (9, 'Hanging Gardens',     4,33,8, 'Has high ground spaces give a +1 attack bonus when a fighter is attacking from the high ground space into the adjacent space the arrow points towards.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164117/hanging-gardens_zos6dq.png'),
                                                                                     (10,'The Raft',            4,31,8,
                                                                                      'Has battlefield items which act as playable schemes or BOOST effects during combat, if you are on the space attached to the token.

                                                                                      Electrified Floor: Deal 1 damage to each fighter in your zone.
                                                                                      Secret Documents: Discard your hand. Draw 3 cards.
                                                                                      Security Camera: Look at an opponent''s hand. Draw 1 card.

                                                                                      Electro-Baton: +2
                                                                                      Food Tray: +1
                                                                                      Folding Chair: +1','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164284/the-raft_ceyf0e.png'),

                                                                                     (11,'Hell''s Kitchen',     4,30,7,
                                                                                      'Has battlefield items which act as playable schemes or BOOST effects during combat, if you are on the space attached to the token.

                                                                                      First Aid Kit: Recover 2 health. Draw 1 card.
                                                                                      Map: Your next attack this turn can target any space.
                                                                                      Payphone: Choose 1 card in your discard pile and return it to your hand.

                                                                                      Fire Hydrant: +2
                                                                                      Manhole Cover: +2
                                                                                      Mailbox: +1','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164127/hells-kitchen_dotpwb.png'),

                                                                                     (12,'T. Rex Paddock',      2,26,6, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164269/t-rex-paddock_tyyxss.png'),
                                                                                     (13,'King Solomon''s Mine',2,29,7, 'Has secret passages which connect distant parts of the map for movement, but not for attacks.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164145/king-solomons-mine_qoehum.png'),
                                                                                     (14,'Navy Pier',           4,30,6,
                                                                                      'Has battlefield items which act as playable schemes or BOOST effects during combat, if you are on the space attached to the token.

                                                                                      Helium Balloons: Move 2 spaces. Gain 1 action.
                                                                                      XL Slushie: Recover 3 health.
                                                                                      Zazoom: Look at the top 3 cards of any deck. Put back in any order.

                                                                                      Parking Meter: +2
                                                                                      Snow Globe: +1
                                                                                      Garbage Can Lid: +1','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164168/navy-pier_auo7pl.png'),

                                                                                     (15,'Helicarrier',         4,29,7,
                                                                                      'Has battlefield items which act as playable schemes or BOOST effects during combat, if you are on the space attached to the token.

                                                                                      Rocket Pack: Place your fighter in any space.
                                                                                      Laser Turret: Deal 2 damage to a fighter in your zone.
                                                                                      EMP Pulse Array: All players discard 2 cards.

                                                                                      Industrial Wrench: +2
                                                                                      SHIELD-Issued Blaster: +2
                                                                                      Reinforced Gloves: +1','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164123/helicarrier_qhiwte.jpg'),

                                                                                     (16,'Sanctum Sanctorum',   4,29,7,
                                                                                      'Has battlefield items which act as playable schemes or BOOST effects during combat, if you are on the space attached to the token.

                                                                                      Brazier of Bom''Galiath: Play a scheme from your deck as a free action.
                                                                                      Daily Bugle: Draw 3 cards. Put a card from your hand on the bottom of your deck.
                                                                                      Astral Ring: Move each figher up to 1 space.

                                                                                      Dragon Fang: +2
                                                                                      Axe of Angarruumus: +1
                                                                                      Black''s Law Dictionary: +1','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164183/sanctum_sanctorum_db3nul.jpg'),

                                                                                     (17,'McMinnville',         5,42,10,'An Unmatched Adventures board that supports co-op play for 1-4 players against the Martian Invader Villain, or normal Unmatched play for up to 5 players.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164157/mcminnville_npgrxe.jpg'),
                                                                                     (17,'Point Pleasant',      5,40,7, 'An Unmatched Adventures board that supports co-op play for 1-4 players against the Mothman Villain, or normal Unmatched play for up to 5 players.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164173/point-pleasant_vu6nn4.jpg'),
                                                                                     (18,'Azuchi Castle',       2,31,8, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754163647/azuchi-castle_owp9pp.jpg'),
                                                                                     (19,'Globe Theatre',       4,32,10,'','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164110/globe-theatre_yd0sc5.png'),
                                                                                     (20,'Streets of Novigrad', 4,34,8, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164214/streets-of-novigrad_uzqezw.png'),
                                                                                     (20,'Naglfar',             4,28,7, 'Has colored paths that connect the above deck and below deck areas. Spaces connected by colored paths are considered adjacent.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164163/naglfar_t8oy1r.png'),
                                                                                     (21,'Kaer Mohren',         4,32,8, 'Has one-way arrows that only allow fighters to move in one direction. Fighters can still make attacks between those spaces.','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164137/kaer-mohren_v9twt7.png'),
                                                                                     (21,'Fayrlund Forest',     4,30,7, '','https://res.cloudinary.com/dvjckj3bk/image/upload/v1754164101/fayrlund-forest_vqel9z.png');
----------------------------------------------------------------------------------------------
create table board_tokens(
                             id smallserial primary key,
                             board_id smallint references boards(id),
                             name varchar(100),
                             value smallint,
                             type varchar(20),
                             ability text
);
insert into board_tokens(board_id, name, value, type, ability) values
                                                                   (17,'EMP pulse array',      null,'SCHEME',    'All players discard 2 cards'),
                                                                   (17,'Laser turret',         null,'SCHEME',    'Deal 2 damage to a finger in your zone'),
                                                                   (17,'Reinforced Gloves',    1,   'VERSATILE', null),
                                                                   (17,'Industrial wrench',    2,   'VERSATILE', null),
                                                                   (17,'SHIELD-issued Blaster',2,   'VERSATILE', null),
                                                                   (17,'Rocket pack',          null,'SCHEME',    'Place your finger in any space');
----------------------------------------------------------------------------------------------
create table decks(
                      id smallserial primary key,
                      set_id smallint references sets(id),
                      name varchar(255),
                      notes text,
                      front_image_url text,
                      back_image_url text
);
insert into decks(set_id, name, front_image_url, back_image_url) values
                                                                     (1,'Medusa', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754402063/character-cards-v0-010zoej38o5e1_wt8yz7.webp', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754402024/download_rlrnqp.jpg'),
                                                                     (1,'Sinbad', 'q', 'q'),
                                                                     (1,'Alice',  'q', 'q'),
                                                                     (1,'King Arthur',  'q', 'q'),

                                                                     (2,'Robin Hood',  'q', 'q'),
                                                                     (2,'Bigfoot',  'q', 'q'),

                                                                     (3,'Bruce Lee old',  'q', 'q'),

                                                                     (4,'InGen',  'q', 'q'),
                                                                     (4,'Raptors',  'q', 'q'),

                                                                     (5,'Sherlock Holmes',  'q', 'q'),
                                                                     (5,'Dracula',  'q', 'q'),
                                                                     (5,'Jekyll & Hyde',  'q', 'q'),
                                                                     (5,'Invisible Man',  'q', 'q'),

                                                                     (6,'Buffy',  'q', 'q'),
                                                                     (6,'Angel',  'q', 'q'),
                                                                     (6,'Spike',  'q', 'q'),
                                                                     (6,'Willow',  'q', 'q'),

                                                                     (7,'Beowulf',  'q', 'q'),
                                                                     (7,'Little Red Riding Hood',  'q', 'q'),

                                                                     (8,'Deadpool',  'q', 'q'),

                                                                     (9,'Achilles',  'q', 'q'),
                                                                     (9,'Bloody Mary',  'q', 'q'),
                                                                     (9,'Sun Wukong',  'q', 'q'),
                                                                     (9,'Yennenga',  'q', 'q'),

                                                                     (10,'Luke Cage',  'q', 'q'),
                                                                     (10,'Moon Knight',  'q', 'q'),
                                                                     (10,'Ghost Rider',  'q', 'q'),

                                                                     (11,'Daredevil',  'q', 'q'),
                                                                     (11,'Bullseye',   'q', 'q'),
                                                                     (11,'Elektra',    'q', 'q'),

                                                                     (12,'Dr. Ellie Sattler',    'q', 'q'),
                                                                     (12,'T. Rex',    'q', 'q'),

                                                                     (13,'Harry Houdini',    'q', 'q'),
                                                                     (13,'The Genie',        'q', 'q'),

                                                                     (14,'Ms. Marvel',           'q', 'q'),
                                                                     (14,'Squirrel Girl',        'q', 'q'),
                                                                     (14,'Cloak and Danger',     'q', 'q'),

                                                                     (15,'Black Widow',        'q', 'q'),
                                                                     (15,'Black Panther',      'q', 'q'),
                                                                     (15,'Winter Soldier',     'q', 'q'),

                                                                     (16,'Spider-Man',         'q', 'q'),
                                                                     (16,'She-Hulk',           'q', 'q'),
                                                                     (16,'Doctor Strange',     'q', 'q'),

                                                                     (17,'Nikola Tesla',        'q', 'q'),
                                                                     (17,'Dr. Jill Trent',      'q', 'q'),
                                                                     (17,'Golden Bat',          'q', 'q'),
                                                                     (17,'Annie Christmas',     'q', 'q'),

                                                                     (18,'Tomoe Gozen',      'q', 'q'),
                                                                     (18,'Oda Nobunaga',     'q', 'q'),

                                                                     (19,'Hamlet',                  'q', 'q'),
                                                                     (19,'Titania',                 'q', 'q'),
                                                                     (19,'The Wayward Sisters',     'q', 'q'),
                                                                     (19,'William Shakespeare',     'q', 'q'),

                                                                     (20,'Eredin',               'q', 'q'),
                                                                     (20,'Philippa',             'q', 'q'),
                                                                     (20,'Yennefer & Triss',     'q', 'q'),

                                                                     (21,'Ciri',                'q', 'q'),
                                                                     (21,'Ancient Leshen',      'q', 'q'),
                                                                     (21,'Geralt of Rivia',     'q', 'q'),

                                                                     (22,'Pandora',             'q', 'q'),
                                                                     (22,'Blackbeard',          'q', 'q'),
                                                                     (22,'Loki',                'q', 'q'),
                                                                     (22,'The Chupacabra', 'q', 'q'),

                                                                     (23,'Muhammad Ali', 'q', 'q'),
                                                                     (23,'Bruce Lee',    'q', 'q'),

                                                                     (24,'Shredder', 'q', 'q'),
                                                                     (24,'Krang',    'q', 'q'),

                                                                     (25,'Leonardo',         'q', 'q'),
                                                                     (25,'Raphael',          'q', 'q'),
                                                                     (25,'Donatello',        'q', 'q'),
                                                                     (25,'Michelangelo',     'q', 'q'),

                                                                     (26,'Rosie the Riveter',    'q', 'q'),
                                                                     (26,'John Henry',           'q', 'q'),
                                                                     (26,'Wyatt Earp',           'q', 'q'),
                                                                     (26,'George Washington',    'q', 'q'),

                                                                     (27,'Hellboy',              'q', 'q');
----------------------------------------------------------------------------------------------
create type card_type as enum('ATTACK', 'VERSATILE', 'DEFENSE', 'SCHEME');
create table cards(
                      id bigserial primary key,
                      deck_id smallint references decks(id),
                      title varchar(255),
                      type varchar(20),
                      character_name varchar,
                      value smallint,
                      boost smallint,
                      quantity smallint,
                      basic_text varchar,
                      immediate_text varchar,
                      during_text varchar,
                      after_text varchar,
                      image_url text
);
insert into cards(deck_id, title, type, character_name, value, boost, quantity, basic_text, immediate_text, during_text, after_text, image_url) values
                                                                                                                                                    (1,'Gaze of Stone',            'ATTACK',   'Medusa',2,4,3,null,null,null,'If you won the combat, deal 8 damage to the opposing fighter.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484002/gaze-of-stone_yx7tr9.png'),
                                                                                                                                                    (1,'Second Shot',              'ATTACK',   'Medusa',3,3,3,null,null,'You may BOOST this attack.',null, 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484126/second-shot-3_ofuiwr.png'),
                                                                                                                                                    (1,'Dash',                     'VERSATILE','Any',   3,1,3,null,null,null,'Move your fighter up to 3 spaces.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754483955/dash_nrbt0j.png'),
                                                                                                                                                    (1,'The Hounds of Mighty Zeus','VERSATILE','Harpy', 4,3,2,null,null,null,'Move each Harpy up to 3 spaces.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484071/the-hounds-of-mighty-zeus_nae9ud.png'),
                                                                                                                                                    (1,'Clutching Claws',          'VERSATILE','Harpy', 3,2,3,null,null,null,'Your opponent discards 1 card.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484092/clutching-claws_udbhcj.png'),
                                                                                                                                                    (1,'Snipe',                    'VERSATILE','Any',   3,1,3,null,null,null,'Draw 1 card.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484139/snipe_e66xpz.png'),
                                                                                                                                                    (1,'Feint',                    'VERSATILE','Any',   2,2,3,null,'Cancel all effects on your opponent''s card.',null,null, 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484154/feint_gplowa.png'),
                                                                                                                                                    (1,'Regroup',                  'VERSATILE','Any',   1,1,3,null,null,null,'Draw 1 card. If you won the combat, draw 2 cards instead.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484178/regroup_yojqy6.png'),
                                                                                                                                                    (1,'Hiss and Slither',         'DEFENSE',  'Medusa',4,3,3,null,null,null,'Your opponent discards 1 card.', 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484049/hiss-and-slither_yvgcvz.png'),
                                                                                                                                                    (1,'A Momentary Glance',       'SCHEME',   'Medusa',0,3,2,'Deal 2 damage to any one fighter in Medusa''s zone.',null,null,null, 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484023/a-momentary-glance_rvjbsl.png'),
                                                                                                                                                    (1,'Winged Frenzy',            'SCHEME',   'Any',   0,2,2,'Move each of your fighters up to 3 spaces. You may move them through spaces containing opposing fighters. Then, return a defeated Harpy (if any) to any space in Medusa''s zone.',null,null,null, 'https://res.cloudinary.com/dvjckj3bk/image/upload/v1754484110/winged-frenzy_ko3p06.png');
----------------------------------------------------------------------------------------------
create table rule_cards(
                           id smallserial primary key,
                           deck_id smallint references decks(id),
                           title varchar(255),
                           text text,
                           image_url text
);
----------------------------------------------------------------------------------------------
create type attack_type as enum('MELEE', 'RANGED', 'UNKNOWN');
create table heroes(
                       id smallserial primary key,
                       deck_id smallint references decks(id),
                       name varchar(255) not null,
                       special_ability text,
                       quantity smallint not null,
                       hp smallint not null,
                       move smallint not null,
                       attack_type varchar(7) not null,
                       image_url text,

                       unique(name,deck_id)
);
insert into heroes(deck_id, name, quantity, hp, move, attack_type) values
                                                                       (1,'Medusa',                 1,16,3,'RANGED'),
                                                                       (2,'Sinbad',                 1,16,2,'MELEE'),
                                                                       (3,'Alice',                  1,13,2,'MELEE'),
                                                                       (4,'King Arthur',            1,18,2,'MELEE'),

                                                                       (5,'Robin Hood',             1,13,2,'RANGED'),
                                                                       (6,'Bigfoot',                1,16,3,'MELEE'),

                                                                       (7,'Bruce Lee old',          1,14,3,'MELEE'),


                                                                       (8,'Robert Muldoon',         1,14,3,'MELEE'),
                                                                       (9,'Raptors',                3,7, 3,'MELEE'),

                                                                       (10,'Sherlock Holmes',       1,16,2,'MELEE'),
                                                                       (11,'Dracula',               1,13,2,'MELEE'),
                                                                       (12,'Jekyll & Hyde',         1,16,2,'MELEE'),
                                                                       (13,'Invisible Man',         1,15,2,'MELEE'),

                                                                       (14,'Buffy',                 1,14,3,'MELEE'),
                                                                       (15,'Angel',                 1,16,2,'MELEE'),
                                                                       (16,'Spike',                 1,15,2,'MELEE'),
                                                                       (17,'Willow',                1,14,2,'RANGED'),

                                                                       (18,'Beowulf',               1,17,2,'MELEE'),
                                                                       (19,'Little Red',            1,14,2,'MELEE'),

                                                                       (20,'Deadpool',              1,10,2,'MELEE'),

                                                                       (21,'Achilles',              1,18,2,'MELEE'),
                                                                       (22,'Bloody Mary',           1,16,3,'MELEE'),
                                                                       (23,'Sun Wukong',            1,17,2,'MELEE'),
                                                                       (24,'Yennenga',              1,15,2,'RANGED'),

                                                                       (25,'Luke Cage',             1,13,2,'MELEE'),
                                                                       (26,'Moon Knight',           1,16,3,'MELEE'),
                                                                       (27,'Ghost Rider',           1,17,2,'MELEE'),

                                                                       (28,'Daredevil',             1,17,3,'MELEE'),
                                                                       (29,'Bullseye',              1,14,2,'RANGED'),
                                                                       (30,'Elektra',               1,7, 2,'MELEE'),

                                                                       (31,'Dr. Sattler',           1,13,2,'MELEE'),
                                                                       (32,'T. Rex',                1,27,1,'MELEE'),

                                                                       (33,'Harry Houdini',         1,14,2,'MELEE'),
                                                                       (34,'The Genie',             1,16,3,'RANGED'),

                                                                       (35,'Ms. Marvel',            1,14,2,'MELEE'),
                                                                       (36,'Squirrel Girl',         1,13,2,'MELEE'),
                                                                       (37,'Cloak',                 1,8, 2,'MELEE'),

                                                                       (38,'Black Widow',           1,13,2,'RANGED'),
                                                                       (39,'Black Panther',         1,14,2,'MELEE'),
                                                                       (40,'Winter Soldier',        1,15,2,'RANGED'),

                                                                       (41,'Spider-Man',            1,15,3,'MELEE'),
                                                                       (42,'She-Hulk',              1,20,2,'MELEE'),
                                                                       (43,'Doctor Strange',        1,14,2,'RANGED'),

                                                                       (44,'Nikola Tesla',          1,14,2,'RANGED'),
                                                                       (45,'Dr. Jill Trent',        1,13,2,'MELEE'),
                                                                       (46,'Golden Bat',            1,18,3,'MELEE'),
                                                                       (47,'Annie Christmas',       1,14,2,'MELEE'),

                                                                       (48,'Tomoe Gozen',           1,14,2,'RANGED'),
                                                                       (49,'Oda Nobunaga',          1,13,2,'MELEE'),

                                                                       (50,'Hamlet',                1,15,2,'MELEE'),
                                                                       (51,'Titania',               1,12,2,'RANGED'),
                                                                       (52,'The Wayward Sisters',   3,6, 2,'RANGED'),
                                                                       (53,'William Shakespeare',   1,13,2,'MELEE'),

                                                                       (54,'Eredin',                1,14,2,'MELEE'),
                                                                       (55,'Philippa',              1,12,2,'RANGED'),
                                                                       (56,'Yennefer',              1,14,2,'RANGED'),

                                                                       (57,'Ciri',                  1,15,2,'MELEE'),
                                                                       (58,'Ancient Leshen',        1,13,2,'MELEE'),
                                                                       (59,'Geralt of Rivia',       1,16,2,'MELEE'),

                                                                       (60,'Pandora',               1,14,2,'MELEE'),
                                                                       (61,'Blackbeard',            1,13,2,'RANGED'),
                                                                       (62,'Loki',                  1,16,2,'MELEE'),
                                                                       (63,'The Chupacabra',        1,14,3,'MELEE'),

                                                                       (64,'Muhammad Ali',          1,0, 0,'MELEE'),
                                                                       (65,'Bruce Lee',             1,14,3,'MELEE'),

                                                                       (66,'Shredder',              1,15,3,'MELEE'),
                                                                       (67,'Krang',                 1,16,1,'MELEE'),

                                                                       (68,'Leonardo',              1,16,2,'MELEE'),
                                                                       (69,'Raphael',               1,17,2,'MELEE'),
                                                                       (70,'Donatello',             1,14,2,'MELEE'),
                                                                       (71,'Michelangelo',          1,14,3,'MELEE'),

                                                                       (72,'Rosie the Riveter',     0,0, 0,'UNKNOWN'),
                                                                       (73,'John Henry',            0,0, 0,'UNKNOWN'),
                                                                       (74,'Wyatt Earp',            0,0, 0,'UNKNOWN'),
                                                                       (75,'George Washington',     0,0, 0,'UNKNOWN'),

                                                                       (76,'Hellboy',               0,0, 0,'UNKNOWN');
----------------------------------------------------------------------------------------------
create table sidekicks(
                          id smallserial primary key,
                          deck_id smallint not null references decks(id),
                          name varchar(100) not null unique,
                          quantity smallint not null,
                          hp smallint not null,
                          move smallint not null,
                          attack_type varchar(7) not null,
                          image_url text
);
insert into sidekicks(deck_id, name, quantity, hp, move, attack_type) values
                                                                          (1, 'Harpy',                     3,1,3,'MELEE'),
                                                                          (2, 'The Porter',                1,6,2,'MELEE'),
                                                                          (3, 'The Jabberwock',            1,8,2,'MELEE'),
                                                                          (4, 'Merlin',                    1,7,2,'RANGED'),

                                                                          (6, 'Outlaws',                   4,1,1,'MELEE'),
                                                                          (7, 'The Jackalope',             1,6,3,'MELEE'),
                                                                          (8, 'Ingen Workers',             3,1,3,'RANGED'),
                                                                          (10,'Dr. Watson',                1,8,2,'RANGED'),
                                                                          (11,'The Sisters',               3,1,2,'MELEE'),
                                                                          (14,'Giles or Xander',           1,6,3,'MELEE'),
                                                                          (15,'Faith',                     1,8,2,'MELEE'),
                                                                          (16,'Drusilla',                  1,7,2,'MELEE'),
                                                                          (17,'Tara',                      1,6,2,'RANGED'),
                                                                          (18,'Wiglaf',                    1,9,2,'MELEE'),
                                                                          (19,'Huntsman',                  1,9,2,'RANGED'),
                                                                          (21,'Patroclus',                 1,6,2,'MELEE'),
                                                                          (23,'Clones',                    3,1,2,'MELEE'),
                                                                          (24,'Archers',                   2,2,2,'RANGED'),
                                                                          (25,'Misty Knight',              1,6,2,'RANGED'),
                                                                          (30,'The Hand',                  4,1,2,'MELEE'),
                                                                          (31,'Dr. Malcolm',               1,7,2,'MELEE'),
                                                                          (33,'Bess',                      1,5,2,'MELEE'),
                                                                          (37,'Dagger',                    1,8,2,'MELEE'),
                                                                          (38,'Maria Hill',                1,6,2,'RANGED'),
                                                                          (39,'Shuri',                     1,6,2,'RANGED'),
                                                                          (43,'Wong',                      1,6,2,'RANGED'),
                                                                          (45,'Daisy',                     1,6,2,'MELEE'),
                                                                          (47,'Charlie',                   1,8,2,'RANGED'),
                                                                          (49,'Honor Guard',               2,6,2,'MELEE'),
                                                                          (50,'Rosencrantz & Guildenstern',1,6,2,'MELEE'),
                                                                          (51,'Oberon',                    1,6,2,'MELEE'),
                                                                          (53,'Actors',                    3,1,2,'MELEE'),
                                                                          (54,'Red Riders',                4,1,2,'MELEE'),
                                                                          (55,'Dijkstra',                  1,1,2,'MELEE'),
                                                                          (56,'Triss',                     1,6,2,'RANGED'),
                                                                          (57,'Ihuarraquax',               1,7,2,'MELEE'),
                                                                          (58,'Wolves',                    2,1,3,'MELEE'),
                                                                          (59,'Dandelion',                 1,5,2,'RANGED'),
                                                                          (60,'Kakodæmons',                2,1,2,'MELEE'),
                                                                          (61,'Sea dogs',                  2,1,2,'MELEE'),
                                                                          (66,'Bebop & Rocksteady',        1,7,3,'MELEE'),
                                                                          (68,'Splinter',                  1,9,2,'MELEE'),
                                                                          (69,'Casey Jones',               1,8,2,'RANGED'),
                                                                          (70,'Metalhead',                 1,7,2,'RANGED'),
                                                                          (71,'April O''Neil',             1,6,3,'RANGED');
----------------------------------------------------------------------------------------------
create table extra_characters(
                                 id smallserial primary key,
                                 deck_id smallint references decks(id),
                                 name varchar(255) not null,
                                 special_ability text,
                                 quantity smallint not null,
                                 hp smallint not null,
                                 move smallint not null,
                                 attack_type varchar(7) not null,
                                 image_url text
);
insert into extra_characters(deck_id, name, special_ability, quantity, hp, move, attack_type, image_url) values
                                                                                                             (26,'Khonshu',            'Khonshu adds +2 to the value of his attack cards. He does not take damage from effects other than combat damage.',1,16,3,'MELEE','q'),
                                                                                                             (26,'Mr. Knight',         'Mr. Knight adds +1 to all his defense values.',1,16,3,'MELEE','q'),
                                                                                                             (30,'Elektra Resurrected',null,1,9,2,'MELEE','q'),
                                                                                                             (30,'Squirrels',          null,8,1,2,'MELEE','q');
----------------------------------------------------------------------------------------------
create type match_format as enum ('1v1', '2v2', 'FFA', 'COOP_PLAY');
create table matches(
                        id bigserial primary key,
                        format varchar(255) not null,
                        note text,
                        created_at timestamptz not null default now()
);
insert into matches(format, created_at) values
                                            ('HEADS_UP', '2023-01-22 15:00:00.111000 +00:00'),
                                            ('TEAMS',    '2023-01-22 15:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2023-03-22 16:00:00.111000 +00:00'),

                                            ('TEAMS',    '2023-07-29 18:00:00.111000 +00:00'),
                                            ('TEAMS',    '2023-08-16 18:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2023-08-18 15:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2024-01-18 15:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2024-06-25 13:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2024-03-22 15:00:00.111000 +00:00'),
                                            ('HEADS_UP', '2024-03-22 17:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2025-04-13 20:00:00.111000 +00:00'),

                                            ('TEAMS',    '2025-06-05 20:00:00.111000 +00:00'),

                                            ('TEAMS',    '2025-06-15 20:00:00.111000 +00:00'),

                                            ('TEAMS',    '2025-06-23 20:00:00.111000 +00:00'),
                                            ('TEAMS',    '2025-06-23 20:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2025-07-13 20:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2025-07-13 20:00:00.111000 +00:00'),
                                            ('HEADS_UP', '2025-07-22 20:00:00.111000 +00:00'),
                                            ('TEAMS',    '2025-07-23 23:00:00.111000 +00:00'),

                                            ('HEADS_UP', '2025-08-02 20:00:00.111000 +00:00'),

                                            ('TEAMS',    '2025-08-07 23:00:00.111000 +00:00'),
                                            ('TEAMS',    '2025-08-07 23:00:00.111000 +00:00'),
                                            ('HEADS_UP', '2025-08-07 23:00:00.111000 +00:00');
----------------------------------------------------------------------------------------------
create table teams(
                      id bigserial primary key,
                      match_id bigint not null references matches(id),
                      name varchar(255),
                      created_at timestamptz not null default now()
);
insert into teams(match_id, name, created_at) values
                                                  (1,'sisenok',                        '2023-01-22 20:00:00.111000 +00:00'),
                                                  (1,'Mateush',                        '2023-01-22 20:00:00.111000 +00:00'),

                                                  (2,'sisenok',                        '2023-01-22 20:00:00.111000 +00:00'),
                                                  (2,'Cuerno & Mateush',               '2023-01-22 20:00:00.111000 +00:00'),

                                                  (3,'sisenok',                        '2023-03-22 20:00:00.111000 +00:00'),
                                                  (3,'Roma',                           '2023-03-22 20:00:00.111000 +00:00'),

                                                  (4,'Cuerno & Lizyonok',              '2023-07-29 18:00:00.111000 +00:00'),
                                                  (4,'Mateush',                        '2023-07-29 18:00:00.111000 +00:00'),

                                                  (5,'Cuerno & Arrrishh',              '2023-08-16 18:00:00.111000 +00:00'),
                                                  (5,'Mateush & Lizyonok',             '2023-08-16 18:00:00.111000 +00:00'),

                                                  (6, 'sisenok',                       '2023-08-18 15:00:00.111000 +00:00'),
                                                  (6, 'Cuerno',                        '2023-08-18 15:00:00.111000 +00:00'),

                                                  (7,'sisenok',                        '2024-01-18 15:00:00.111000 +00:00'),
                                                  (7,'Cuerno',                         '2024-01-18 15:00:00.111000 +00:00'),

                                                  (8,'sisenok',                        '2024-06-25 13:00:00.111000 +00:00'),
                                                  (8,'Misha',                          '2024-06-25 13:00:00.111000 +00:00'),

                                                  (9,'sisenok',                        '2024-03-22 15:00:00.111000 +00:00'),
                                                  (9,'Luoridesu',                      '2024-03-22 15:00:00.111000 +00:00'),

                                                  (10,'sisenok',                       '2024-03-22 17:00:00.111000 +00:00'),
                                                  (10,'Luoridesu',                     '2024-03-22 17:00:00.111000 +00:00'),

                                                  (11,'sisenok',                       '2025-04-13 20:00:00.111000 +00:00'),
                                                  (11,'Cuerno',                        '2025-04-13 20:00:00.111000 +00:00'),

                                                  (12,'Cuerno & Petya',                '2025-06-05 20:00:00.111000 +00:00'),
                                                  (12,'Mateush',                       '2025-06-05 20:00:00.111000 +00:00'),

                                                  (13,'Mateush & sisenok',              '2025-06-15 20:00:00.111000 +00:00'),
                                                  (13,'Cuerno',                         '2025-06-15 20:00:00.111000 +00:00'),

                                                  (14,'Yura (dojo) & Ilya (dojo)',     '2025-06-23 20:00:00.111000 +00:00'),
                                                  (14,'Varya (dojo) & Veronika (dojo)','2025-06-23 20:00:00.111000 +00:00'),

                                                  (15,'Mateush & Yura (dojo)',         '2025-06-23 20:00:00.111000 +00:00'),
                                                  (15,'Lizyonok & Masha mal (dojo)',   '2025-06-23 20:00:00.111000 +00:00'),

                                                  (16,'sisenok',                       '2025-07-13 20:00:00.111000 +00:00'),
                                                  (16,'Lizyonok',                      '2025-07-13 20:00:00.111000 +00:00'),

                                                  (17,'Mateush',                       '2025-07-13 20:00:00.111000 +00:00'),
                                                  (17,'Lizyonok',                      '2025-07-13 20:00:00.111000 +00:00'),

                                                  (18,'Cuerno',                        '2025-07-22 20:00:00.111000 +00:00'),
                                                  (18,'sisenok',                       '2025-07-22 20:00:00.111000 +00:00'),

                                                  (19,'Cuerno & sisenok',              '2025-07-23 23:00:00.111000 +00:00'),
                                                  (19,'Mateush & Lizyonok',            '2025-07-23 23:00:00.111000 +00:00'),


                                                  (20,'Mateush',                       '2025-08-02 20:00:00.111000 +00:00'),
                                                  (20,'Lizyonok',                      '2025-08-02 20:00:00.111000 +00:00'),

                                                  (21,'Lizyonok & sisenok',            '2025-08-07 00:00:00.111000 +00:00'),
                                                  (21,'Mateush & Ulyana',              '2025-08-07 00:00:00.111000 +00:00'),

                                                  (22,'Mateush & Lizyonok',            '2025-08-07 00:00:00.111000 +00:00'),
                                                  (22,'sisenok & Ulyana',              '2025-08-07 00:00:00.111000 +00:00'),

                                                  (23,'Ulyana',                        '2025-08-07 00:00:00.111000 +00:00'),
                                                  (23,'sisenok',                       '2025-08-07 00:00:00.111000 +00:00');

create table team_members(
                             team_id bigint not null references teams(id),
                             user_id bigint not null references users(id),
                             created_at timestamptz not null default now(),

                             primary key(team_id, user_id)
);
insert into team_members(team_id, user_id, created_at) values
                                                           (1,2, '2023-01-22 20:00:00.111000 +00:00'),
                                                           (2,3, '2023-01-22 20:00:00.111000 +00:00'),

                                                           (3,2, '2023-01-22 20:00:00.111000 +00:00'),
                                                           (4,1, '2023-01-22 20:00:00.111000 +00:00'),
                                                           (4,3, '2023-01-22 20:00:00.111000 +00:00'),

                                                           (5,2, '2023-03-22 20:00:00.111000 +00:00'),
                                                           (6,6, '2023-03-22 20:00:00.111000 +00:00'),

                                                           (7,1, '2023-07-29 18:00:00.111000 +00:00'),
                                                           (7,4, '2023-07-29 18:00:00.111000 +00:00'),
                                                           (8,3, '2023-07-29 18:00:00.111000 +00:00'),

                                                           (9,1, '2023-08-16 18:00:00.111000 +00:00'),
                                                           (9,5, '2023-08-16 18:00:00.111000 +00:00'),
                                                           (10,3,'2023-08-16 18:00:00.111000 +00:00'),
                                                           (10,4,'2023-08-16 18:00:00.111000 +00:00'),

                                                           (11, 2,'2023-08-18 15:00:00.111000 +00:00'),
                                                           (12, 1,'2023-08-18 15:00:00.111000 +00:00'),

                                                           (13,2, '2024-01-18 15:00:00.111000 +00:00'),
                                                           (14,1, '2024-01-18 15:00:00.111000 +00:00'),

                                                           (15,2, '2024-06-25 13:00:00.111000 +00:00'),
                                                           (16,13,'2024-06-25 13:00:00.111000 +00:00'),

                                                           (17,2, '2024-03-22 15:00:00.111000 +00:00'),
                                                           (18,7, '2024-03-22 15:00:00.111000 +00:00'),

                                                           (19,2, '2024-03-22 17:00:00.111000 +00:00'),
                                                           (20,7, '2024-03-22 17:00:00.111000 +00:00'),

                                                           (21,2, '2025-04-13 20:00:00.111000 +00:00'),
                                                           (22,1, '2025-04-13 20:00:00.111000 +00:00'),

                                                           (23,1, '2025-06-05 20:00:00.111000 +00:00'),
                                                           (23,15,'2025-06-05 20:00:00.111000 +00:00'),
                                                           (24,3, '2025-06-05 20:00:00.111000 +00:00'),

                                                           (25,2, '2025-06-15 20:00:00.111000 +00:00'),
                                                           (25,3, '2025-06-15 20:00:00.111000 +00:00'),
                                                           (26,1, '2025-06-15 20:00:00.111000 +00:00'),

                                                           (27,8, '2025-06-23 20:00:00.111000 +00:00'),
                                                           (27,9, '2025-06-23 20:00:00.111000 +00:00'),
                                                           (28,10,'2025-06-23 20:00:00.111000 +00:00'),
                                                           (28,11,'2025-06-23 20:00:00.111000 +00:00'),

                                                           (29,3, '2025-06-23 20:00:00.111000 +00:00'),
                                                           (29,8, '2025-06-23 20:00:00.111000 +00:00'),
                                                           (30,4, '2025-06-23 20:00:00.111000 +00:00'),
                                                           (30,12,'2025-06-23 20:00:00.111000 +00:00'),

                                                           (31,2, '2025-07-13 20:00:00.111000 +00:00'),
                                                           (32,3, '2025-07-13 20:00:00.111000 +00:00'),

                                                           (33,3, '2025-07-13 20:00:00.111000 +00:00'),
                                                           (34,4, '2025-07-13 20:00:00.111000 +00:00'),

                                                           (35,1, '2025-07-22 20:00:00.111000 +00:00'),
                                                           (36,2, '2025-07-22 20:00:00.111000 +00:00'),

                                                           (37,1, '2025-07-23 23:00:00.111000 +00:00'),
                                                           (37,2, '2025-07-23 23:00:00.111000 +00:00'),
                                                           (38,3, '2025-07-23 23:00:00.111000 +00:00'),
                                                           (38,4, '2025-07-23 23:00:00.111000 +00:00'),

                                                           (39,3, '2025-08-02 20:00:00.111000 +00:00'),
                                                           (40,4, '2025-08-02 20:00:00.111000 +00:00'),

                                                           (41,4, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (41,2, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (42,3, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (42,14,'2025-08-07 00:00:00.111000 +00:00'),

                                                           (43,3, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (43,4, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (44,2, '2025-08-07 00:00:00.111000 +00:00'),
                                                           (44,14,'2025-08-07 00:00:00.111000 +00:00'),

                                                           (45,14,'2025-08-07 00:00:00.111000 +00:00'),
                                                           (46,2, '2025-08-07 00:00:00.111000 +00:00');
----------------------------------------------------------------------------------------------
create table parties(
                        id bigserial primary key,
                        match_id bigint not null references matches(id),
                        team_id bigint not null references teams(id),
                        user_id bigint not null references users(id),
                        deck_id smallint not null references decks(id),
                        board_id smallint references boards(id),
                        move_order smallint not null,
                        final_hp smallint not null,
                        is_winner boolean not null,
                        created_at timestamptz not null default now()
);
insert into parties(match_id, team_id, user_id, deck_id, board_id, move_order, final_hp, is_winner, created_at) values
                                                                                                                    (1,1, 2,   12,7,1,0,false,'2023-01-22 20:00:00.111000 +00:00'),
                                                                                                                    (1,2, 3,   10,7,2,6,true, '2023-01-22 20:00:00.111000 +00:00'),

                                                                                                                    (2,3, 2,   1, 1,1,3,true, '2023-01-22 20:00:00.111000 +00:00'),
                                                                                                                    (2,3, 2,   3, 1,3,4,true, '2023-01-22 20:00:00.111000 +00:00'),
                                                                                                                    (2,4, 1,   2, 1,2,0,false,'2023-01-22 20:00:00.111000 +00:00'),
                                                                                                                    (2,4, 3,   4, 1,4,0,false,'2023-01-22 20:00:00.111000 +00:00'),

                                                                                                                    (3,5, 2,   13,7,1,6,true, '2023-03-22 20:00:00.111000 +00:00'),
                                                                                                                    (3,6, 6,   12,7,2,0,false,'2023-03-22 20:00:00.111000 +00:00'),

                                                                                                                    (4,7, 1,   21,11,2,6,true, '2023-07-29 18:00:00.111000 +00:00'),
                                                                                                                    (4,7, 4,   22,11,4,5,true, '2023-07-29 18:00:00.111000 +00:00'),
                                                                                                                    (4,8, 3,   23,11,1,0,false,'2023-07-29 18:00:00.111000 +00:00'),
                                                                                                                    (4,8, 3,   24,11,3,0,false,'2023-07-29 18:00:00.111000 +00:00'),

                                                                                                                    (5,9, 1,  21,11,1,0,false,'2023-08-16 18:00:00.111000 +00:00'),
                                                                                                                    (5,9, 5,  22,11,3,0,false,'2023-08-16 18:00:00.111000 +00:00'),
                                                                                                                    (5,10,3,  23,11,2,8,true, '2023-08-16 18:00:00.111000 +00:00'),
                                                                                                                    (5,10,4,  10,11,4,10,true,'2023-08-16 18:00:00.111000 +00:00'),

                                                                                                                    (6,11,2,  1,1,1,10,true, '2023-08-18 15:00:00.111000 +00:00'),
                                                                                                                    (6,12,1,  2,1,2,0, false,'2023-08-18 15:00:00.111000 +00:00'),

                                                                                                                    (7,13,2,  6, 4,1,9,true, '2024-01-18 15:00:00.111000 +00:00'),
                                                                                                                    (7,14,1,  34,4,2,0,false,'2024-01-18 15:00:00.111000 +00:00'),

                                                                                                                    (8,15,2,  34,7,2,6,true, '2024-06-25 13:00:00.111000 +00:00'),
                                                                                                                    (8,16,13, 11,7,1,1,false,'2024-06-25 13:00:00.111000 +00:00'),

                                                                                                                    (9,17,2,  34,15,1,8,true, '2024-03-22 15:00:00.111000 +00:00'),
                                                                                                                    (9,18,7,  33,15,2,0,false,'2024-03-22 15:00:00.111000 +00:00'),

                                                                                                                    (10,19,2, 33,15,1,6,true, '2024-03-22 17:00:00.111000 +00:00'),
                                                                                                                    (10,20,7, 34,15,2,0,false,'2024-03-22 17:00:00.111000 +00:00'),

                                                                                                                    (11,21,2, 49,21,1,15,true,'2025-04-13 20:00:00.111000 +00:00'),
                                                                                                                    (11,22,1, 48,21,2,0,false,'2025-04-13 20:00:00.111000 +00:00'),

                                                                                                                    (12,23,1, 1,2,1,0,false,'2025-06-05 20:00:00.111000 +00:00'),
                                                                                                                    (12,23,15,2,2,3,0,false,'2025-06-05 20:00:00.111000 +00:00'),
                                                                                                                    (12,24,3, 3,2,2,12,true,'2025-06-05 20:00:00.111000 +00:00'),
                                                                                                                    (12,24,3, 4,2,4,10,true,'2025-06-05 20:00:00.111000 +00:00'),

                                                                                                                    (13,25,2, 23,11,1,0,true, '2025-06-15 20:00:00.111000 +00:00'),
                                                                                                                    (13,25,3, 48,11,3,1,true, '2025-06-15 20:00:00.111000 +00:00'),
                                                                                                                    (13,26,1, 49,11,2,0,false,'2025-06-15 20:00:00.111000 +00:00'),
                                                                                                                    (13,26,1, 21,11,4,0,false,'2025-06-15 20:00:00.111000 +00:00'),

                                                                                                                    (14,27,8, 49,22,1,4,true, '2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (14,27,9, 18,22,3,6,true, '2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (14,28,10,50,22,2,0,false,'2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (14,28,11,51,22,4,0,false,'2025-06-23 20:00:00.111000 +00:00'),

                                                                                                                    (15,29,3, 4,2,3,5,true, '2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (15,29,8, 1,2,1,7,true, '2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (15,30,4, 6,2,4,0,false,'2025-06-23 20:00:00.111000 +00:00'),
                                                                                                                    (15,30,12,3,2,2,0,false,'2025-06-23 20:00:00.111000 +00:00'),

                                                                                                                    (16,31,2, 49,21,2,8,true, '2025-07-13 20:00:00.111000 +00:00'),
                                                                                                                    (16,32,4, 18,21,1,0,false,'2025-07-13 20:00:00.111000 +00:00'),

                                                                                                                    (17,33,3,52,22,1,11,true,'2025-07-13 20:00:00.111000 +00:00'),
                                                                                                                    (17,34,4,53,22,2,0,false,'2025-07-13 20:00:00.111000 +00:00'),

                                                                                                                    (18,35,1, 51,22,1,0,false,'2025-07-22 20:00:00.111000 +00:00'),
                                                                                                                    (18,36,2, 50,22,2,5,true, '2025-07-22 20:00:00.111000 +00:00'),

                                                                                                                    (19,37,1, 53,22,1,7,true, '2025-07-23 23:00:00.111000 +00:00'),
                                                                                                                    (19,37,2, 33,22,3,8,true, '2025-07-23 23:00:00.111000 +00:00'),
                                                                                                                    (19,38,3, 52,22,2,0,false,'2025-07-23 23:00:00.111000 +00:00'),
                                                                                                                    (19,38,4, 33,22,4,0,false,'2025-07-23 23:00:00.111000 +00:00'),

                                                                                                                    (20,39,3, 10,7,1,0,false,'2025-08-02 20:00:00.111000 +00:00'),
                                                                                                                    (20,40,4, 13,7,2,7,true, '2025-08-02 20:00:00.111000 +00:00'),

                                                                                                                    (21,41,4, 2,1,4,6,true, '2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (21,41,2, 6,1,2,8,true, '2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (21,42,3, 5,1,3,0,false,'2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (21,42,14,1,1,1,0,false,'2025-08-07 00:00:00.111000 +00:00'),

                                                                                                                    (22,43,3, 6,2,2,6,true, '2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (22,43,4, 1,2,4,5,true, '2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (22,44,2, 2,2,3,0,false,'2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (22,44,14,3,2,1,0,false,'2025-08-07 00:00:00.111000 +00:00'),

                                                                                                                    (23,45,14,3,2,1,8,false,'2025-08-07 00:00:00.111000 +00:00'),
                                                                                                                    (23,46,2, 4,2,2,0,true, '2025-08-07 00:00:00.111000 +00:00');
----------------------------------------------------------------------------------------------

drop type attack_type;
drop type card_type;
drop type match_format;

drop table parties;
drop table team_members;
drop table teams;
drop table matches;
drop table extra_characters;
drop table sidekicks;
drop table heroes;
drop table rule_cards;
drop table cards;
drop table decks;
drop table board_tokens;
drop table boards;
drop table sets;
drop table users;





SELECT pg_size_pretty( pg_database_size( 'unmatched_tracker_db' ) );




