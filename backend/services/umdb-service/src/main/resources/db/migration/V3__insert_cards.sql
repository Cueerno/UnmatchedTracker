insert into cards(title, type, value, effect)
values
--Medusa
('Gaze of Stone', 'ATTACK', 2, 'After combat: If you won the combat, deal 8 damage to the opposing fighter.'),
('Second Shot (Medusa)', 'ATTACK', 3, 'During combat: You may BOOST this attack.'),
('Dash', 'VERSATILE', 3, 'After combat: Move your fighter up to 3 spaces.'),
('The Hounds of Mighty Zeus', 'VERSATILE', 4, 'After combat: Move each Harpy up to 3 spaces.'),
('Clutching Claws', 'VERSATILE', 3, 'After combat: Your opponent discards 1 card.'),
('Snipe', 'VERSATILE', 3, 'After combat: Draw 1 card.'),
('Feint', 'VERSATILE', 2, 'Immediately: Cancel all effects on your opponent''s card.'),
('Regroup', 'VERSATILE', 1, 'After combat: Draw 1 card. If you won the combat, draw 2 cards instead.'),
('Hiss and Slither', 'DEFENSE', 4, 'After combat: Your opponent discards 1 card.'),
('A Momentary Glance', 'SCHEME', null, 'Deal 2 damage to any one fighter in Medusa''s zone.'),
('Winged Frenzy', 'SCHEME', null,
 'Move each of your fighters up to 3 spaces. You may move them through spaces containing opposing fighters. Then, return a defeated Harpy (if any) to any space in Medusa''s zone.'),

--Sinbad
('Voyage Home', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Take all other VOYAGE cards from your discard pile and add them to your hand.'),
('By Fortune and Fate', 'ATTACK', 3, 'After combat: Draw 2 cards.'),
('Voyage to the Island That Was a Whale', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Sinbad recovers 2 health.'),
('Voyage to the Valley of the Giant Snakes', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Look at your opponent''s hand.'),
('Voyage to the Creature With Eyes Like Coals of Fire', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Your opponent discards 1 random card.'),
('Voyage to the Cannibals With the Root of Madness', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: You may move Sinbad up to 2 spaces.'),
('Voyage to the City of the Man-Eating Apes', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Deal 2 damage to the opposing fighter.'),
('Voyage to the City of the King of Serendib', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each other VOYAGE card in your discard pile. After combat: Draw 1 card.'),
('Commanding Impact', 'ATTACK', 5, 'After combat: Draw 1 card.'),
('Exploit', 'VERSATILE', 4, 'After combat: Draw 1 card.'),
('Toil and Danger', 'VERSATILE', 3, 'After combat: Move Sinbad up to 3 spaces.'),
('Leap Away', 'VERSATILE', 4,
 'After combat: If you won the combat, choose one of the fighters in the combat and move them up to 4 spaces.'),
('Momentous Shift', 'VERSATILE', 3,
 'During combat: If your fighter started this turn in a different space, this card''s value is 5 instead.'),
('Riches Beyond Compare', 'SCHEME', null, 'Draw 3 cards.'),

--Alice
('Claws That Catch', 'ATTACK', 3, 'During combat: If the opposing fighter is a hero, this card''s value is 5 instead.'),
('Snicker-Snack', 'ATTACK', 3,
 'After combat: If you won the combat, look at your opponent''s hand and choose 1 card for them to discard.'),
('O Frabjous Day!', 'ATTACK', 4, 'After combat: Change size.'),
('The Other Side of the Mushroom', 'ATTACK', 3, 'After combat: Move Alice up to 3 spaces. Change size.'),
('Jaws That Bite', 'ATTACK', 4, 'After combat: Deal 2 damage to any one fighter adjacent to the Jabberwock.'),
('Skirmish', 'VERSATILE', 4,
 'After combat: If you won the combat, choose one of the fighters in the combat and move them up to 2 spaces.'),
('Mad as a Hatter', 'VERSATILE', 3, 'After combat: Move each of your fighters up to 2 spaces. Change size.'),
('Manxome Foe', 'VERSATILE', 3,
 'During combat: Discard the top card of your deck. Add its BOOST value to this card''s value.'),
('I''m Late, I''m Late', 'VERSATILE', 2, 'After combat: Move Alice up to 5 spaces. Change size.'),
('Looking Glass', 'DEFENSE', 2, 'After combat: Choose 2 different effects:
- draw 2 cards
- Alice recovers 3 health
- place Alice in any other space'),
('Eat Me (Alice)', 'SCHEME', null, 'Move Alice up to 3 spaces. Change size.'),
('Drink Me', 'SCHEME', null, 'Draw 2 cards. Change size.'),

--King Arthur
('Noble Sacrifice', 'ATTACK', 2,
 'During combat: You may BOOST this attack. (This is in addition to any boost from King Arthur''s special ability.)'),
('Excalibur', 'ATTACK', 6, ''),
('The Aid of Morgana', 'ATTACK', 4, 'After combat: Draw 2 cards.'),
('Aid the Chosen One', 'ATTACK', 4, 'After combat: If you won the combat, draw 2 cards.'),
('Swift Strike', 'ATTACK', 3, 'After combat: Move your fighter up to 4 spaces.'),
('Divine Intervention', 'VERSATILE', 3, 'After combat: Move King Arthur up to 5 spaces.'),
('The Holy Grail', 'DEFENSE', 1,
 'After combat: If King Arthur has 4 or less health but is not defeated, set his health to 8.'),
('Bewilderment', 'DEFENSE', 0,
 'During combat: Prevent all damage After combat: You may place your fighter in any space.'),
('The Lady of the Lake', 'SCHEME', null,
 'Search your deck and discard pile for the EXCALIBUR card. Add it to your hand. If you searched your deck, shuffle it.'),
('Prophecy', 'SCHEME', null,
 'Look at the top 4 cards of your deck. Add 2 of them to your hand and put the other 2 back on top of your deck, in any order.'),
('Restless Spirits', 'SCHEME', null,
 'Choose any space in Merlin''s zone. Deal 2 damage to each opposing fighter in that space and in one adjacent space. If at least one fighter is defeated this way, draw 1 card.'),
('Command the Storms', 'SCHEME', null, 'Move each fighter up to 3 spaces. (This includes opposing fighters.)'),

--Robin Hood
('Ambush', 'ATTACK', 2,
 'During combat: Your opponent discards 1 random card. Add its BOOST value to this card''s attack value.'),
('A Hunter''s Eye', 'ATTACK', 5, ''),
('Disarming Shot', 'ATTACK', 4,
 'After combat: Draw a number of cards equal to the amount of damage dealt to the opposing fighter.'),
('Piercing Shot', 'ATTACK', 2, 'After combat: Draw 2 cards.'),
('Highway Robbery', 'ATTACK', 2,
 'Immediately: Cancel all effects on your opponent''s card and ignore its defense value.'),
('Snark', 'VERSATILE', 3, 'After combat: If your fighter is adjacent to the opposing fighter, draw 1 card.'),
('Wily Fighting', 'VERSATILE', 3, 'After combat: Deal 1 damage to each opposing fighter adjacent to your fighter.'),
('Defenders of Sherwood', 'DEFENSE', 3,
 'After combat: Draw 1 card. Return a defeated Outlaw (if any) to any space in Robin Hood''s zone.'),
('Steal From the Rich', 'SCHEME', null,
 'Draw 1 card, then choose an opponent. They may choose to discard 1 card. If they do not, draw 1 more card.'),

--Bigfoot
('Larger Than Life', 'ATTACK', 6, ''),
('Savagery', 'ATTACK', 4, 'After combat: If you won the combat, deal 1 damage to each fighter adjacent to Bigfoot.'),
('Disengage', 'ATTACK', 4,
 'After combat: Choose an empty space in this fighter''s zone. Place this fighter in that space.'),
('Hoax', 'VERSATILE', 4,
 'After combat: Move your fighter up to 5 spaces. You may move that fighter through spaces containing opposing fighters.'),
('It''s Just Your Imagination', 'DEFENSE', 3, 'Immediately: Cancel all effects on your opponent''s card.'),
('Crash Through the Trees', 'SCHEME', null,
 'Move Bigfoot up to 5 spaces. You may move Bigfoot through spaces containing opposing fighters.'),
('Jackalope Horns', 'SCHEME', null,
 'Move the Jackalope up to 5 spaces. You may move the Jackalope through spaces containing opposing fighters. Then deal 2 damage to any one fighter adjacent to the Jackalope.'),


--Bruce Lee
('Jeet Kune Do: High Straight Lead', 'ATTACK', 3,
 'During combat: If either fighter started this turn in a different space, this card''s value is 5 instead. After combat: Gain 1 action.'),
('Jeet Kune Do: Downward Side Kick', 'ATTACK', 3, 'After combat: Your opponent discards 1 random card. Gain 1 action.'),
('Jeet Kune Do: Wrist Lock', 'ATTACK', 3, 'After combat: Draw 1 card. Gain 1 action.'),
('Jeet Kune Do: Intercepting Fist', 'ATTACK', 3,
 'Immediately: Cancel all effects on your opponent''s card.  After combat: Gain 1 action.'),
('Jeet Kune Do: Corkscrew Finger Jab', 'ATTACK', 3,
 'After combat: Deal 1 damage to the opposing fighter. Gain 1 action.'),
('Jeet Kune Do: Short Lead Hook', 'ATTACK', 3,
 'After combat: Bruce Lee may swap spaces with the opposing fighter. Gain 1 action.'),

('Little Dragon', 'VERSATILE', 2,
 'During combat: If your hand is empty, the value of this card is 6 instead. After combat: Draw 2 cards.'),


('Taste of Blood', 'DEFENSE', 3, 'After combat: If Bruce Lee has 5 or less health, draw 3 cards.'),
('Be Like Water', 'DEFENSE', 3,
 'After combat: Choose a JEET KUNE DO card in your discard pile and add it to your hand.'),
('"HOO! WHAAAAAA!"', 'SCHEME', null,
 'Choose a JEET KUNE DO card in your discard pile and add it to your hand. Gain 1 action.'),
('Bring It On', 'SCHEME', null,
 'Choose an opposing fighter in Bruce Lee''s zone. Place them in any space adjacent to Bruce Lee. Gain 1 action.'),
('One-Inch Punch', 'SCHEME', null,
 'Deal 2 damage to an adjacent fighter. If this defeats that fighter, return this card to your hand instead of discarding it.'),
('Nunchaku', 'SCHEME', null, 'All of Bruce Lee''s attacks this turn are +1 value. Gain 1 action.'),

--InGen
('They Should All Be Destroyed', 'ATTACK', 4,
 'During combat: +1 to this attack for each trap token adjacent to the opposing fighter.'),
('Shoot Her!', 'ATTACK', 3, 'During combat: If this is your first action this turn, this card''s value is 5 instead.'),
('Rending Shot', 'ATTACK', 3, 'After combat: Move the opposing fighter up to 3 spaces.'),
('Second Shot (Ingen)', 'ATTACK', 2, 'During combat: You may BOOST this attack.'),

('Tactical Advance', 'VERSATILE', 3, 'After combat: Move each of your InGen Workers up to 2 spaces.'),


('I''ve Hunted Most Things That Can Hunt You', 'DEFENSE', 4,
 'After combat: Move each of your fighters up to 5 spaces. You may move them through spaces containing opposing fighters.'),
('Call for Backup', 'SCHEME', null, 'Choose 2 different effects:
- place up to 3 traps
- place all of your defeated InGen Workers (if any) in Muldoon''s zone
- draw 2 cards'),
('Remote Detonation', 'SCHEME', null,
 'Choose a trap in the same zone as one of your InGen Workers. Deal 1 damage to each opposing fighter adjacent to that trap. Return that trap to the box.'),

--Raptors
('Clever Girl', 'ATTACK', 3,
 'After combat: If one or more of your Raptors is adjacent to the opposing fighter, gain 1 action.'),
('Pack Hunters', 'ATTACK', 4,
 'After combat: If you won the combat, deal 1 damage to the opposing fighter for each of your Raptors adjacent to them.'),
('They Remember', 'ATTACK', 2, 'After combat: Gain 1 action.'),
('Eviscerate', 'ATTACK', 5, ''),

('Eaten Alive', 'VERSATILE', 4, 'After combat: If you won the combat, deal 1 damage to one adjacent opposing fighter.'),

('Decoy', 'DEFENSE', 3,
 'Immediately: Choose one of your other undefeated Raptors. You may place her adjacent to the opposing fighter.'),
('Coordinated Attack Pattern', 'SCHEME', null,
 'Choose one of your Raptors. You may place each of your other Raptors in any space in the chosen Raptor''s zone.'),
('Working Things Out', 'SCHEME', null,
 'Move each of your Raptors up to 3 spaces. You may move them through spaces containing opposing fighters. Gain 1 action.'),

--Sherlock Holmes
('The Game is Afoot', 'ATTACK', 5, 'After combat: Move Holmes up to 3 spaces.'),
('Service Revolver', 'ATTACK', 5, ''),

('Education Never Ends', 'VERSATILE', 3,
 'After combat: If you won the combat, your opponent draws 1 card. If you lost the combat, you draw 2 cards.'),
('Study Methods', 'VERSATILE', 3, 'After combat: If you won the combat, look at your opponent''s hand.'),
('Deduce Strategy', 'VERSATILE', 3,
 'During combat: You may change the printed value of the opponent''s card to its BOOST value. (If a card does not have a BOOST value, it is treated as 0.)'),
('Counterpunch', 'VERSATILE', 3,
 'After combat: If Holmes is adjacent to the opposing fighter, deal 2 damage to that fighter.'),
('Fixed Point in a Changing Age', 'VERSATILE', 3,
 'After combat: If Dr. Watson is adjacent to Holmes, they each recover 1 health.'),
('Elementary', 'DEFENSE', 3,
 'Play this card face up. Predict the printed attack value of the opponent''s card.  During combat: If you predicted the correct value, cancel all effects on your opponent''s card and ignore its attack value.'),
('Confirm Suspicion', 'SCHEME', null,
 'Choose an opponent and name a value. Your opponent must choose and discard one card matching that attack or defense value. Their hero takes damage equal to the BOOST value of the discarded card. If they do not have a card of the named value, they must reveal their hand instead.'),
('Eliminate the Impossible', 'SCHEME', null,
 'Choose an opponent. Look at their hand and choose 1 card for them to discard.'),
('Master of Disguise', 'SCHEME', null,
 'Choose an opponent. Holmes swaps spaces with their hero. Deal 1 damage to that hero.'),
('Administer Aid', 'SCHEME', null,
 'Place Dr. Watson in a space adjacent to Holmes. Holmes recovers 1 health. Draw 1 card.'),

--Dracula

('Feeding Frenzy', 'ATTACK', 2,
 'During combat: This card''s value is +1 for each Sister in the same zone as the opposing fighter.'),
('Beastform', 'ATTACK', 6,
 'During combat: You may discard any number of cards from your hand. This card''s value is +1 for each card you discard.'),
('Thirst for Sustenance', 'ATTACK', 3,
 'After combat: If you won the combat, place Dracula in any space adjacent to the opposing fighter.'),


('Do My Bidding', 'DEFENSE', 3,
 'Immediately: Return your opponent''s attack card to their hand. Look at their hand and choose an attack or versatile card for them to play. (It may be the same card.)'),
('Look Into My Eyes', 'DEFENSE', 1,
 'During combat: Add the BOOST value from your opponent''s attack card to the defense value of this card.'),
('Mistform', 'SCHEME', null, 'Place Dracula in any space.
Gain 1 action.'),
('Prey Upon', 'SCHEME', null,
 'Deal 1 damage to all opposing fighters adjacent to Dracula. Dracula recovers 1 health for each damage dealt.'),
('Baptism of Blood', 'SCHEME', null,
 'Recover 2 health. Return a defeated Sister (if any) to any space in Dracula''s zone.'),
('Ravening Seduction', 'SCHEME', null,
 'Move any fighter up to 2 spaces. After moving, deal 1 damage to the moved fighter for each Sister adjacent to them.'),

--Jekyll & Hyde
('Recoiling Blow', 'ATTACK', 5, 'After combat: Place Mr. Hyde in any space in his zone.
Transform to Dr. Jekyll.'),
('Forever Hyde', 'ATTACK', 5,
 'During combat: You may discard Dr. Jekyll cards. Add 2 to this card''s value for each card discarded.'),


('Duality of Man', 'VERSATILE', 3,
 'During combat: If you are Dr. Jekyll and playing this card to defend, this card''s value is 6 instead. If you are Mr. Hyde and playing this card to attack, this card''s value is 6 instead.'),
('Distracted Triage', 'VERSATILE', 3, 'After combat: If you won the combat, recover 2 health.'),
('Succumb to Compulsion', 'VERSATILE', 2, 'After combat: Move up to 2 spaces. Transform to Mr. Hyde.'),
('Madness Relents', 'VERSATILE', 4, 'After combat: Transform to Dr. Jekyll.'),
('With Haste!', 'DEFENSE', 4, 'After combat: Move Dr. Jekyll up to 4 spaces.'),
('Scientific Method', 'DEFENSE', 2, 'After combat: Draw a number of cards equal to the damage you were dealt.'),
('Calming Research', 'SCHEME', null,
 'Recover 2 health. Draw up to 3 cards. Keep one and put any others on the bottom of your deck in any order.'),
('Pure Evil', 'SCHEME', null,
 'Place Mr. Hyde in any space in his zone. Mr. Hyde deals 2 damage to all adjacent fighters.'),
('Strange Case', 'SCHEME', null,
 'Reveal the top card of your deck. Deal damage equal to its BOOST value to one adjacent fighter. Put the card in your hand.'),

--Invisible Man
('Surprise Attack', 'ATTACK', 5,
 'Immediately: Cancel all effects on your opponent''s card.  After combat: If Invisible Man is on a space with a fog token, move that fog token to another space.'),
('Slip Away', 'ATTACK', 3,
 'After combat: Move 1 fog token to a space without a fighter, then place Invisible Man on that space.'),
('Emerge From Mist', 'ATTACK', 3,
 'During combat: If Invisible Man started this turn on a space with a fog token, this card''s value is 5 instead.'),
('Covert Preparation', 'VERSATILE', 2,
 'After combat: Draw 1 card. Move 1 fog token up to 2 spaces, then your opponent moves a different fog token up to 2 spaces.'),
('Dreaming of Revenge', 'VERSATILE', 3,
 'After combat: If Invisible Man is on a space with a fog token, all opposing fighters on spaces with fog tokens take 1 damage.'),
('Confound', 'VERSATILE', 3,
 'After combat: Your opponent may choose to discard 1 card. If they do not, you may move each fog token to any other space.'),
('Impossible to See', 'VERSATILE', 2,
 'Immediately: The value of your opponent''s attack or defense is 0 and cannot be changed by card effects. (Other card effects still happen.)'),
('Lurking', 'DEFENSE', 2, 'After combat: Draw 1 card and choose 1 effect:
- move Invisible Man to a space with a fog token
- move 1 fog token up to 3 spaces'),
('Into Thin Air', 'DEFENSE', 4,
 'After combat: Move Invisible Man up to 1 space. Your opponent then moves a fog token up to 3 spaces.'),
('Coded Notes', 'DEFENSE', 3,
 'After combat: Draw 3 cards, then choose 2 cards from your hand and put them on top of your deck in any order.'),
('Reign of Terror', 'SCHEME', null,
 'If Invisible Man is on a space with a fog token, deal 2 damage to any one opposing fighter.'),
('Vanish', 'SCHEME', null,
 'Recover 1 health. Remove Invisible Man from the board. At the start of your next turn, place Invisible Man in any space. (If you played this as your first action, end your turn.)'),
('Step Lightly', 'SCHEME', null,
 'Deal 1 damage to one adjacent fighter. If Invisible Man is on a space with a fog token, deal 3 damage instead. Your opponent then moves a fog token up to 2 spaces.'),
('Rolling Fog', 'SCHEME', null, 'Move 1 fog token to another space. Gain 1 action.'),

--Buffy
('Military Knowledge', 'ATTACK', 4, 'After combat: Draw 1 card.'),
('Daring Strike', 'ATTACK', 4, 'After combat: If you won the combat, draw 2 cards. Otherwise, take 1 damage.'),
('Mr. Pointy', 'ATTACK', 5, ''),


('Right-hand Man', 'VERSATILE', 2,
 'During combat: if Xander is adjacent to Buffy, the value of this card is 6 instead.'),
('Rapid Recovery', 'VERSATILE', 3, 'After combat: Buffy recovers 1 health.'),

('Slayer''s Strength', 'VERSATILE', 4,
 'After combat: You may move all fighters adjacent to Buffy to another space in their zone. Then, deal 1 damage to each fighter you moved.'),

('Cartwheel Kick', 'DEFENSE', 2,
 'After combat: You may move Buffy up to 3 spaces. Then, deal 1 damage to each opposing fighter adjacent to her.'),
('Insight', 'SCHEME', null,
 'Choose an opponent and look at their hand. Choose 1 card in their hand for them to discard.'),
('Training', 'SCHEME', null, 'Draw 3 cards.'),

--Angel
('Wisdom of Ages', 'ATTACK', 3, 'After combat: Draw 1 card.'),
('Five by Five', 'ATTACK', 5, 'After combat: Move Faith up to 5 spaces. She may move through opposing fighters.'),
('Cursed with a Soul', 'ATTACK', 4, 'After combat: If you lost the combat, recover 1 health.'),
('Angelus, Scourge of Europe', 'ATTACK', 5, ''),

('Brooding', 'VERSATILE', 3, 'After combat: If you lost the combat, the opposing fighter takes 1 damage.'),


('The Rogue Slayer', 'VERSATILE', 3, 'After combat: Deal 1 damage to each opposing fighter adjacent to Faith.'),
('Haunted by the Faces', 'DEFENSE', 3,
 'After combat: If you lost the combat, you may place Angel in any space in his zone.'),
('Killer of the Dead', 'SCHEME', null, 'Deal 2 damage to one opposing fighter adjacent to Faith.'),

--Spike
('The Rush', 'ATTACK', 3,
 'During combat: If Spike or the opposing fighter is in a space with a shadow token, the value of this card is 5 instead.'),
('Arrogance', 'ATTACK', 4,
 'During combat: You may discard your hand (even if your hand is empty). If you do, the value of this card is 6 instead.'),

('Empathy', 'VERSATILE', 3,
 'After combat: Draw 1 card. If the opposing fighter is in a space with a shadow token, draw 3 cards instead.'),
('Always Surprising', 'VERSATILE', 1,
 'During combat: BLIND BOOST this card. If Drusilla''s space has a shadow token, double the BOOST value.'),


('Bloody Hell!', 'VERSATILE', 3,
 'After combat: Deal 1 damage to the opposing fighter, then deal an additional 1 damage for each space with a shadow token adjacent to them.'),
('Let''s Dance', 'VERSATILE', 4,
 'During combat: If Spike or the opposing fighter is in a space with a shadow token,  you may BOOST this card.'),
('Seek the Shadows', 'SCHEME', null, 'Draw 2 cards.
Place a shadow token in Spike''s space and each space adjacent to it.'),
('The Sight', 'SCHEME', null,
 'Choose an opponent and look at their hand. Choose a card for them to discard. If any of their fighters are in a space with a shadow token, choose 2 cards for them to discard instead.'),

--Willow
('Flayed Alive', 'ATTACK', 4, 'During combat: (DARK) BLIND BOOST this attack.'),
('When Good Magic Fails', 'ATTACK', 4,
 'After combat: (DARK) Move Willow to any space in her zone. Discard the top card of your deck.'),

('Black Magic', 'VERSATILE', 3, 'During combat: (DARK) BLIND BOOST this card.'),
('Hacker', 'VERSATILE', 2,
 'After combat: Look at the top card of your deck, then choose to put it on the top of your deck or the bottom of your deck.'),
('Knowledge of the Craft', 'VERSATILE', 4,
 'After combat: If you won the combat, choose a card in your discard pile and add it to your hand.'),
('Revoke', 'VERSATILE', 3, 'Immediately: Cancel any abilities on your opponent''s card.'),


('Meditation', 'DEFENSE', 5, 'After combat: (DARK) Become Willow.'),
('Love and Loss', 'SCHEME', null, 'Draw 2 cards.
(DARK) Discard the top 2 cards of your deck. Deal 3 damage to a sidekick in your zone (even if it''s your own).'),
('Resurrect', 'SCHEME', null,
 'Choose a friendly fighter who has been defeated. Place that fighter in any space in Willow''s zone and set their health to 3.'),

--Beowulf
('Epic Poem', 'ATTACK', 2,
 'Immediately: Gain 1 Rage. During combat: This card''s value is +1 for each Rage you have. (You do not spend Rage for this effect.)'),
('The Ancient Heirloom', 'ATTACK', 3,
 'This card''s effects cannot be canceled.  During combat: You may spend 2 Rage to make this card''s value 5 instead. You may spend 1 Rage to BOOST this card. (You may do both.)'),
('No Contest Expecteth', 'ATTACK', 3,
 'After combat: If you attacked a sidekick and won the combat, you may spend 3 Rage to defeat that sidekick.'),
('Hot for the Battle', 'ATTACK', 3, 'After combat: Wiglaf may swap spaces with Beowulf.'),
('Fatal Struggle', 'ATTACK', 4,
 'After combat: If you won the combat, draw 2 cards. If you lost the combat, your opponent draws 2 cards.'),

('The War-King', 'VERSATILE', 1,
 'During combat: Spend any amount of Rage. This card''s value is +2 for each Rage spent.'),

('The Equal of Grendel', 'DEFENSE', 3,
 'Immediately: You may spend 2 Rage to deal damage to the opposing fighter equal to the printed value of their card.'),
('Remnant of Valor', 'SCHEME', null,
 'Wiglaf deals 1 damage to each adjacent fighter. If Beowulf was dealt damage this way, gain 1 action.'),
('Vigor and Courage', 'SCHEME', null,
 'Choose an opponent. They discard 1 random card. Gain rage equal to its BOOST value.'),
('Golden Drinking Horn', 'SCHEME', null,
 'Spend any amount of Rage. Choose a different effect for each Rage spent: - draw 2 cards - move Beowulf up to 4 spaces - Beowulf recovers 2 health.'),

--Little Red Riding Hood
('What Large Hands You Have 🐺', 'ATTACK', 2, 'After combat: You may return this card to your hand.
🌹 Instead, you may return the top card of your discard pile to your hand.'),
('What Big Ears You Have 🐺', 'ATTACK', 4, '⚔️ You may play this card as a defense card.'),
('Long Have I Sought You ⚔️', 'ATTACK', 4,
 'During combat: If the Huntsman is adjacent to the opposing fighter, the value of this card is 6 instead.'),
('What Big Eyes You Have 🐺', 'VERSATILE', 3, 'Immediately: Cancel all effects on your opponent''s card.
🌹 Also ignore the value of your opponent''s card.'),
('What''s That In My Basket? 🌟 ', 'VERSATILE', 4, '(🌟 counts as any one 🐺🌹⚔️ symbol.)'),
('Stones in the Belly 🌹', 'VERSATILE', 2,
 'During combat: ⚔️ Your opponent discards 1 random card. Add its BOOST value to this card''s value.'),
('Once Upon a Time 🌹', 'VERSATILE', 2, 'After combat: ⚔️ Deal 3 damage to the opposing fighter.'),
('The Wolf''s Skin ⚔️', 'DEFENSE', 2, 'After combat: 🐺 Draw 2 cards.'),
('What a Terrible Big Mouth You Have ⚔️', 'DEFENSE', 2,
 'After combat: 🐺  Deal damage to the opposing fighter equal to the printed value of their card.'),
('Never Leave the Path 🐺', 'SCHEME', null, '🐺  Place Little Red in any space. Gain 1 action.
⚔️ Deal 2 damage to each opposing fighter in Little Red''s zone.
🌹 Draw 3 cards.'),
('Into the Woods 🐺🌹⚔️', 'SCHEME', null, 'Move Little Red up to 3 spaces. Gain 1 action.'),
('A Grimm Tale 🌹', 'SCHEME', null, 'Little Red Recovers 2 health.
🐺 Little Red recovers 4 health instead.'),

--Deadpool
('3 of Hearts', 'ATTACK', 3, 'After combat: Draw 1 card.'),
('Wanna bet?', 'ATTACK', 2,
 'After combat: If you won the game your opponent buys you a drink. If you lost the game, you buy them a drink.'),
('Rob''s Pouch & Shoe Emporium', 'ATTACK', 4, 'After combat: Move the opposing fighter one space. Just one.'),
('Cha-Ching!', 'ATTACK', 1, 'During combat: You may BOOST this card.'),
('Klunkin'' Heads', 'ATTACK', 4,
 'After combat: If you won the combat, deal 3 damage to each other opposing fighter adjacent to the opposing fighter.'),
('Deadpool™ Merc For Hire, LLC', 'ATTACK', 5,
 'After combat: Deal 1 damage to the opposing fighter if you own the Deadpool Unmatched set.'),
('Exploding CardItem!', 'ATTACK', 1,
 'During combat: If you made an exploding noise when you revealed the card the value of this card is 4.'),

('Excuse me while I grow some limbs.', 'ATTACK', 3,
 'After combat: Your opponent discards a card. If you won the combat, they discard two instead.'),
('Underrated Super Heroes', 'ATTACK', 6, ''),
('Xavier Institute Faculty', 'ATTACK', 3, 'You may play this card as a ranged attack.'),
('Chimichanga Break!', 'VERSATILE', 2,
 'During combat: If there is food on the table, the value of this card is 5 instead.'),
('And For My Next Move...', 'VERSATILE', 2,
 'After combat: Deal 2 damage to the opposing fighter OR move your fighter up to 3 spaces.'),
('Gimme Gimme Chimichanga', 'VERSATILE', 3, 'After combat: Draw a card. Recover 1 health.'),
('Non-Retinal Scan Access to Danger Room', 'VERSATILE', 3,
 'After combat: Look at your opponent''s hand. Recover 1 health.'),
('Time out time out time out!', 'VERSATILE', 0,
 'Immediately: Call time out. Look through your deck and pick a card you could play. Discard this card and play that one instead.'),
('Push to Teleport', 'VERSATILE', 2, 'After combat: Draw 1 card.'),
('I Always Get The Last Word', 'VERSATILE', 3, 'After combat: If you attacked, deal 1 damage to the opposing fighter.'),

('Super Feint', 'VERSATILE', 4,
 'This card can''t be canceled! Immediately: Cancel all effects on your opponent''s card.  After combat: Draw 1 card.'),
('Call Me', 'VERSATILE', 3,
 'During combat: If your opponent''s name is on this card, its value is 4. After combat: Your opponent writes their name on this card if it''s not there already.'),
('I''m Not Wearing Pants', 'VERSATILE', 2,
 'During combat: If this card isn''t sleeved, its value is 5. After combat: If you''re not wearing any pants, go put some on.'),
('Eat Me (Deadpool)', 'DEFENSE', 2,
 'Tee-hee! Immediately: Say "eat me" to your opponent. During combat: Say "eat me" to your opponent. After combat: If you lost combat, say "eat me" to your opponent.'),
('Passwords', 'DEFENSE', 5, 'After combat: Your opponent looks at your hand and chooses a card for you to discard.'),
('Transit CardItem', 'DEFENSE', 2, 'After combat: Move to any space in your zone.'),
('They Have An Amazing Buffet', 'DEFENSE', 3,
 'After combat: Recover 2 health. Then, if you are at full health, take 2 damage.'),
('Dumpster Divin'' Deadpool', 'SCHEME', null,
 'Shuffle 5 cards from your discard pile into your deck. Recover 1 health.'),
('Holy Mackerel!', 'SCHEME', null,
 'Guess the name of a card in your opponent''s hand. Your opponent must discard all cards with that name. Otherwise they say "go fish" and you draw a card.'),
('Sweeet!', 'SCHEME', null,
 'Move to a space in a yellow-ish zone. Then move to a different space in a yellow-ish zone.'),
('Faint', 'SCHEME', null, 'Tip your figure over. Make a fainting noise. Recover 2 health. Reset your figure.'),

--Achilles
('Battle Frenzy', 'ATTACK', 3, 'After combat: Deal 2 damage to both fighters in the combat.'),
('Test For Weakness', 'ATTACK', 1, 'After combat: RELENTLESS ASSAULT: 3 ATK'),
('The Day of Your Doom', 'ATTACK', 3,
 'During combat: You may deal 2 damage to Patroclus. If you do, the value of this attack is 5 instead.'),
('Brothers In Arms', 'ATTACK', 4, 'After combat: If Patroclus is not defeated, gain 1 action.'),

('Battle Hardened', 'VERSATILE', 2, 'After combat: Choose a card in your discard pile and return it to your hand.'),

('Blessed By Hermes', 'VERSATILE', 3,
 'After combat: Move each of your fighters up to 3 spaces. They may move through opposing fighters.'),

('Under Achilles'' Helm', 'DEFENSE', 2,
 'Immediately: If Patroclus is not defeated, Achilles may swap spaces with him. If he does, Patroclus is now the defender.'),
('Achilles'' Heel', 'DEFENSE', 4, 'After combat: If you lost the combat, your opponent gains 1 action.'),
('Spear Throw', 'SCHEME', null, 'Deal 2 damage to an opposing fighter in Achilles'' zone.'),

--Bloody Mary
('Out Of The Mirror', 'ATTACK', 1,
 'During combat: Your opponent discards 1 random card. Add its BOOST value to this card''s value. After combat: If this is your third action, draw 1 card.'),
('Ghostly Touch', 'ATTACK', 1,
 'During combat: You may BOOST this attack. After combat: If this is your third action this turn, recover 3 health.'),
('Speak Three Times', 'ATTACK', 3,
 'During combat: If this is your third action this turn, this card''s value is 7 instead.'),
('Bloody Requiem', 'ATTACK', 3, 'After combat: BLOODY REPRISE: 0 ATK
DURING COMBAT: If your opponent played a card against BLOODY REQUIEM, this attack''s value is that card''s printed value.'),

('Trick of the Light', 'VERSATILE', 2,
 'After combat: You may place Bloody Mary in any empty space adjacent to the opposing fighter.'),
('Broken Glass', 'VERSATILE', 3,
 'During combat: You may increase or decrease the value of this card by 1. After combat: If the value of this card matches your opponent''s card, draw 1 card and the opposing fighter takes 2 damage.'),
('Jump Scare', 'VERSATILE', 3,
 'During combat: If Bloody Mary shares no zones with the space she started in this turn, this card''s value is 6 instead.'),
('Infinity Mirror', 'VERSATILE', 4,
 'After combat: Choose one of the fighters in the combat and move them up to 4 spaces.'),
('Mirror Image', 'DEFENSE', 0,
 'During combat: The value of this card is equal to the printed value of your opponent''s card.'),
('Evade', 'DEFENSE', 3, 'After combat: Draw 1 card.'),
('Stolen Memories', 'SCHEME', null,
 'Look at an opponent''s hand and choose a card. Your opponent may discard it. If they don''t, their hero takes damage equal to its BOOST value.'),
('Closer Than She Appears', 'SCHEME', null, 'Move your fighter up to 1 space. Draw 1 card. Gain 1 action.'),

--Sun Wukong
('Infinite Strikes', 'ATTACK', 2,
 'During combat: For each other friendly fighter adjacent to the opposing fighter, increase the value of this card by +1. After combat: Gain 1 action.'),
('Ruyi Jingo Bang', 'ATTACK', 0, 'After combat: If your opponent played a defense card, TRICKED YOU.
TRICKED YOU: 4 ATK'),
('Taunting Laughter', 'ATTACK', 3,
 'Immediately: Your opponent may discard 1 card from their hand. If they don''t, ignore their card''s value.'),
('Ox Form', 'ATTACK', 7,
 'This card''s effects cannot be canceled.  During combat: If your opponent played a card, they may BOOST it.'),
('72 Transformations', 'VERSATILE', 2,
 'After combat: Take an OX FORM, TORTOISE FORM, or PHOENIX FORM from your discard pile and return it to your hand.'),
('Sly Monkey', 'VERSATILE', 2,
 'After combat: If Sun Wukong played this card, summon a Clone in Sun Wukong''s space, then place Sun Wukong in a space in his zone.'),


('Golden Chain Mail', 'DEFENSE', 4,
 'During combat: Any combat damage you would take is dealt to the opposing fighter instead.'),
('Tortoise Form', 'DEFENSE', 5, 'During combat: Your opponent may BOOST their attack.'),
('Fiery Eyes That See', 'SCHEME', null,
 'Look at an opponent''s hand and choose a card. Put that card on the bottom of their deck. You each draw 1 card.'),
('Phoenix Form', 'SCHEME', null, 'Sun Wukong recovers 1 health for each Clone on the board.'),

--Yennenga
('Surprise Volley', 'ATTACK', 3,
 'Immediately: You may return a defeated Archer to a space in the opposing fighter''s zone. If you do, that Archer is now the attacker. If not, gain 1 action.'),
('Rain of Arrows', 'ATTACK', 3, 'After combat: VOLLEY: 3 ATK'),
('Pin the Prey', 'VERSATILE', 1,
 'After combat: Move the opposing fighter up to 4 spaces. Your opponent discards 1 card.'),
('Divide and Conquer', 'VERSATILE', 2,
 'During combat: If your fighter is not in Yennenga''s zone, the value of this card is a 4 instead.'),
('Point Blank', 'VERSATILE', 2, 'After combat: If the opposing fighter is adjacent to Yennenga, deal them 2 damage.'),

('Jaws of the Beast', 'VERSATILE', 3,
 'During combat: For each zone the opposing fighter is in, increase the value of this card by +1.'),

('Stallion Charge', 'VERSATILE', 3,
 'After combat: Move Yennenga up to 5 spaces. She may move through opposing fighters. Then, deal 1 damage to each opposing fighter she moved through.'),
('Shield Formation', 'DEFENSE', 3,
 'Immediately: Your opponent may discard a card. If they don''t, return a defeated Archer to a space in Yennenga''s zone.'),
('One With The Land', 'SCHEME', null,
 'Move each of your fighters up to 2 spaces. Each of your fighters recovers 1 health. Draw 1 card.'),
('Master of the Hunt', 'SCHEME', null, 'Gain 2 actions.'),

--Luke Cage
('Sweet Christmas!', 'ATTACK', 6, ''),

('Get Paid', 'ATTACK', 4, 'After combat: If you won the combat, draw 2 cards.'),
('Hero For Hire', 'ATTACK', 3, 'During combat: You may BOOST this attack.'),
('Still Standing', 'ATTACK', 4,
 'After combat: If you won the combat, choose 2 cards in your discard pile and shuffle them into your deck.'),
('Pushback', 'VERSATILE', 2, 'After combat: Move the opposing fighter up to 3 spaces.'),
('Daughter of the Dragon', 'VERSATILE', 2,
 'During combat: If Misty Knight is adjacent to the opposing fighter, the value of this card is 6 instead.'),

('Skin Like Titanium', 'DEFENSE', 0,
 'After combat: If you lost the combat, deal damage to the opposing fighter equal to the amount of combat damage you took.'),
('Power Man', 'DEFENSE', 2,
 'After combat: Move the opposing fighter up to 3 spaces. You may move them through other opposing fighters. Deal 1 damage to them and each opposing fighter they moved through.'),
('Got My Back?', 'DEFENSE', 1,
 'Immediately: Misty Knight may swap spaces with Luke Cage. If she does, Luke Cage is now the defender.'),
('Trash Talk', 'DEFENSE', 2,
 'Immediately: Cancel all effects on your opponent''s card.  After combat: If you won the combat, end the turn.'),
('Where''s My Money?', 'SCHEME', null, 'Place Luke Cage adjacent to the nearest opposing fighter.
Gain 1 action.'),

--Moon Knight
('I''m Not Real', 'ATTACK', 4, 'After combat: You may change to your next identity.'),
('That''s Why I Always Win', 'ATTACK', 3, 'During combat: You may BOOST this attack.'),
('Good Enough For Us', 'VERSATILE', 4, 'After combat: You may draw 2 cards. If you do, take 2 damage.'),
('That''s The Part I Like', 'VERSATILE', 3,
 'After combat: If you won the combat, you may look at the top 3 cards of your opponent''s deck and discard one of them. Place the other 2 back in any order.'),
('Fist of Khonshu', 'VERSATILE', 3, 'After combat: If you won the combat, move the opposing fighter up to 4 spaces.'),
('Let Your Insanity Guide You', 'VERSATILE', 1,
 'After combat: Discard the top card of your deck. Draw cards equal to that card''s BOOST value.'),
('Past and Present Intermingle', 'VERSATILE', 2,
 'During combat: Add the BOOST value of the top card of your discard pile to this card''s value.'),
('A Totally Sane Thing To Do', 'VERSATILE', 2, 'After combat: You may deal 2 damage to both fighters in the combat.'),

('We''re All In This Together', 'DEFENSE', 3, 'After combat: If you won the combat, draw 1 card.'),
('Madness Will Keep You Alive', 'SCHEME', null, 'Recover 2 health.
If you started your turn in a different space, gain 1 action.'),
('Travelers of The Night', 'SCHEME', null, 'Move your fighter up to 4 spaces. They may move through opposing fighters.
Gain 1 action.'),

--Ghost Rider
('Spirit Of Vengeance', 'ATTACK', 5, 'After combat: You may spend 1 Hellfire to draw 2 cards.'),
('I Brought The Devil With Me', 'ATTACK', 3, 'After combat: You may spend 2 Hellfire to gain 1 action.'),
('Blaze of Glory', 'ATTACK', 2,
 'After combat: Spend any amount of Hellfire, Deal that much damage to each fighter in Ghost Rider''s zone (including Ghost Rider).'),
('I Finally Escaped Hell', 'VERSATILE', 3,
 'After combat: You may spend 1 Hellfire to move Ghost Rider up to 2 spaces.'),

('Control The Demon', 'VERSATILE', 0,
 'During combat: This card''s value is +1 for each Hellfire you have. (You do not spend Hellfire for this effect.)'),
('Penance Stare', 'VERSATILE', 3,
 'During combat: Add the BOOST value of the opposing fighter''s card to this card''s value. You may spend 2 Hellfire to do it a second time.'),
('The Wicked Will Burn', 'VERSATILE', 3,
 'After combat: If Ghost Rider started this turn in a different space, gain 2 Hellfire.'),
('Stoke The Flames', 'DEFENSE', 2,
 'After combat: If you lost the combat, gain Hellfire equal to the combat damage you took.'),
('Deal With The Devil', 'DEFENSE', 2,
 'During combat: You may spend any amount of Hellfire. Increase the value of this card by that amount.'),
('Hell Rides With Me', 'SCHEME', null, 'Move Ghost Rider and up to one adjacent fighter up to 4 spaces each.
Gain 2 Hellfire. Gain 1 action.'),
('Chains of Hellfire', 'SCHEME', null, 'Set your Hellfire to 5.'),

--Daredevil
('Man Without Fear', 'ATTACK', 2,
 'During combat: You may BLIND BOOST this attack. (This is in addition to any BLIND BOOST from Daredevil''s special ability.)'),
('Devil of Hell''s Kitchen', 'ATTACK', 4,
 'During combat: If you have no cards in your deck, the value of this card is 8 instead. After combat: Shuffle this card and the top four cards of your discard pile into your deck.'),

('Take A Knee', 'VERSATILE', 3,
 'After combat: Discard the top card of your deck. Recover health equal to its BOOST value.'),
('Grappling Hook', 'VERSATILE', 3, 'After combat: Move Daredevil up to 2 spaces.'),
('Son Of A Boxer', 'DEFENSE', 3,
 'After combat: If you lost the combat, deal 2 damage to a fighter adjacent to Daredevil.'),
('Through Adversity', 'SCHEME', null,
 'Move Daredevil up to 4 spaces. He may move through opposing fighters. Deal 1 damage to each opposing fighter Daredevil moves through.'),
('Breather', 'SCHEME', null,
 'Choose an attack, defense, or versatile card from your discard pile and return it to your hand.'),

--Bullseye
('I Planned To Be Here', 'ATTACK', 2,
 'During combat: If you started your turn in your current space, the value of this card is 5 instead.'),
('I Never Miss', 'ATTACK', 3,
 'During combat: You may BOOST this attack. If you don''t BOOST this attack, draw 1 card.'),
('For My Next Trick', 'ATTACK', 2,
 'After combat: Move one of your fighters up to 1 space. Draw 1 card. Gain 1 action.'),
('World''s Greatest Assassin', 'ATTACK', 4,
 'Immediately: If you already won a combat this turn, ignore the value of your opponent''s card.'),
('Master Strategist', 'VERSATILE', 3,
 'After combat: Move Bullseye exactly 4 spaces. You may move through opposing fighters.'),

('Arrogant But Effective', 'VERSATILE', 2,
 'After combat: You are considered to have won this combat. Move Bullseye up to 2 spaces.'),
('Right Between The Eyes', 'VERSATILE', 3,
 'Immediately: If you already won a combat this turn, your opponent discards 1 card.'),
('Ricochet', 'VERSATILE', 3,
 'After combat: If the opposing fighter was not defeated, deal 1 damage to a fighter in the opposing fighter''s zone.'),
('I''m Better And I''ll Prove It', 'VERSATILE', 2,
 'During combat: If you already won a combat this turn, the value of this card is 6 instead.'),
('Tactical Retreat', 'DEFENSE', 3,
 'After combat: Place Bullseye in a space that shares no zones with his current space.'),
('Study The Target', 'SCHEME', null,
 'Draw 2 cards.If you won a combat this turn, draw 1 additional card and gain 1 action.'),

--Elektra
('Mystic Assassin', 'ATTACK', 6, 'After combat: Elektra takes 3 damage.RESURRECTED: Elektra takes no damage instead.'),
('The Fist', 'ATTACK', 3,
 'After combat: You may deal 1 damage to your attacking fighter. If you do, return this card to your hand and gain 1 action.'),
('Hands of Red', 'ATTACK', 4, 'After combat: Return a defeated Hand to a space in Elektra''s zone.'),
('Ninjitsu', 'VERSATILE', 3, 'After combat: Place your fighter in any space.'),
('Whirlwind', 'VERSATILE', 2, 'After combat: RESURRECTED: Deal 1 damage to each adjacent opposing fighter.'),
('Cloaked In Shadow', 'VERSATILE', 2,
 'Immediately: Cancel all effects on your opponent''s card.  After combat: RESURRECTED: Move Elektra up to 3 spaces.'),
('Sai', 'VERSATILE', 4, ''),
('Intercept', 'DEFENSE', 3,
 'During combat: RESURRECTED: You may reveal a card named SAI from your hand. If you do, the value of this card is 5 instead.'),
('Snakeroot Clan', 'DEFENSE', 1,
 'Immediately: Elektra may swap spaces with a Hand. If she does, that Hand is now the defender.'),
('Mesmerize', 'SCHEME', null,
 'Choose an opponent and look at their hand. Gain 1 action.RESURRECTED: Choose 1 card for them to discard.'),

--Dr. Ellie Sattler
('You Never Had Control, That''s the Illusion', 'ATTACK', 2,
 'During combat: Increase the value of this card by the number of insight tokens on the board. Remove all insight tokens from the board.'),
('Woman Inherits the Earth', 'VERSATILE', 2,
 'Immediately: Draw 1 card. Dr Sattler recovers health equal to the number of insight tokens on the board. Remove all insight tokens from the board.'),
('Violently, If Necessary', 'VERSATILE', 3,
 'After combat: Deal 2 damage to each opposing fighter on or adjacent to a space with an insight token.'),
('Sexism in Survival Situations', 'VERSATILE', 1,
 'During combat: If the opposing fighter is a hero, the value of this card is 4 instead. After combat: You may move Dr. Sattler 1 space.'),
('Chaotician', 'VERSATILE', 2, 'After combat: Place an insight token in any space.'),
('Life Finds a Way', 'VERSATILE', 2,
 'After combat: Your opponent discards the top card of their deck. Dr. Malcolm and Dr. Sattler recover health equal to that card''s BOOST value.'),
('Must Go Faster', 'VERSATILE', 3,
 'After combat: If you won the combat, you may place Dr. Malcolm and Dr. Sattler in any space.'),
('I Think We''re Back In Business', 'VERSATILE', 0,
 'During combat: The value of this card is equal to the number of cards in your hand.'),
('Hey! Hey! Hey!', 'VERSATILE', 3, 'After combat: Move your other fighter up to 4 spaces.'),


('Lock The Doors!', 'DEFENSE', 2,
 'After combat: Deal 2 damage to the opposing fighter. Move your fighter up to 2 spaces.'),
('The Concept of Attraction', 'DEFENSE', 2,
 'After combat: You may place your fighter on any space with an insight token.'),
('The Future Ex-Mrs. Malcolm', 'SCHEME', null,
 'Draw 2 cards. Place an insight token in Dr. Malcolm''s space. Gain 1 action.'),

--T. Rex
('Reckless Lunge', 'ATTACK', 3, 'After combat: Deal 3 damage to the opposing fighter. Then, take 3 damage.'),
('When Dinosaurs Ruled the Earth', 'ATTACK', 2,
 'During combat: You may BOOST this card. After combat: If you won the combat, draw 1 card, gain 1 action, and take 2 damage.'),
('15,000 Pounds of Muscle', 'ATTACK', 3,
 'During combat: Ignore the value of your opponent''s card. After combat: Take 2 damage.'),

('Thrash', 'VERSATILE', 2,
 'During combat: You may BOOST this card. After combat: If you won the combat, deal 1 damage to each opposing fighter in T-Rex''s zone.'),
('Terrifying Roar', 'VERSATILE', 3, 'Immediately: Fighters cannot leave their spaces for the rest of the turn.'),

('You''re Just Making Her Angry', 'DEFENSE', 1,
 'During combat: You may BOOST this card. After combat: If you won the combat, return this card to your hand.'),
('65 Million Years of Gut Instinct', 'SCHEME', null,
 'Choose a card in your discard pile other than "65 Million Years of Gut Instinct" and return it to your hand.'),
('Ripples in the Water', 'SCHEME', null,
 'Place T-Rex in any space in her zone. Then, each opponent with a fighter adjacent to T-Rex discards 1 random card.'),

--Harry Houdini
('The Big Reveal', 'ATTACK', 2,
 'During combat: You may BOOST this card twice. After combat: Return one card you boosted with to your hand.'),
('Sleight of Hand', 'ATTACK', 1,
 'BOOSTED WITH: Draw 1 card. Immediately: You may return this card to your hand and choose a different card to play. Resolve all effects on that card as normal.'),
('Flourish', 'ATTACK', 3, 'BOOSTED WITH: Draw 1 card.  During combat: You may BOOST this card.'),
('An Illusion of My Own Design', 'ATTACK', 4,
 'Immediately: Your opponent may BOOST their card. During combat: You may BOOST this card.'),
('Vanishing Act', 'VERSATILE', 2,
 'After combat: Choose one of the fighters in the combat and move them up to 3 spaces. They may move through their opposing fighters.'),
('Smoke and Mirrors', 'VERSATILE', 3,
 'Immediately: Houdini and Bess may swap spaces. If they do, your other fighter is now in the combat.'),
('Misdirection', 'VERSATILE', 2,
 'BOOSTED WITH: Deal 2 damage to any fighter. Immediately: Cancel all effects on your opponent''s card.'),
('And the Beautiful Bess!', 'VERSATILE', 3, 'If you discard this card as a result of an opponent''s effect, draw 1 card.
BOOSTED WITH: If it''s your turn, gain 1 action.'),
('Grand Escape', 'DEFENSE', 2,
 'During combat: You may BOOST this card. After combat: If you won the combat, place your fighter in any space.'),
('All Part of the Show', 'DEFENSE', 2, 'This card''s effect cannot be canceled.
BOOSTED WITH: Houdini recovers 2 health.   After combat: If your fighter was defeated, set their health to 4 instead and place them in any space. (This effect happens even if Houdini was defeated.)'),
('Set the Stage', 'SCHEME', null, 'Draw 3 cards. Then, put a card in your hand on top of your deck.
BOOSTED WITH: Look at an opponent''s hand and choose a card for them to discard.'),
('A Magician Never Reveals His Secrets', 'SCHEME', null, 'Draw 2 cards. Gain 1 action.
If an effect would let an opponent look at your hand, you may reveal this card and cancel that effect.'),

--The Genie
('Your Wish is My Command', 'ATTACK', 3,
 'After combat: If you won the combat, you may discard 2 cards to gain 1 action.'),
('Imprisoned Wrath', 'ATTACK', 3,
 'After combat: You may discard 2 cards to deal 2 damage to an adjacent opposing fighter.'),
('I Am Freed', 'ATTACK', 3,
 'After combat: Place the Genie in any empty space. Then, deal 1 damage to each adjacent fighter.'),
('Careful What You Wish For', 'ATTACK', 4,
 'After combat: If you lost the combat, deal 1 damage to an adjacent opposing fighter.'),
('Wishing For More Wishes', 'VERSATILE', 3, 'After combat: Your opponent draws 1 card. Draw 3 cards.'),
('This is No Parlor Trick', 'VERSATILE', 1,
 'During combat: The value of your opponent''s card is equal to its BOOST value.'),
('I''ve Made Sultans Out of Less', 'VERSATILE', 2,
 'After combat: Look at your opponent''s hand and choose a card for them to discard.'),
('I Grant You Death', 'VERSATILE', 2, 'After combat: You may deal 1 damage to an adjacent fighter.'),

('Prisoner''s Torment', 'DEFENSE', 1, 'After combat: Draw cards equal to the amount of combat damage you took.'),
('Back In The Lamp', 'DEFENSE', 0, 'Immediately: The Genie recovers 4 health.'),
('Three Wishes', 'SCHEME', null, 'Gain 1 action and choose one effect:
- draw 5 cards
- for the rest of your turn, your cards'' values are 4 and cannot be changed
- each opponent discards 2 cards'),

--Ms. Marvel
('Big Wind Up', 'ATTACK', 4,
 'During combat: If Ms. Marvel''s space shares no zones with the opposing fighter, you may BOOST this card.'),
('I''m Not Touching You', 'ATTACK', 4,
 'After combat: If Ms. Marvel''s space shares no zones with the opposing fighter, draw 2 cards.'),
('Fangirl', 'ATTACK', 0, 'During combat: The value of this card is equal to the number of cards in your hand.'),
('Easy Peasy', 'VERSATILE', 3,
 'After combat: Draw 1 card. Then, if you have 4 or more cards in your hand, deal 1 damage to an adjacent fighter.'),
('Embiggen', 'VERSATILE', 3,
 'During combat: If Ms. Marvel is in more zones than the opposing fighter, the value of this card is 6 instead.'),
('Shrink! Shrink! Shrink!', 'VERSATILE', 2, 'After combat: Choose one effect. If Ms. Marvel''s space shares no zones with the opposing fighter, do both:
- your opponent discards 1 card
- move the opposing fighter up to 3 spaces'),


('Slingshot', 'DEFENSE', 3, 'After combat: Place Ms. Marvel in any space in her zone.'),
('Friends and Family', 'SCHEME', null,
 'Draw 2 cards. Then, you may spend an additional action to draw until you have 7 cards in your hand.'),
('Gyro and Fries', 'SCHEME', null, 'Recover 2 health. Then, if you have 4 or more cards in your hand, gain 1 action.'),

--Squirrel Girl
('Bite of Steel', 'ATTACK', 2,
 'During combat: If there are four or more squirrels in the opposing fighter''s zone, the value of this card is 5 instead.'),
('Fuzzball Special', 'ATTACK', 3, 'After combat: Move each squirrel up to 3 spaces.'),
('Kick Butts', 'ATTACK', 1,
 'During combat: Increase the value of this card by +1 for each squirrel adjacent to the opposing fighter.'),
('Call of the Mild', 'VERSATILE', 2,
 'During combat: If there are four or more squirrels in your fighter''s zone, the value of this card is 4 instead. After combat: If you won the combat, draw 2 cards.'),
('Get ''Em Tippy-Toe!', 'VERSATILE', 3, 'After combat: Summon two squirrels in any space.'),
('Unbeatable Squirrel Girl', 'VERSATILE', 4,
 'Immediately: If there are four or more squirrels adjacent to the opposing fighter, cancel all effects on your opponent''s card and ignore its value.'),
('Squirmish', 'VERSATILE', 4,
 'After combat: Summon a squirrel in Squirrel Girl''s space. Then, you place Squirrel Girl in any space in her zone.'),


('Squirgility', 'DEFENSE', 3,
 'After combat: Move Squirrel Girl up to 3 spaces. She may move through sidekicks. Do not count movement for spaces containing sidekicks.'),
('Eat Nuts', 'SCHEME', null,
 'Squirrel Girl recovers 2 health. Summon a squirrel in a space adjacent to Squirrel Girl.'),
('Horde of Squirrels', 'SCHEME', null,
 'Choose a space with four or more squirrels adjacent to it. Deal 2 damage to a fighter in that space.'),
('Nutwork of Spies', 'SCHEME', null,
 'Look at an opponent''s hand and choose 1 card for them to discard. If one of their fighters is adjacent to four or more squirrels, choose 2 cards instead.'),

--Cloak and Dagger
('Channel the Dark', 'ATTACK', 2,
 'After combat: If Cloak played this card, place the opposing fighter adjacent to Dagger and gain 1 action.'),
('Darkforce Dimension', 'ATTACK', 4,
 'After combat: Place the opposing fighter in any space. Your opponent discards 1 card.'),
('Into the Void', 'ATTACK', 2, 'During combat: You may BOOST this attack.'),
('Lightforce Barrage', 'ATTACK', 7,
 'This card''s effects cannot be canceled.   After combat: If you won the combat, your fighter takes damage equal to the amount of damage you dealt.'),

('Into Darkness', 'VERSATILE', 3,
 'After combat: Choose one of the fighters in the combat and move them up to 3 spaces.'),
('Perfect Balance', 'VERSATILE', 4,
 'During combat: If Cloak and Dagger are both adjacent to the opposing fighter, the value of this card is 6 instead.'),
('The Living Light', 'VERSATILE', 3,
 'After combat: If Cloak played this to defend, Dagger recovers 2 health. If Dagger played this to attack, Cloak recovers 2 health.'),
('Traverse the Darkforce', 'VERSATILE', 2, 'After combat: Move each of your fighters up to 2 spaces.'),

('Living Shadow', 'DEFENSE', 2,
 'During combat: If Dagger played this card, she swaps spaces with Cloak, Cloak is now the defender, and the value of this card is 4 instead.'),
('Chosen Fate', 'SCHEME', null,
 'Deal up to 4 damage to one of your fighters. Your other fighter recovers that amount of health. Draw 2 cards'),

--Black Widow
('Fake Out', 'ATTACK', 1, 'After combat: If you lost the combat, draw 1 card and gain 1 action.'),
('Widow''s Sting', 'ATTACK', 5, 'After combat: Move Black Widow up to 3 spaces.'),
('Widow''s Bite', 'ATTACK', 4, 'After combat: If you won the combat, your opponent discards 1 card.'),
('Acting Director of S.H.I.E.L.D.', 'VERSATILE', 4,
 'After combat: Move each of your fighters up to 3 spaces. They may move through opposing fighters. Then, shuffle 1 scheme from your discard pile into your deck.'),
('Caught in a Web', 'VERSATILE', 3, 'During combat: Cancel all AFTER COMBAT effects on your opponent''s card.'),

('Widow''s Kiss', 'VERSATILE', 4,
 'Immediately: The opposing fighter may not leave their space for the rest of the turn.'),
('Widow''s Line', 'VERSATILE', 3, 'After combat: Move the opposing fighter up to 2 spaces.'),
('Double Identity', 'DEFENSE', 3,
 'Immediately: Black Widow and Maria Hill may swap spaces. If they do, your other fighter is now the defender.'),
('Life Model Decoy', 'DEFENSE', 0,
 'After combat: If Maria Hill was defeated, place her adjacent to Black Widow. If you do, set Maria Hill''s health to 3.'),
('The Budapest Gambit', 'SCHEME', null, 'Mission: You have 2 or fewer other cards in your hand.
Draw 5 cards. Each opponent discards 1 random card. Acquire a new mission.'),
('The Firenze Agenda', 'SCHEME', null, 'Mission: Black Widow is adjacent to an opposing hero.
Deal 2 damage to each opposing fighter in Black Widow''s zone. Acquire a new mission.'),
('The Kinshasa Directive', 'SCHEME', null, 'Mission: Black Widow is in your starting space.
Choose an opponent. They discard 2 cards. Acquire a new mission.'),
('The Madripoor Sanction', 'SCHEME', null, 'Mission: Black Widow is in an opponent''s starting space.
Deal 2 damage to each of that opponent''s fighters. Acquire a new mission.'),
('The Moscow Protocol', 'SCHEME', null, 'Mission: An opposing fighter took damage this turn.
Draw 1 card and gain 1 action. Acquire a new mission.'),

--Black Panther
('Analyze and Adjust', 'ATTACK', 3,
 'After combat: Reveal the top card of your opponent''s deck and store it in your Vibranium Suit.'),
('Vibranium Shockwave', 'ATTACK', 2, 'During combat: You may BOOST this card.'),
('Ancestral Insight', 'VERSATILE', 4,
 'After combat: If you won the combat, reveal the top card of your opponent''s deck and store it in your Vibranium Suit.'),
('Anti-Metal Claws', 'VERSATILE', 1,
 'During combat: Add the BOOST value of the opposing fighter''s card to this card''s value. Then, You may BOOST this card.'),
('Cat-Like Reflexes', 'VERSATILE', 3,
 'After combat: If you won the combat, move one of the fighters in the combat up to 3 spaces.'),

('Nanotriage Processor', 'VERSATILE', 2,
 'After combat: Shuri recovers 1 health. If Black Panther is in the same zone as Shuri, he also recovers 1 health.'),

('Wakanda Forever!', 'VERSATILE', 3,
 'During combat: You may BOOST this card up to two times. (Draw a card for Black Panther''s special ability each time you BOOST.)'),
('Microweave Mesh', 'DEFENSE', 2, 'During combat: You may BOOST this card.'),
('Stalking Panther', 'SCHEME', null,
 'Move each of your fighters up to 3 spaces. They may move through opposing fighters. Gain 1 action.'),
('Tactical Remote Scanning', 'SCHEME', null,
 'Choose an opponent. Reveal the top 2 cards of their deck and store them in your Vibranium Suit.'),

--Winter Soldier
('Bionic Arm', 'ATTACK', 2,
 'During combat: If Winter Soldier is adjacent to the opposing fighter, the value of this card is 6 instead. After combat: {RED ROOM} Your opponent moves each of their fighters up to 5 spaces.'),
('Marksman', 'ATTACK', 1,
 'During combat: Add +1 to this card''s value for each space between you and the opposing fighter along the shortest path.'),
('Programmed to Kill', 'ATTACK', 4, 'After combat: {RED ROOM} If you won the combat, take 2 damage.'),
('Without Remorse', 'ATTACK', 6, 'After combat: {RED ROOM} Your opponent may draw 1 card.'),

('Reflex Memories', 'VERSATILE', 5, 'After combat: {RED ROOM} Discard 2 random cards, then draw 2 cards'),
('Reprogram', 'VERSATILE', 2, 'After combat: Choose 3 cards in your discard pile and shuffle them into your deck.'),

('Born in the Barracks', 'VERSATILE', 3, 'After combat: If you won the combat, Winter Soldier recovers 2 health.'),
('Complete the Mission', 'DEFENSE', 3,
 'During combat: You may BOOST this card. After combat: Deal damage to the opposing fighter equal to the amount of combat damage you took.'),
('A Boy Named Bucky', 'SCHEME', null,
 'Ignore any {RED ROOM} effects on your cards for the rest of your turn. Gain 1 action.'),
('Manipulation', 'SCHEME', null, 'Draw until you have 5 cards in your hand.
{RED ROOM} Each opponent may draw until they have 5 cards in their hand.'),

--Spider-Man

('Swinging Kick', 'ATTACK', 6,
 'After combat: You may move the opposing fighter a number of spaces up to the amount of combat damage dealt.'),
('Thwip!', 'ATTACK', 4, 'After combat: If you won the combat, place Spider-Man in any space in his zone.'),

('Right in the Face!', 'VERSATILE', 4, 'Immediately: Your opponent can''t draw cards this turn.'),
('Spider-Sense Tingling!', 'VERSATILE', 2,
 'After combat: If the value of your opponent''s card is 4 or higher, draw 2 cards.'),
('Wall Crawler', 'VERSATILE', 3, 'After combat: Place Spider-Man in any space in his zone.'),

('Counter-Attack', 'DEFENSE', 3,
 'After combat: If the value of your opponent''s card is 4 or higher, deal 2 damage to the opposing fighter.'),
('Web Shooters', 'DEFENSE', 3, 'During combat: Spider-Man cannot take more than 2 combat damage this combat.'),
('Friendly Neighborhood Spider-Man', 'SCHEME', null, 'Recover 3 Health. Place Spider-Man in any space in his zone.'),
('With Great Power', 'SCHEME', null,
 'All of Spider-Man''s attacks this turn are +1 value. Draw 1 card. Gain 1 action.'),

--She-Hulk
('The Savage She-Hulk', 'ATTACK', 3,
 'During combat: You may spend an additional action to make this card''s value 9 instead.'),
('Sensational', 'ATTACK', 4,
 'After combat: If you won the combat, you may choose a card in your discard pile and shuffle it into your deck.'),
('Omega-Level Threat', 'ATTACK', 5,
 'After combat: If you dealt 2 or more combat damage, your opponent discards 2 random cards.'),
('Cease and Desist', 'VERSATILE', 1,
 'Immediately: Cancel all effects on your opponent''s card. During combat: If you are attacking, the value of this card is 4 instead.'),
('Legalese', 'VERSATILE', 2,
 'After combat: If you won the combat, your opponent chooses whether you both draw a card or both discard a card. If you lost the combat, you make the choice instead (see above).'),
('Nerve Cluster Strike', 'VERSATILE', 3,
 'Immediately: If She-Hulk is adjacent to the opposing fighter, the opposing fighter may not leave their space this turn.'),
('Green Energy', 'VERSATILE', 4,
 'After combat: If you won the combat, deal 1 damage to each fighter adjacent to She-Hulk.'),
('Lady Justice', 'DEFENSE', 0,
 'During combat: Discard the top card of your opponent''s deck. Increase the value of this card by twice that card''s boost value.'),
('The Defense Rests', 'DEFENSE', 2, 'After combat: Draw cards equal to the amount of combat damage you took.'),
('Double Jeopardy', 'SCHEME', null, 'Draw 2 cards and recover 2 health.'),
('Jennifer Walters, Esq.', 'SCHEME', null, 'Place She-Hulk in a starting space. Draw 1 card. Gain 1 action.'),
('Leap Toward', 'SCHEME', null,
 'Move She-Hulk up to 4 spaces. She may move through opposing fighters. Then, if she is adjacent to an opposing fighter, gain 1 action.'),

--Doctor Strange
('Bolts of Balthakk', 'ATTACK', 2,
 'During combat: You may BLIND BOOST this card. After combat: If you won the combat, gain 1 action.'),
('The Rings of Raggadorr', 'ATTACK', 4,
 'After combat: If you won the combat, your fighter and each friendly fighter adjacent to them recover health equal to the damage dealt.'),
('The Winds of Watoomb', 'ATTACK', 4,
 'After combat: Your opponent places Dr. Strange in a starting space. Place the opposing fighter in another starting space. All players shuffle their decks.'),
('Cloak of Levitation', 'VERSATILE', 2,
 'During combat: If Dr. Strange is adjacent to the opposing fighter, ignore the value of your opponent''s card.'),
('Steadfast Disciple', 'VERSATILE', 2,
 'After combat: If Wong is adjacent to the opposing fighter, deal 1 damage to the opposing fighter and draw 1 card.'),
('Master of Kamar-Taj', 'VERSATILE', 2,
 'During combat: If Dr. Strange and Wong are adjacent, this card''s value is 4 instead.'),
('Seven Suns of Cinnibus', 'VERSATILE', 3,
 'If the value of this card is above 7, ignore its value.  During combat: You may BLIND BOOST this card up to two times.'),

('The Mists of Munnopor', 'DEFENSE', 2,
 'Immediately: Discard your opponent''s card. They reveal cards from their deck until they reveal an attack or versatile card they can play. They play that card and randomly put the rest of the revealed cards on the bottom of their deck.'),
('Eye of Agamotto', 'SCHEME', null, 'Shuffle your hand into your deck. Draw 5 cards. Gain 1 action.'),
('No Really, I''m a Doctor', 'SCHEME', null,
 'Reveal a card from your hand and put it on top of your deck. Dr. Strange or a friendly fighter adjacent to him recovers health equal to that card''s boost value.'),

--Nikola Tesla
('7 Hertz', 'ATTACK', 4,
 'After combat: You may discharge coils: - 1 Coil: Gain 1 action. - 2 Coils: Also, draw 1 card.'),
('The Alternating Current', 'ATTACK', 5,
 'After combat: Choose one: - Charge both coils - Discharge both coils to have Tesla recover 2 health'),
('Death Ray', 'ATTACK', 3,
 'During combat: You may discharge coils: - 1 Coil: This card''s value is 5. - 2 Coils: Instead, this card''s value is 7.'),
('Kinetic Induction', 'VERSATILE', 2, 'After combat: Charge one coil. If you won the combat, charge both.'),
('Lightning Storm', 'VERSATILE', 3,
 'After combat: You may discharge coils: - 1 Coil: Deal 1 damage to each opposing fighter in your zone. - 2 Coils: Instead, deal 2 damage.'),
('Polyphase Coils', 'VERSATILE', 3,
 'Immediately: You may discharge coils: - 1 Coil: Cancel all effects on your opponent''s card. - 2 Coils: Also, ignore that card''s value.'),
('Repulsion Blast', 'VERSATILE', 2,
 'After combat: Move the opposing fighter up to 2 spaces. You may discharge coils: - 1 Coil: Also, move Tesla up to 2 spaces. - 2 Coils: Also, your opponent discards 1 random card.'),
('X-Ray Radiation', 'VERSATILE', 4,
 'During combat: Reveal the top card of your opponent''s deck. You may discharge coils: - 1 Coil: Discard that card. - 2 Coils: Also, add its boost value to this card''s value.'),
('Intense Experimentation', 'DEFENSE', 3,
 'After combat: Draw 1 card. You may discharge coils: - 1 Coil: Instead, draw 2 cards. - 2 Coils: Instead, draw 3 cards and Tesla recovers 1 health.'),
('Fully Charged', 'SCHEME', null, 'Charge both coils. Gain 1 action.'),
('Remote Control', 'SCHEME', null, 'Move all opposing fighters up to 2 spaces. Gain 1 action.'),

--Dr. Jill Trent
('Battle of Wits', 'ATTACK', 2,
 'After combat: Reveal the top card of your deck and your opponent''s deck. If your card has a higher BOOST value, deal 3 damage to the opposing fighter.'),
('Energizing Spray', 'ATTACK', 5, 'After combat: Gain 1 action.'),
('Utility Belt', 'VERSATILE', 3,
 'After combat: Choose one: -Jill Trent recovers 1 health, -Move Jill Trent 1 space, -Draw 1 card'),
('Stasis Diffuser', 'VERSATILE', 3,
 'Immediately: The value of your opponent''s card is equal to its printed value and cannot be changed.'),
('Gyroscopic Jetpack', 'VERSATILE', 4,
 'After combat: Move your fighter up to 2 spaces. They may move through opposing fighters.'),
('Laser Pen', 'VERSATILE', 2, 'After combat: Deal 1 damage to the opposing fighter.'),
('Insightful Deduction', 'VERSATILE', 3,
 'After combat: Reveal the top 3 cards of your opponent''s deck. Put one of them on the bottom of the deck and the rest on top in any order.'),
('Caught Red-Handed', 'VERSATILE', 1,
 'After combat: Your opponent discards 1 card. If you won the combat, they discard 2 cards instead.'),
('Sisters in Arms', 'VERSATILE', 3,
 'This card''s effects cannot be canceled. If Daisy and Jill Trent are adjacent and Daisy is attacking, Daisy gains the effect of Jill Trent''s gadget.'),
('Ace Fighter', 'VERSATILE', 5, 'After combat: Draw 1 card.'),
('Hypnotist', 'DEFENSE', 3,
 'Immediately: If your active gadget is Hypnoray Blaster, cancel all effects on your opponent''s card.'),
('Indestructible Cloth', 'DEFENSE', 5,
 'Immediately: This combat, your fighter does not take damage from effects other than combat damage.'),
('Helpful Assistant', 'SCHEME', null,
 'Shuffle up to 3 Jill Trent cards in your discard pile back into your deck. Draw 1 card.'),

--Golden Bat
('A Punch to Shake the Earth', 'ATTACK', 1,
 'After combat: Deal 1 damage to each opposing fighter in Golden Bat''s zone. If you won the combat, deal 2 damage instead.'),
('Super Strength', 'ATTACK', 5, ''),
('Vaporizing Eyebeams', 'ATTACK', 2, 'After combat: Your opponent discards 1 random card.'),
('Insight of the Ancients', 'VERSATILE', 3,
 'After combat: If you won the combat, return a random card in your discard pile to your hand.'),
('Like a Flash of Golden Light', 'VERSATILE', 2,
 'During combat: If Golden Bat shares no zones with the space he started this turn in, this card''s value is 4 instead. After combat: Move Golden Bat up to 5 spaces.'),
('Sight Beyond Sight', 'VERSATILE', 2,
 'After combat: Look at the top 3 cards of your opponent''s deck. Put them back in any order.'),

('He Laughs at Your Feebleness', 'DEFENSE', 5, ''),
('Imposing Presence', 'DEFENSE', 3, 'Immediately: Cancel all effects on your opponent''s card.'),
('Alpine Fortress', 'SCHEME', null,
 'Choose a card in your discard pile and shuffle it into your deck. Draw 2 cards. Move Golden Bat up to 4 spaces.'),
('Arrive Just in Time', 'SCHEME', null, 'Place Golden Bat in any space.'),

--Annie Christmas
('Lagniappe', 'ATTACK', 5,
 'Immediately: Deal up to 2 damage to Annie to draw that many cards. (This may cause her special ability to apply.)'),
('Bottom Dealing', 'ATTACK', 3,
 'During combat: Reveal the bottom card of your deck. Increase the value of this card by the BOOST value of the revealed card, then put the revealed card on the top or the bottom of your deck.'),
('Keep Your Hands to Yourself', 'VERSATILE', 3, 'After combat: Move each fighter in the combat up to 2 spaces.'),
('Striking Beauty', 'VERSATILE', 1,
 'After combat: Deal 1 damage to the opposing fighter. If you won the combat, deal 2 damage instead.'),
('Better Together', 'VERSATILE', 4,
 'After combat: If your fighter is adjacent to a friendly fighter, your fighter and each friendly fighter adjacent to them recover 1 health.'),
('Long Shot', 'VERSATILE', 3,
 'During combat: If the opposing fighter is not adjacent to your fighter, this card''s value is 5 instead.'),
('Quite a Pair', 'VERSATILE', 3,
 'Immediately: You may reveal two cards from your hand with the same name. If you do, cancel all effects on your opponent''s card.'),
('The Turn and the River', 'VERSATILE', 2, 'After combat: Draw 2 cards.'),
('Mississippi Queen', 'DEFENSE', 2, 'Immediately: Damage cannot reduce Annie''s health below 1 this turn.'),
('Slick Talker', 'DEFENSE', 3,
 'Immediately: Annie and Charlie may swap spaces. If they do, your other fighter is now the defender.'),
('A Few More Pearls', 'SCHEME', null, 'Deal 2 damage to each opposing fighter adjacent to Annie.'),
('Captain''s Orders', 'SCHEME', null,
 'Place Annie in any space in her zone. Then, place another friendly fighter in any space in Annie''s zone. Gain 1 action.'),

--Tomoe Gozen
('Fearsome Strength', 'ATTACK', 3,
 'Immediately: Tomoe Gozen may swap spaces with an adjacent fighter.  After combat: Deal 1 damage to an adjacent fighter.'),
('Witness My Last Battle', 'ATTACK', 7,
 'This attack can only target a fighter adjacent to Tomoe Gozen. Play it face up.   After combat: End the turn.'),
('Five Against Thousands', 'ATTACK', 4,
 'After combat: If Tomoe Gozen is adjacent to the opposing fighter, you may discard a card to put this card back into your hand.'),
('A Warrior''s Way', 'ATTACK', 2,
 'After combat: Move the opposing fighter up to 3 spaces. Then, if they are a hero, place Tomoe Gozen in a space adjacent to them.'),

('Confront Any Demon or God', 'VERSATILE', 3,
 'After combat: Draw 1 card. Then, if you lost the combat, look at your opponent''s hand and choose 1 card for them to discard.'),
('A Worthy Opponent', 'VERSATILE', 3,
 'During combat: If the opposing fighter is a hero, this card''s value is 5 instead.'),
('Flash of Steel', 'VERSATILE', 2,
 'Immediately: If the opposing fighter is a hero, cancel all effects on your opponent''s card.  After combat: If the opposing fighter is adjacent, deal 1 damage to them.'),

('Refuse to Retreat', 'DEFENSE', 3,
 'Immediately: Tomoe Gozen cannot leave her space for the rest of the turn.  After combat: If the opposing fighter is adjacent, your opponent discards 1 card.'),
('Deeds of Valor', 'DEFENSE', 2, 'During combat: Tomoe Gozen cannot take more than 2 combat damage this combat.'),
('Lord Kiso''s Final Stand', 'SCHEME', null, 'Move Tomoe Gozen up to 3 spaces. She may move through sidekicks. Then, choose one:
- Tomoe Gozen recovers 2 health
- gain 1 action'),

--Oda Nobunaga
('Student of War', 'ATTACK', 5,
 'After combat: Draw a number of cards equal to the amount of combat damage dealt to the opposing fighter.'),
('Fire and Flames', 'ATTACK', 3, 'During combat: If the opposing fighter is flanked, this card''s value is 5 instead.'),
('Lightning and Thunder', 'ATTACK', 4,
 'Immediately: If the opposing fighter is flanked, cancel all effects on your opponent''s card.  After combat: Move your fighter up to 2 spaces.'),
('Sun and Moon', 'ATTACK', 2,
 'During combat: If the opposing fighter is flanked, ignore the value of your opponent''s card.'),
('Battle Maneuvers', 'VERSATILE', 2, 'After combat: Draw 1 card. Then, move each of your fighters up to 2 spaces.'),

('Patience and Strategy', 'VERSATILE', 1,
 'After combat: If the opposing fighter is flanked, your fighter recovers 2 health.'),
('Spring the Trap', 'DEFENSE', 2,
 'Immediately: Your fighter may swap spaces with an adjacent friendly fighter. If they do, the other fighter is now the defender.  After combat: Deal 1 damage to the opposing fighter.'),
('Pragmatism', 'DEFENSE', 3, 'Immediately: Cancel all effects on your opponent''s card.'),
('Reinforce', 'SCHEME', null, 'Choose 2 different effects:
- each friendly fighter recovers 1 health
- draw 2 cards
- gain 1 action'),
('Demon King of the Sixth Heaven', 'SCHEME', null, 'Deal 2 damage to each opposing flanked fighter.'),

--Hamlet
('Cruel To Be Kind', 'ATTACK', 2, 'During combat: You may BOOST this card.'),
('Uncertain Doom', 'ATTACK', 2, 'During combat: If your opponent played a versatile card, ignore its value.'),
('To Sleep, Perchance To Dream', 'ATTACK', 3,
 'After combat: If you won the combat, move the opposing fighter a number of spaces up to the amount of combat damage dealt. If you lost the combat, Hamlet recovers 1 health.'),
('The Readiness Is All', 'VERSATILE', 2,
 'After combat: Place one of the fighters in the combat in any space. They cannot leave that space this turn.'),
('The Play''s The Thing', 'VERSATILE', 3,
 'After combat: Your opponent discards 1 random card. If you won the combat, Hamlet recovers health equal to its BOOST value.'),
('Blood Will Have Blood', 'VERSATILE', 2,
 'After combat: If Hamlet took damage this turn, deal 1 damage to the opposing fighter.'),
('Outrageous Fortune', 'VERSATILE', 1,
 'During combat: Discard the top card of your deck. Add its BOOST value to this card''s value. After combat: If you lost the combat, return the card you discarded to your hand.'),
('Maddening Insight', 'DEFENSE', 0,
 'During combat: The value of this card is equal to the number of cards in your hand. After combat: If you won the combat, your opponent discards 1 card.'),
('The Rest Is Silence', 'DEFENSE', 2, 'After combat: End the turn.'),
('Nothing Either Good Or Bad', 'DEFENSE', 2,
 'After combat: If your opponent played a versatile card, deal 2 damage to the opposing fighter.'),
('Method In The Madness', 'SCHEME', null,
 'Put any number of cards in your hand on the bottom of your deck. Then, draw up to that many cards. Gain 1 action.'),
('The Ghost', 'SCHEME', null,
 'Choose one: -Hamlet recovers 2 health -place Hamlet in any space in his zone and gain 1 action'),

--Titania
('Queen Of The Fairies', 'ATTACK', 2,
 'During combat: Increase the value of this card by +1 for each glamour in your glamour discard pile.'),
('Met By Moonlight', 'ATTACK', 5, 'After combat: Place Oberon in a space adjacent to Titania.'),
('As Wise As Beautiful', 'VERSATILE', 2,
 'After combat: Draw 1 card. You may discard your glamour to draw 2 cards instead.'),
('Whisked Away', 'VERSATILE', 4,
 'After combat: Move your fighter up to 2 spaces. You may discard your glamour. If you do, place your fighter in any space.'),
('The Moon Looks Down', 'VERSATILE', 3, 'After combat: Put a discarded glamour on the bottom of your glamour deck.'),
('Fairy Song', 'VERSATILE', 3,
 'During combat: You may discard your glamour. If you do, the value of this card is 5 instead.'),
('Parting Gift', 'VERSATILE', 2, 'After combat: You may deal 2 damage to each fighter in the combat.'),
('But A Dream', 'DEFENSE', 0,
 'Immediately: Cancel all effects on your opponent''s card, ignore its value, and return it to your opponent''s hand.  After combat: Draw 1 card.'),
('Protection Of The Fairy Woods', 'DEFENSE', 2,
 'Immediately: You may discard your glamour. If you do, cancel all effects on your opponent''s card.'),

('Gift Of The Fair Folk', 'SCHEME', null,
 'Choose 2 different effects: -one fighter recovers 2 health -draw 2 cards -move two fighters up to 2 spaces each'),
('What Fools These Mortals Be', 'SCHEME', null,
 'Choose an opponent, look at their hand, and choose a card. They shuffle that card into their deck.'),

--The Wayward Sisters
('Double, Double 🦎', 'ATTACK', 3,
 'During combat: Increase the value of this card by +1 for each different ingredient symbol in your cauldron.'),
('All-Seeing Familiar 🦎', 'ATTACK', 4,
 'Immediately: Return a card in your discard pile to your cauldron.  After combat: If you won the combat, look at the top card of your deck and put it in your hand or cauldron.'),
('Hurly-Burly 🐍', 'ATTACK', 3,
 'During combat: Reveal the top card of your deck. Your opponent chooses one: - put that card in your hand - put that card in your cauldron and add its BOOST value to this card''s value.'),
('Fire Burn And Cauldron Bubble 🦇', 'VERSATILE', 3,
 'Immediately: Return a card in your discard pile to your cauldron.'),
('The Stars Align 🦎', 'VERSATILE', 0,
 'During combat: The value of this card is equal to the number of different zones all of your fighters are in.'),
('Curious Familiar 🦇', 'VERSATILE', 2, 'After combat: Return a card in your cauldron to your hand.'),
('Ward 🦇', 'VERSATILE', 3, 'After combat: Place the opposing fighter in any space in your fighter''s zone.'),
('Toil And Trouble 🐍', 'DEFENSE', 2,
 'During combat: Increase the value of this card by +1 for each different ingredient symbol in your cauldron.'),
('Pricking Of My Thumbs 🐍', 'DEFENSE', 2,
 'After combat: Deal damage to the opposing fighter equal to the amount of combat damage your fighter took.'),
('Unnatural Remedy 🐍', 'DEFENSE', 1,
 'Immediately: Discard up to 3 cards from your cauldron. For each one, choose a fighter to recover 1 health. (You may choose the same fighter more than once.)'),
('Something Wicked This Way Comes 🦇', 'SCHEME', null,
 'Cast any spell. Then, cast a different spell. (Do not discard any cards from your cauldron to cast these spells.)'),
('Prophecy 🦎', 'SCHEME', null,
 'Look at the top 4 cards of your deck. Put 2 of them in your hand and the other 2 back on top of your deck in any order.'),

--William Shakespeare
('Horror 2️⃣', 'ATTACK', 4,
 'LINE EFFECT: Deal 1 damage to the opposing fighter for each other card in your line.  During combat: Increase the value of this card by +1 for each HORROR card in your line.'),
('My Kingdom For A Horse 6️⃣', 'ATTACK', 5, 'LINE EFFECT: Gain 2 actions.'),
('All Are Punished 4️⃣', 'ATTACK', 4,
 'LINE EFFECT: Draw 1 card.   After combat: Deal 1 damage to each other fighter in your zone.'),
('Places, Places! 4️⃣', 'ATTACK', 3,
 'LINE EFFECT: Place Shakespeare in a zone with no Actors.   After combat: Move each Actor up to 3 spaces.'),
('Once More Unto The Breach 6️⃣', 'VERSATILE', 3,
 'LINE EFFECT: Return all defeated Actors to spaces in Shakespeare''s zone.   After combat: Return a defeated Actor to any space in Shakespeare''s zone.'),
('Alas 2️⃣', 'VERSATILE', 2,
 'LINE EFFECT: Draw 2 cards. Shakespeare recovers 2 health.   After combat: If you lost the combat, Shakespeare recovers 1 health.'),
('The Ides Of March 4️⃣', 'VERSATILE', 2, 'LINE EFFECT: Deal 2 damage to any opposing fighter.'),
('Et Tu, Brute? 4️⃣', 'VERSATILE', 3,
 'LINE EFFECT: Place each of your fighters in any space.  During combat: Increase the value of this card by +1 for each of your fighters adjacent to the opposing fighter.'),
('Deceive 2️⃣', 'VERSATILE', 2,
 'LINE EFFECT: Return this card to your hand. Immediately: Cancel all effects on your opponent''s card.'),
('Revise 2️⃣', 'VERSATILE', 1,
 'LINE EFFECT: Move each fighter up to 2 spaces. (This includes opposing fighters.)   After combat: Draw 1 card. If you won the combat, draw 2 cards instead.'),
('Such Sweet Sorrow 4️⃣', 'VERSATILE', 4,
 'LINE EFFECT: Draw 1 card.   After combat: Move your fighter up to 2 spaces.'),
('Again 2️⃣', 'VERSATILE', 3,
 'LINE EFFECT: Draw 1 card.   After combat: You may return the first card in your line to your hand (before you add this to your line).'),

--Eredin
('Brutal Strike', 'ATTACK', 2,
 'This card''s effects cannot be canceled.  During combat: If your opponent''s card has an IMMEDIATELY effect, ignore their card''s value.'),
('Backhand', 'ATTACK', 4,
 'After combat: Your opponent puts 1 random card from their hand on top of their deck. If Eredin is ENRAGED, they discard it instead.'),
('Foul Purpose', 'ATTACK', 3,
 'If Eredin is ENRAGED, you may play this card face-up to target a fighter in any space.   After combat: You may defeat a Red Rider to return this card to your hand.'),
('Unyielding Hordes', 'ATTACK', 1,
 'Immediately: Return a defeated Red Rider to any space. During combat: Add +1 to this card''s value for each other friendly fighter adjacent to the opposing fighter.'),
('Wild Hunt', 'VERSATILE', 3,
 'After combat: Deal 1 damage to each opposing fighter that is adjacent to at least one of your fighters. If Eredin is ENRAGED, deal 2 damage instead.'),

('Icy Guile', 'VERSATILE', 2,
 'Immediately: If Eredin is ENRAGED, cancel all effects on your opponent''s card. During combat: You may defeat a Red Rider to ignore the value of your opponent''s card.'),
('Portal Defense', 'DEFENSE', 0,
 'Immediately: Eredin swaps spaces with an adjacent friendly fighter. That fighter is now the defender.  After combat: If Eredin is ENRAGED, draw 2 cards.'),
('Implacable', 'DEFENSE', 3,
 'If Eredin is ENRAGED, you may play this card as an attack.  During combat: You may BOOST this card.'),
('Might Of The Aen Elle', 'SCHEME', null,
 'Draw 1 card. Gain 1 action. [ONGOING]: Eredin does not take damage except combat damage or from exhaustion. Discard this card at the end of your turn if you didn''t attack.'),
('Close For The Kill', 'SCHEME', null,
 'Draw 2 cards. Move each of your fighters up to 3 spaces each. They may move through opposing fighters.'),

--Philippa
('Chain Lightning', 'ATTACK', 2,
 'After combat: Choose a zone Philippa is in. Deal 1 damage to each opposing fighter in that zone.'),
('Regicide', 'ATTACK', 4, 'During combat: If the opposing fighter is a hero, this card''s value is a 6 instead.'),
('Lightning Bolt', 'ATTACK', 3,
 'After combat: If you haven''t taken a maneuver action this turn, deal 1 damage to each opposing fighter in Philippa''s zone.'),
('Owlform', 'ATTACK', 3,
 'During combat: Discard any number of cards from your hand. Add +1 to this card''s value for each card discarded.'),
('Cunning', 'VERSATILE', 4,
 'After combat: Your opponent may discard 1 card. If they don''t deal 2 damage to the opposing fighter.'),
('Redanian Plot', 'VERSATILE', 2,
 'Immediately: Your opponent may discard 1 card. If they don''t, ignore their card''s value.'),
('Spellbreaker', 'VERSATILE', 2,
 'Immediately: Cancel all effects on your opponent''s card.  After combat: End the turn.'),
('Paralyzing Fetters', 'DEFENSE', 2,
 'Immediately: The value of your opponent''s card is equal to its printed value and cannot be changed.'),
('Blinding Dust', 'DEFENSE', 2,
 'After combat: You may discard 1 card. If you do, deal damage to the opposing fighter equal to its BOOST value.'),
('Backup Plan', 'SCHEME', null, 'Choose one: -set Philippa''s health to 5 -draw 3 cards'),
('Spymaster''s Ruse', 'SCHEME', null,
 'Choose an opponent. They reveal 4 cards from their hand. Choose 2 of those cards for them to discard. Then, they draw 2 cards.'),
('Polymorphy', 'SCHEME', null,
 'Place Philippa in any space. [ONGOING]: Philippa''s move value is 5. Discard this card at the end of your turn if Philippa is not in a zone with an opposing fighter.'),

--Yennefer & Triss
('Incinerate', 'ATTACK', 7,
 'This card''s effects cannot be canceled.  During combat: Your opponent may discard 2 cards to ignore this card''s value.'),
('Merigold''s Hailstorm', 'ATTACK', 4,
 'After combat: Your opponent chooses one: - they discard 2 cards - deal 3 damage to their hero - they discard the top 4 cards of their deck'),
('Portal To Anywhere', 'ATTACK', 1, 'After combat: Place a fighter in the combat in any space. Gain 1 action.'),
('Echoing Blast', 'ATTACK', 3, 'After combat: If you won the combat, return this card to your hand.'),
('Ball Lightning', 'VERSATILE', 3,
 'After combat: If you won the combat, your opponent discards 1 card. Otherwise, both players discard 1 card.'),
('Telepathy', 'VERSATILE', 3,
 'Immediately: Your opponent may discard 1 card. If they don''t cancel all effects on their card.'),
('Quick And Ready', 'VERSATILE', 2, 'After combat: Place your fighter in any space in their zone. Draw 1 card.'),
('Magical Barrier', 'DEFENSE', 4, 'Immediately: Your fighter recovers 1 health.'),
('Advisor To The King', 'SCHEME', null,
 'Each of your fighters recovers 1 health. Draw 1 card. [ONGOING]: Your BOOST values are +1. Discard this card at the end of your turn if you didn''t attack.'),
('Lodge Of Sorceresses', 'SCHEME', null,
 'Each player simultaneously reveals a card from their hand and draws card equal to their card''s BOOST value. Then, the player(s) who drew the most cards deals that much damage to their hero.'),

--Ciri
('Lion Cub Of Cintra 🔵', 'ATTACK', 2,
 'During combat: - 1🔵 This card''s value is 4 instead. - 5🔵 This card''s value is 7 instead.'),
('Channel The Source', 'ATTACK', 2,
 'During combat: You may discard any number of 🔵 cards from your hand. Add +2 to this card''s value for each 🔵 card you discarded.'),
('Bane Of The Aen Elle', 'ATTACK', 4,
 'After combat: Move Ihuarraquax up to 4 spaces. He may move through opposing fighters. Then, deal 1 damage to an opposing fighter he move through.'),
('Pushed To The Brink 🔵', 'VERSATILE', 3,
 'After combat: - 2🔵 Deal 1 damage to the opposing fighter. - 7🔵 Deal 2 damage to an opposing fighter within 3 spaces of Ciri.'),
('The Lady Of Space And Time 🔵', 'VERSATILE', 2,
 'After combat: - 3🔵 Return a card from your discard pile to the top of your deck. - 8🔵 Return a card from your discard pile to your hand. Draw 1 card.'),
('Zireael 🔵', 'VERSATILE', 2,
 'During combat: - 3🔵 This card''s value is a 4 instead. - 5🔵 This card''s value is a 4 instead. Your opponent discards 1 random card.'),
('Blink', 'VERSATILE', 4, 'After combat: Move Ciri up to 3 spaces. She may move through opposing fighters.'),
('Searching Strike', 'VERSATILE', 3,
 'After combat: If you won the combat, you may search your deck for a Source card, reveal it, and add it to your hand.'),
('Parry', 'DEFENSE', 3, 'Immediately: Cancel all effects on your opponent''s card.'),
('Child Of The Elder Blood 🔵', 'SCHEME', null,
 '- 4🔵 Deal 1 damage to each other fighter in Ciri''s zone. - 9🔵 Deal 3 damage to each other fighter in ciri''s zone.'),
('Unicorn Ally', 'SCHEME', null,
 'Ciri recovers 2 health. ONGOING: After each combat your fighter is in, draw 1 card. Discard this card at the end of your turn if you have 5 or more cards in your hand.'),

--Ancient Leshen
('Primeval Slam', 'ATTACK', 4,
 'After combat: Summon a Wolf in the Leshen''s zone. Then move each Wolf up to 3 spaces.'),
('Flock Of Birds', 'ATTACK', 5, 'After combat: You may place the Leshen in any space.'),
('Disturbing Howls', 'ATTACK', 1, 'After combat: Move the opposing fighter up to 2 spaces. Gain 1 action.'),
('Nature Abounds', 'ATTACK', 2,
 'After combat: Draw 1 card for each of your fighters adjacent to the opposing fighter.'),
('Command The Forest', 'ATTACK', 4, 'After combat: If you won the combat, your opponent discards 1 card.'),

('Planted Feet', 'VERSATILE', 4, 'After combat: If your fighter hasn''t left their space this turn, draw 1 card.'),
('Harrying Strike', 'VERSATILE', 2,
 'During combat: Add +2 to this card''s value for each of your fighters adjacent to the opposing fighter.'),
('Primeval Guardian', 'DEFENSE', 5,
 'During combat: Your opponent discards the top card of their deck. Add its BOOST value to their card''s value. After combat: Move each Wolf up to 3 spaces.'),
('Strength Of The Pack', 'SCHEME', null,
 'Summon a Wolf in the Leshen''s zone. [ONGOING]: At the start of your turn, the Leshen recovers 1 health. Discard this card at the end of your turn if there are no Wolves in the Leshen''s zone.'),
('Vanish Into Murder', 'SCHEME', null,
 'Deal 1 damage to each opposing fighter in the Leshen''s zone. Remove the Leshen from the board. At the start of your next turn, place the Leshen in any space. Then, draw 1 card.'),

--Geralt of Rivia
('Igni', 'ATTACK', 0,
 'After combat: Deal 2 damage to the opposing fighter and 1 damage to each other fighter adjacent to Geralt.'),
('GEAR: Sword of Steel', 'ATTACK', 4,
 'After combat: Gain 1 action. If the opposing fighter has 8 or more health, gain 2 actions instead.'),
('Gear: Sword of Silver', 'ATTACK', 4,
 'Immediately: If the opposing fighter''s card has a printed value of 4 or more, ignore its value.'),
('Riposte', 'VERSATILE', 2,
 'After combat: Choose One: - deal 1 damage to an adjacent fighter - Geralt swaps spaces with an adjacent fighter.'),
('Yrden', 'VERSATILE', 2,
 'Immediately: The opposing fighter cannot leave their space this turn.  After combat: Move Geralt up to 2 spaces.'),
('Rend', 'VERSATILE', 3, 'During combat: You may BOOST this card.'),
('Disciplined Duelist', 'VERSATILE', 4,
 'After combat: If the printed value of your opponent''s card is... 2: you may draw a card 3: deal 1 damage to the opposing fighter 4: your opponent discards a card'),
('Damn, You''re Ugly', 'VERSATILE', 5, ''),
('Annoying Tune', 'VERSATILE', 3, 'After combat: Move the opposing fighter up to 4 spaces.'),
('Plot Twist', 'VERSATILE', 2,
 'After combat: Look at your opponent''s hand and choose 1 card for them to discard. Draw 1 card.'),
('GEAR: Wolf Medallion', 'DEFENSE', 3,
 'Immediately: Cancel all effects on your opponent''s card. During combat: If the opposing fighter is not adjacent to Geralt, ignore the value of your opponent''s card.'),
('GEAR: Armor Of The Forgotten Wolf', 'DEFENSE', 2,
 'During combat: Add +1 to this card''s value for each fighter adjacent to Geralt. After combat: End the turn.'),
('Witcher Senses', 'SCHEME', null,
 'Search your deck or discard pile for a GEAR card and add it to your hand. If you took it from your deck, shuffle this card back into your deck.'),
('GEAR: Blizzard', 'SCHEME', null,
 'Draw 1 card. Move your fighter up to 3 spaces. ONGOING: Your opponent can''t gain actions. Discard this card at the end of your turn if you didn''t attack.'),
('GEAR: Tawny Owl', 'SCHEME', null,
 'Draw 2 cards. Gain 1 action. ONGOING: If an effect would cause you to discard a card from your hand, you may choose to ignore it. Discard this card at the end of your turn if you didn''t attack.');

insert into decks_cards(deck_id, card_id, character_name, boost, quantity, image_url)
values (1, 1, 'Medusa', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/gaze-of-stone.png'),--Medusa | Gaze of Stone
       (1, 2, 'Medusa', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/second-shot-3.png'),--Medusa | Second Shot
       (1, 3, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/dash.png'),--Medusa | Dash
       (1, 4, 'Harpy', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/medusa/the-hounds-of-mighty-zeus.png'),--Medusa | The Hounds of Mighty Zeus
       (1, 5, 'Harpy', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/clutching-claws.png'),--Medusa | Clutching Claws
       (1, 6, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/snipe.png'),--Medusa | Snipe
       (1, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/feint.png'),--Medusa | Feint
       (1, 8, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/regroup.png'),--Medusa | Regroup
       (1, 9, 'Medusa', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/medusa/hiss-and-slither.png'),--Medusa | Hiss and Slither
       (1, 10, 'Medusa', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/medusa/a-momentary-glance.png'),--Medusa | A Momentary Glance
       (1, 11, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/medusa/winged-frenzy.png'),--Medusa | Winged Frenzy
       (2, 12, 'Sinbad', 1, 1, 'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-home.png'),--Sinbad | Voyage Home
       (2, 13, 'Porter', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sinbad/by-fortune-and-fate.png'),--Sinbad | By Fortune and Fate
       (2, 14, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-island-that-was-a-whale.png'),--Sinbad | Voyage to the Island That Was a Whale
       (2, 15, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-valley-of-the-giant-snakes.png'),--Sinbad | Voyage to the Valley of the Giant Snakes
       (2, 16, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-creature-with-eyes-like-coals-of-fire.png'),--Sinbad | Voyage to the Creature With Eyes Like Coals of Fire
       (2, 17, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-cannibals-with-the-root-of-madness.png'),--Sinbad | Voyage to the Cannibals With the Root of Madness
       (2, 18, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-city-of-the-man-eating-apes.png'),--Sinbad | Voyage to the City of the Man-Eating Apes
       (2, 19, 'Sinbad', 0, 1,
        'https://static.unmatched.cards/images/umdb/decks/sinbad/voyage-to-the-city-of-the-king-of-serendib.png'),--Sinbad | Voyage to the City of the King of Serendib
       (2, 20, 'Any', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/sinbad/commanding-impact.png'),--Sinbad | Commanding Impact
       (2, 21, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/sinbad/exploit.png'),--Sinbad | Exploit
       (2, 22, 'Sinbad', 1, 4, 'https://static.unmatched.cards/images/umdb/decks/sinbad/toil-and-danger.png'),--Sinbad | Toil and Danger
       (2, 23, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/sinbad/leap-away.png'),--Sinbad | Leap Away
       (2, 24, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sinbad/momentous-shift.png'),--Sinbad | Momentous Shift
       (2, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sinbad/feint.png'),--Sinbad | Feint
       (2, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sinbad/regroup.png'),--Sinbad | Regroup
       (2, 25, 'Sinbad', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/sinbad/riches-beyond-compare.png'),--Sinbad | Riches Beyond Compare
       (3, 26, 'Jabberwock', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/claws-that-catch.png'),--Alice | Claws That Catch
       (3, 27, 'Alice', 4, 1, 'https://static.unmatched.cards/images/umdb/decks/alice/snicker-snack.png'),--Alice | Snicker-Snack
       (3, 28, 'Alice', 4, 1, 'https://static.unmatched.cards/images/umdb/decks/alice/o-frabjous-day.png'),--Alice | O Frabjous Day!
       (3, 29, 'Alice', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/alice/the-other-side-of-the-mushroom.png'),--Alice | The Other Side of the Mushroom
       (3, 30, 'Jabberwock', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/jaws-that-bite.png'),--Alice | Jaws That Bite
       (3, 24, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/momentous-shift.png'),--Alice | Momentous Shift
       (3, 31, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/skirmish.png'),--Alice | Skirmish
       (3, 32, 'Alice', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/mad-as-a-hatter.png'),--Alice | Mad as a Hatter
       (3, 33, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/manxome-foe.png'),--Alice | Manxome Foe
       (3, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/alice/feint.png'),--Alice | Feint
       (3, 8, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/alice/regroup.png'),--Alice | Regroup
       (3, 34, 'Alice', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/alice/i-m-late-i-m-late.png'),--Alice | I''m Late, I''m Late
       (3, 35, 'Alice', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/looking-glass.png'),--Alice | Looking Glass
       (3, 36, 'Alice', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/eat-me.png'),--Alice | Eat Me
       (3, 37, 'Alice', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/alice/drink-me.png'),--Alice | Drink Me
       (4, 38, 'Arthur', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/noble-sacrifice.png'),--King Arthur | Noble Sacrifice
       (4, 39, 'Arthur', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/excalibur.png'),--King Arthur | Excalibur
       (4, 40, 'Arthur', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/the-aid-of-morgana.png'),--King Arthur | The Aid of Morgana
       (4, 41, 'Merlin', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/aid-the-chosen-one.png'),--King Arthur | Aid the Chosen One
       (4, 42, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/swift-strike.png'),--King Arthur | Swift Strike
       (4, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/skirmish.png'),--King Arthur | Skirmish
       (4, 43, 'Arthur', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/divine-intervention.png'),--King Arthur | Divine Intervention
       (4, 24, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/momentous-shift.png'),--King Arthur | Momentous Shift
       (4, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/feint.png'),--King Arthur | Feint
       (4, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/regroup.png'),--King Arthur | Regroup
       (4, 44, 'Arthur', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/the-holy-grail.png'),--King Arthur | The Holy Grail
       (4, 45, 'Merlin', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/bewilderment.png'),--King Arthur | Bewilderment
       (4, 46, 'Arthur', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/the-lady-of-the-lake.png'),--King Arthur | The Lady of the Lake
       (4, 47, 'Merlin', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/prophecy.png'),--King Arthur | Prophecy
       (4, 48, 'Merlin', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/restless-spirits.png'),--King Arthur | Restless Spirits
       (4, 49, 'Merlin', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/king-arthur/command-the-storms.png'),--King Arthur | Command the Storms
       (5, 50, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/ambush.png'),--Robin Hood | Ambush
       (5, 51, 'Robin', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/a-hunter-s-eye.png'),--Robin Hood | A Hunter''s Eye
       (5, 52, 'Robin', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/disarming-shot.png'),--Robin Hood | Disarming Shot
       (5, 53, 'Robin', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/piercing-shot.png'),--Robin Hood | Piercing Shot
       (5, 54, 'Outlaw', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/highway-robbery.png'),--Robin Hood | Highway Robbery
       (5, 55, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/snark.png'),--Robin Hood | Snark
       (5, 56, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/wily-fighting.png'),--Robin Hood | Wily Fighting
       (5, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/feint.png'),--Robin Hood | Feint
       (5, 8, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/regroup.png'),--Robin Hood | Regroup
       (5, 57, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/defenders-of-sherwood.png'),--Robin Hood | Defenders of Sherwood
       (5, 58, 'Robin', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/robin-hood/steal-from-the-rich.png'),--Robin Hood | Steal From the Rich
       (6, 59, 'Bigfoot', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/larger-than-life.png'),--Bigfoot | Larger Than Life
       (6, 60, 'Bigfoot', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/savagery.png'),--Bigfoot | Savagery
       (6, 61, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/disengage.png'),--Bigfoot | Disengage
       (6, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/skirmish.png'),--Bigfoot | Skirmish
       (6, 62, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/hoax.png'),--Bigfoot | Hoax
       (6, 24, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/momentous-shift.png'),--Bigfoot | Momentous Shift
       (6, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/feint.png'),--Bigfoot | Feint
       (6, 8, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/regroup.png'),--Bigfoot | Regroup
       (6, 63, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/it-s-just-your-imagination.png'),--Bigfoot | It''s Just Your Imagination
       (6, 64, 'Bigfoot', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/crash-through-the-trees.png'),--Bigfoot | Crash Through the Trees
       (6, 65, 'Jackalope', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bigfoot/jackalope-horns.png'),--Bigfoot | Jackalope Horns
       (7, 66, 'Any', 3, 1,
        'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-high-straight-lead.png'),--Bruce Lee | Jeet Kune Do: High Straight Lead
       (7, 67, 'Any', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-downward-side-kick.png'),--Bruce Lee | Jeet Kune Do: Downward Side Kick
       (7, 68, 'Any', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-wrist-lock.png'),--Bruce Lee | Jeet Kune Do: Wrist Lock
       (7, 69, 'Any', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-intercepting-fist.png'),--Bruce Lee | Jeet Kune Do: Intercepting Fist
       (7, 70, 'Any', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-corkscrew-finger-jab.png'),--Bruce Lee | Jeet Kune Do: Corkscrew Finger Jab
       (7, 71, 'Any', 3, 1,
        'https://static.unmatched.cards/images/umdb/decks/bruce-lee/jeet-kune-do-short-lead-hook.png'),--Bruce Lee | Jeet Kune Do: Short Lead Hook
       (7, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/skirmish.png'),--Bruce Lee | Skirmish
       (7, 72, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/little-dragon.png'),--Bruce Lee | Little Dragon
       (7, 24, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/momentous-shift.png'),--Bruce Lee | Momentous Shift
       (7, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/feint.png'),--Bruce Lee | Feint
       (7, 8, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/regroup.png'),--Bruce Lee | Regroup
       (7, 73, 'Any', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/taste-of-blood.png'),--Bruce Lee | Taste of Blood
       (7, 74, 'Any', 4, 4, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/be-like-water.png'),--Bruce Lee | Be Like Water
       (7, 75, 'Any', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/hoo-whaaaaaaa.png'),--Bruce Lee | "HOO! WHAAAAAA!"
       (7, 76, 'Any', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/bring-it-on.png'),--Bruce Lee | Bring It On
       (7, 77, 'Any', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/one-inch-punch.png'),--Bruce Lee | One-Inch Punch
       (7, 78, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bruce-lee/nunchaku.png'),--Bruce Lee | Nunchaku
       (8, 79, 'Muldoon', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/ingen/they-should-all-be-destroyed.png'),--InGen | They Should All Be Destroyed
       (8, 80, 'Muldoon', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/ingen/shoot-her.png'),--InGen | Shoot Her!
       (8, 81, 'Any', 1, 4, 'https://static.unmatched.cards/images/umdb/decks/ingen/rending-shot.png'),--InGen | Rending Shot
       (8, 82, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/ingen/second-shot-2.png'),--InGen | Second Shot
       (8, 23, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ingen/leap-away.png'),--InGen | Leap Away
       (8, 83, 'Ingen worker', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ingen/tactical-advance.png'),--InGen | Tactical Advance
       (8, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ingen/feint.png'),--InGen | Feint
       (8, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ingen/regroup.png'),--InGen | Regroup
       (8, 84, 'Muldoon', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/ingen/i-ve-hunted-most-things-that-can-hunt-you.png'),--InGen | I''ve Hunted Most Things That Can Hunt You
       (8, 85, 'Muldoon', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/ingen/call-for-backup.png'),--InGen | Call for Backup
       (8, 86, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ingen/remote-detonation.png'),--InGen | Remote Detonation
       (9, 61, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/raptors/disengage.png'),--Raptors | Disengage
       (9, 87, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/raptors/clever-girl.png'),--Raptors | Clever Girl
       (9, 88, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/raptors/pack-hunters.png'),--Raptors | Pack Hunters
       (9, 89, 'Any', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/raptors/they-remember.png'),--Raptors | They Remember
       (9, 90, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/raptors/eviscerate.png'),--Raptors | Eviscerate
       (9, 50, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/raptors/ambush.png'),--Raptors | Ambush
       (9, 91, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/raptors/eaten-alive.png'),--Raptors | Eaten Alive
       (9, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/raptors/feint.png'),--Raptors | Feint
       (9, 92, 'Any', 1, 4, 'https://static.unmatched.cards/images/umdb/decks/raptors/decoy.png'),--Raptors | Decoy
       (9, 93, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/raptors/coordinated-attack-pattern.png'),--Raptors | Coordinated Attack Pattern
       (9, 94, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/raptors/working-things-out.png'),--Raptors | Working Things Out
       (10, 95, 'Holmes', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/the-game-is-afoot.png'),--Sherlock Holmes | The Game is Afoot
       (10, 96, 'Dr. watson', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/service-revolver.png'),--Sherlock Holmes | Service Revolver
       (10, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/feint.png'),--Sherlock Holmes | Feint
       (10, 97, 'Any', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/education-never-ends.png'),--Sherlock Holmes | Education Never Ends
       (10, 98, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/study-methods.png'),--Sherlock Holmes | Study Methods
       (10, 99, 'Holmes', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/deduce-strategy.png'),--Sherlock Holmes | Deduce Strategy
       (10, 100, 'Holmes', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/counterpunch.png'),--Sherlock Holmes | Counterpunch
       (10, 101, 'Dr. watson', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/fixed-point-in-a-changing-age.png'),--Sherlock Holmes | Fixed Point in a Changing Age
       (10, 102, 'Holmes', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/elementary.png'),--Sherlock Holmes | Elementary
       (10, 103, 'Holmes', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/confirm-suspicion.png'),--Sherlock Holmes | Confirm Suspicion
       (10, 104, 'Holmes', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/eliminate-the-impossible.png'),--Sherlock Holmes | Eliminate the Impossible
       (10, 105, 'Holmes', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/master-of-disguise.png'),--Sherlock Holmes | Master of Disguise
       (10, 106, 'Dr. watson', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/sherlock-holmes/administer-aid.png'),--Sherlock Holmes | Administer Aid
       (11, 50, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/ambush.png'),--Dracula | Ambush
       (11, 107, 'Dracula', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/feeding-frenzy.png'),--Dracula | Feeding Frenzy
       (11, 108, 'Dracula', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/beastform.png'),--Dracula | Beastform
       (11, 109, 'Sister', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/dracula/thirst-for-sustenance.png'),--Dracula | Thirst for Sustenance
       (11, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/dracula/feint.png'),--Dracula | Feint
       (11, 3, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/dracula/dash.png'),--Dracula | Dash
       (11, 21, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/exploit.png'),--Dracula | Exploit
       (11, 110, 'Dracula', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/do-my-bidding.png'),--Dracula | Do My Bidding
       (11, 111, 'Dracula', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/look-into-my-eyes.png'),--Dracula | Look Into My Eyes
       (11, 112, 'Dracula', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/mistform.png'),--Dracula | Mistform
       (11, 113, 'Dracula', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/prey-upon.png'),--Dracula | Prey Upon
       (11, 114, 'Dracula', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/dracula/baptism-of-blood.png'),--Dracula | Baptism of Blood
       (11, 115, 'Sister', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/dracula/ravening-seduction.png'),--Dracula | Ravening Seduction
       (12, 116, 'Mr. hyde', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/recoiling-blow.png'),--Jekyll & Hyde | Recoiling Blow
       (12, 117, 'Mr. hyde', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/forever-hyde.png'),--Jekyll & Hyde | Forever Hyde
       (12, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/feint.png'),--Jekyll & Hyde | Feint
       (12, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/skirmish.png'),--Jekyll & Hyde | Skirmish
       (12, 118, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/duality-of-man.png'),--Jekyll & Hyde | Duality of Man
       (12, 119, 'Dr. jekyll', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/distracted-triage.png'),--Jekyll & Hyde | Distracted Triage
       (12, 120, 'Dr. jekyll', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/succumb-to-compulsion.png'),--Jekyll & Hyde | Succumb to Compulsion
       (12, 121, 'Mr. hyde', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/madness-relents.png'),--Jekyll & Hyde | Madness Relents
       (12, 122, 'Dr. jekyll', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/with-haste.png'),--Jekyll & Hyde | With Haste!
       (12, 123, 'Dr. jekyll', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/scientific-method.png'),--Jekyll & Hyde | Scientific Method
       (12, 124, 'Dr. jekyll', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/calming-research.png'),--Jekyll & Hyde | Calming Research
       (12, 125, 'Mr. hyde', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/pure-evil.png'),--Jekyll & Hyde | Pure Evil
       (12, 126, 'Mr. hyde', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/jekyll-hyde/strange-case.png'),--Jekyll & Hyde | Strange Case
       (13, 127, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/surprise-attack.png'),--Invisible Man | Surprise Attack
       (13, 128, 'Invisible man', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/invisible-man/slip-away.png'),--Invisible Man | Slip Away
       (13, 129, 'Invisible man', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/emerge-from-mist.png'),--Invisible Man | Emerge From Mist
       (13, 130, 'Invisible man', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/covert-preparation.png'),--Invisible Man | Covert Preparation
       (13, 131, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/dreaming-of-revenge.png'),--Invisible Man | Dreaming of Revenge
       (13, 132, 'Invisible man', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/invisible-man/confound.png'),--Invisible Man | Confound
       (13, 133, 'Invisible man', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/impossible-to-see.png'),--Invisible Man | Impossible to See
       (13, 134, 'Invisible man', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/invisible-man/lurking.png'),--Invisible Man | Lurking
       (13, 135, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/into-thin-air.png'),--Invisible Man | Into Thin Air
       (13, 136, 'Invisible man', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/coded-notes.png'),--Invisible Man | Coded Notes
       (13, 137, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/reign-of-terror.png'),--Invisible Man | Reign of Terror
       (13, 138, 'Invisible man', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/invisible-man/vanish.png'),--Invisible Man | Vanish
       (13, 139, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/step-lightly.png'),--Invisible Man | Step Lightly
       (13, 140, 'Invisible man', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/invisible-man/rolling-fog.png'),--Invisible Man | Rolling Fog
       (14, 141, 'Xander', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/military-knowledge.png'),--Buffy | Military Knowledge
       (14, 142, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/daring-strike.png'),--Buffy | Daring Strike
       (14, 143, 'Buffy', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/buffy/mr-pointy.png'),--Buffy | Mr. Pointy
       (14, 42, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/swift-strike.png'),--Buffy | Swift Strike
       (14, 31, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/skirmish.png'),--Buffy | Skirmish
       (14, 144, 'Xander', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/buffy/right-hand-man.png'),--Buffy | Right-hand Man
       (14, 145, 'Buffy', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/rapid-recovery.png'),--Buffy | Rapid Recovery
       (14, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/regroup.png'),--Buffy | Regroup
       (14, 146, 'Buffy', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/slayer-s-strength.png'),--Buffy | Slayer''s Strength
       (14, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/feint.png'),--Buffy | Feint
       (14, 147, 'Buffy', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/buffy/cartwheel-kick.png'),--Buffy | Cartwheel Kick
       (14, 148, 'Giles', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/buffy/insight.png'),--Buffy | Insight
       (14, 149, 'Giles', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/buffy/training.png'),--Buffy | Training
       (15, 150, 'Angel', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/wisdom-of-ages.png'),--Angel | Wisdom of Ages
       (15, 151, 'Faith', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/five-by-five.png'),--Angel | Five by Five
       (15, 152, 'Angel', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/cursed-with-a-soul.png'),--Angel | Cursed with a Soul
       (15, 153, 'Angel', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/angelus-scourge-of-europe.png'),--Angel | Angelus, Scourge of Europe
       (15, 61, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/disengage.png'),--Angel | Disengage
       (15, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/feint.png'),--Angel | Feint
       (15, 154, 'Angel', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/brooding.png'),--Angel | Brooding
       (15, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/regroup.png'),--Angel | Regroup
       (15, 24, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/momentous-shift.png'),--Angel | Momentous Shift
       (15, 155, 'Faith', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/the-rogue-slayer.png'),--Angel | The Rogue Slayer
       (15, 156, 'Angel', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/angel/haunted-by-the-faces.png'),--Angel | Haunted by the Faces
       (15, 157, 'Faith', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/angel/killer-of-the-dead.png'),--Angel | Killer of the Dead
       (16, 158, 'Spike', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/spike/the-rush.png'),--Spike | The Rush
       (16, 159, 'Spike', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/spike/arrogance.png'),--Spike | Arrogance
       (16, 23, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/spike/leap-away.png'),--Spike | Leap Away
       (16, 160, 'Drusilla', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/spike/empathy.png'),--Spike | Empathy
       (16, 161, 'Drusilla', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spike/always-surprising.png'),--Spike | Always Surprising
       (16, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spike/feint.png'),--Spike | Feint
       (16, 31, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/spike/skirmish.png'),--Spike | Skirmish
       (16, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/spike/regroup.png'),--Spike | Regroup
       (16, 162, 'Spike', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spike/bloody-hell.png'),--Spike | Bloody Hell!
       (16, 163, 'Spike', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/spike/let-s-dance.png'),--Spike | Let''s Dance
       (16, 164, 'Spike', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/spike/seek-the-shadows.png'),--Spike | Seek the Shadows
       (16, 165, 'Drusilla', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/spike/the-sight.png'),--Spike | The Sight
       (17, 81, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/rending-shot.png'),--Willow | Rending Shot
       (17, 166, 'Willow', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/willow/flayed-alive.png'),--Willow | Flayed Alive
       (17, 167, 'Willow', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/when-good-magic-fails.png'),--Willow | When Good Magic Fails
       (17, 42, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/swift-strike.png'),--Willow | Swift Strike
       (17, 168, 'Willow', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/willow/black-magic.png'),--Willow | Black Magic
       (17, 169, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/hacker.png'),--Willow | Hacker
       (17, 170, 'Tara', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/knowledge-of-the-craft.png'),--Willow | Knowledge of the Craft
       (17, 171, 'Tara', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/revoke.png'),--Willow | Revoke
       (17, 7, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/willow/feint.png'),--Willow | Feint
       (17, 8, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/willow/regroup.png'),--Willow | Regroup
       (17, 172, 'Willow', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/meditation.png'),--Willow | Meditation
       (17, 173, 'Willow', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/love-and-loss.png'),--Willow | Love and Loss
       (17, 174, 'Willow', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/willow/resurrect.png'),--Willow | Resurrect
       (18, 175, 'Beowulf', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/epic-poem.png'),--Beowulf | Epic Poem
       (18, 176, 'Beowulf', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/the-ancient-heirloom.png'),--Beowulf | The Ancient Heirloom
       (18, 177, 'Beowulf', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/no-contest-expecteth.png'),--Beowulf | No Contest Expecteth
       (18, 178, 'Wiglaf', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/hot-for-battle.png'),--Beowulf | Hot for the Battle
       (18, 179, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/fatal-struggle.png'),--Beowulf | Fatal Struggle
       (18, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/feint.png'),--Beowulf | Feint
       (18, 180, 'Beowulf', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/the-war-king.png'),--Beowulf | The War-King
       (18, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/skirmish.png'),--Beowulf | Skirmish
       (18, 181, 'Beowulf', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/the-equal-of-grendel.png'),--Beowulf | The Equal of Grendel
       (18, 182, 'Wiglaf', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/remnant-of-valor.png'),--Beowulf | Remnant of Valor
       (18, 183, 'Beowulf', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/beowulf/vigor-and-courage.png'),--Beowulf | Vigor and Courage
       (18, 184, 'Beowulf', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/beowulf/golden-drinking-horn.png'),--Beowulf | Golden Drinking Horn
       (19, 185, 'Little red', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/little-red/what-large-hands-you-have.png'),--Little Red Riding Hood | What Large Hands You Have 🐺
       (19, 186, 'Little red', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/little-red/what-big-ears-you-have.png'),--Little Red Riding Hood | What Big Ears You Have 🐺
       (19, 187, 'Huntsman', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/little-red/long-have-i-sought-you.png'),--Little Red Riding Hood | Long Have I Sought You ⚔️
       (19, 188, 'Little red', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/little-red/what-big-eyes-you-have.png'),--Little Red Riding Hood | What Big Eyes You Have 🐺
       (19, 189, 'Little red', 3, 4,
        'https://static.unmatched.cards/images/umdb/decks/little-red/what-s-that-in-my-basket.png'),--Little Red Riding Hood | What''s That In My Basket? 🌟
       (19, 190, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/little-red/stones-in-the-belly.png'),--Little Red Riding Hood | Stones in the Belly 🌹
       (19, 191, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/little-red/once-upon-a-time.png'),--Little Red Riding Hood | Once Upon a Time 🌹
       (19, 192, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/little-red/the-wolf-s-skin.png'),--Little Red Riding Hood | The Wolf''s Skin ⚔️
       (19, 193, 'Little red', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/little-red/what-a-terrible-big-mouth-you-have.png'),--Little Red Riding Hood | What a Terrible Big Mouth You Have ⚔️
       (19, 194, 'Little red', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/little-red/never-leave-the-path.png'),--Little Red Riding Hood | Never Leave the Path 🐺
       (19, 195, 'Little red', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/little-red/into-the-woods.png'),--Little Red Riding Hood | Into the Woods 🐺🌹⚔️
       (19, 196, 'Huntsman', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/little-red/a-grimm-tale.png'),--Little Red Riding Hood | A Grimm Tale 🌹
       (20, 197, 'Deadp♥️♥️l', 4, 1, 'null'),--Deadpool | 3 of Hearts
       (20, 198, 'Deadpool', 1, 1, 'null'),--Deadpool | Wanna bet?
       (20, 199, 'Deadp👁👁l', 1, 1, 'null'),--Deadpool | Rob''s Pouch & Shoe Emporium
       (20, 200, 'Deadp$$l', 3, 1, 'null'),--Deadpool | Cha-Ching!
       (20, 201, 'Cable''s only true friend', 2, 1, 'null'),--Deadpool | Klunkin'' Heads
       (20, 202, 'Deadpool', 1, 1, 'null'),--Deadpool | Deadpool™ Merc For Hire, LLC
       (20, 203, 'Deadpool', 4, 1, 'null'),--Deadpool | Exploding CardItem!
       (20, 1, 'Deadpool', 1, 1, 'null'),--Deadpool | Gaze of Stone
       (20, 204, 'Deadpool', 1, 1, 'null'),--Deadpool | Excuse me while I grow some limbs.
       (20, 205, 'Deadpool', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/deadpool/underrated-super-heroes.png'),--Deadpool | Underrated Super Heroes
       (20, 206, 'Professor deadpool', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/deadpool/xavier-institute-faculty.png'),--Deadpool | Xavier Institute Faculty
       (20, 207, 'Deadpool', 2, 1, 'null'),--Deadpool | Chimichanga Break!
       (20, 208, 'Deadpool', 1, 1, 'null'),--Deadpool | And For My Next Move...
       (20, 209, 'Deadpool', 1, 1, 'null'),--Deadpool | Gimme Gimme Chimichanga
       (20, 210, 'Deadpool', 4, 1, 'null'),--Deadpool | Non-Retinal Scan Access to Danger Room
       (20, 211, 'Deadpool', 3, 1, 'null'),--Deadpool | Time out time out time out!
       (20, 212, 'Dp', 6, 1, 'null'),--Deadpool | Push to Teleport
       (20, 213, 'Deadpool', 1, 1, 'null'),--Deadpool | I Always Get The Last Word
       (20, 7, 'Deadpool (icon)', 1, 1, 'https://static.unmatched.cards/images/umdb/decks/deadpool/feint.png'),--Deadpool | Feint
       (20, 214, 'Merc with a mouth', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/deadpool/super-feint.png'),--Deadpool | Super Feint
       (20, 215, 'Deadpool', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/deadpool/call-me.png'),--Deadpool | Call Me
       (20, 216, 'Deadpool', 1, 1,
        'https://static.unmatched.cards/images/umdb/decks/deadpool/i-m-not-wearing-pants.png'),--Deadpool | I''m Not Wearing Pants
       (20, 217, 'Deadpool (sticker)', 2, 1, 'null'),--Deadpool | Eat Me
       (20, 218, 'Deadpool (icon)', 1, 1, 'null'),--Deadpool | Passwords
       (20, 219, 'Pool', 1, 1, 'null'),--Deadpool | Transit CardItem
       (20, 220, 'Deadpool (stuck-out tongue drawing)', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/deadpool/they-have-an-amazing-buffet.png'),--Deadpool | They Have An Amazing Buffet
       (20, 221, 'Deadpool', 1, 1, 'null'),--Deadpool | Dumpster Divin'' Deadpool
       (20, 222, 'Deadpool', 2, 1, 'null'),--Deadpool | Holy Mackerel!
       (20, 223, 'Deadpool', 2, 1, 'null'),--Deadpool | Sweeet!
       (20, 224, 'Dr. deadpool', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/deadpool/faint.png'),--Deadpool | Faint
       (21, 225, 'Patroclus', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/achilles/battle-frenzy.png'),--Achilles | Battle Frenzy
       (21, 226, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/test-for-weakness.png'),--Achilles | Test For Weakness
       (21, 227, 'Patroclus', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/achilles/the-day-of-your-doom.png'),--Achilles | The Day of Your Doom
       (21, 228, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/brothers-in-arms.png'),--Achilles | Brothers In Arms
       (21, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/feint.png'),--Achilles | Feint
       (21, 229, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/achilles/battle-hardened.png'),--Achilles | Battle Hardened
       (21, 56, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/achilles/wily-fighting.png'),--Achilles | Wily Fighting
       (21, 230, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/achilles/blessed-by-hermes.png'),--Achilles | Blessed By Hermes
       (21, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/skirmish.png'),--Achilles | Skirmish
       (21, 231, 'Achilles', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/under-achilles-helm.png'),--Achilles | Under Achilles'' Helm
       (21, 232, 'Achilles', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/achilles/achilles-heel.png'),--Achilles | Achilles'' Heel
       (21, 233, 'Achilles', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/achilles/spear-throw.png'),--Achilles | Spear Throw
       (22, 234, 'Bloody mary', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/out-of-the-mirror.png'),--Bloody Mary | Out Of The Mirror
       (22, 235, 'Bloody mary', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/ghostly-touch.png'),--Bloody Mary | Ghostly Touch
       (22, 236, 'Bloody mary', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/speak-three-times.png'),--Bloody Mary | Speak Three Times
       (22, 237, 'Bloody mary', 4, 3,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/bloody-requiem.png'),--Bloody Mary | Bloody Requiem
       (22, 7, 'Bloody mary', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/feint.png'),--Bloody Mary | Feint
       (22, 238, 'Bloody mary', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/trick-of-the-light.png'),--Bloody Mary | Trick of the Light
       (22, 239, 'Bloody mary', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/broken-glass.png'),--Bloody Mary | Broken Glass
       (22, 240, 'Bloody mary', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/jump-scare.png'),--Bloody Mary | Jump Scare
       (22, 241, 'Bloody mary', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/infinity-mirror.png'),--Bloody Mary | Infinity Mirror
       (22, 242, 'Bloody mary', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/mirror-image.png'),--Bloody Mary | Mirror Image
       (22, 243, 'Bloody mary', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/bloody-mary/evade.png'),--Bloody Mary | Evade
       (22, 244, 'Bloody mary', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/stolen-memories.png'),--Bloody Mary | Stolen Memories
       (22, 245, 'Bloody mary', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/bloody-mary/closer-than-she-appears.png'),--Bloody Mary | Closer Than She Appears
       (23, 246, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/infinite-strikes.png'),--Sun Wukong | Infinite Strikes
       (23, 247, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/ruyi-jingo-bang.png'),--Sun Wukong | Ruyi Jingo Bang
       (23, 248, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/taunting-laughter.png'),--Sun Wukong | Taunting Laughter
       (23, 249, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/ox-form.png'),--Sun Wukong | Ox Form
       (23, 250, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/72-transformations.png'),--Sun Wukong | 72 Transformations
       (23, 251, 'Any', 3, 4, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/sly-monkey.png'),--Sun Wukong | Sly Monkey
       (23, 56, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/wily-fighting.png'),--Sun Wukong | Wily Fighting
       (23, 45, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/bewilderment.png'),--Sun Wukong | Bewilderment
       (23, 252, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/golden-chain-mail.png'),--Sun Wukong | Golden Chain Mail
       (23, 253, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/tortoise-form.png'),--Sun Wukong | Tortoise Form
       (23, 254, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/fiery-eyes-that-see.png'),--Sun Wukong | Fiery Eyes That See
       (23, 255, 'Any', 1, 1, 'https://static.unmatched.cards/images/umdb/decks/sun-wukong/phoenix-form.png'),--Sun Wukong | Phoenix Form
       (24, 256, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/surprise-volley.png'),--Yennenga | Surprise Volley
       (24, 257, 'Yennenga', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/rain-of-arrows.png'),--Yennenga | Rain of Arrows
       (24, 258, 'Archer', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/pin-the-prey.png'),--Yennenga | Pin the Prey
       (24, 259, 'Archer', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/divide-and-conquer.png'),--Yennenga | Divide and Conquer
       (24, 260, 'Yennenga', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/point-blank.png'),--Yennenga | Point Blank
       (24, 24, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/momentous-shift.png'),--Yennenga | Momentous Shift
       (24, 261, 'Yennenga', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/jaws-of-the-beast.png'),--Yennenga | Jaws of the Beast
       (24, 31, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/skirmish.png'),--Yennenga | Skirmish
       (24, 262, 'Yennenga', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/yennenga/stallion-charge.png'),--Yennenga | Stallion Charge
       (24, 263, 'Yennenga', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/shield-formation.png'),--Yennenga | Shield Formation
       (24, 264, 'Yennenga', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/one-with-the-land.png'),--Yennenga | One With The Land
       (24, 265, 'Yennenga', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/yennenga/master-of-the-hunt.png'),--Yennenga | Master of the Hunt
       (25, 266, 'Luke cage', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/sweet-christmas.png'),--Luke Cage | Sweet Christmas!
       (25, 20, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/commanding-impact.png'),--Luke Cage | Commanding Impact
       (25, 267, 'Luke cage', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/get-paid.png'),--Luke Cage | Get Paid
       (25, 268, 'Luke cage', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/hero-for-hire.png'),--Luke Cage | Hero For Hire
       (25, 269, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/still-standing.png'),--Luke Cage | Still Standing
       (25, 270, 'Misty knight', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/pushback.png'),--Luke Cage | Pushback
       (25, 271, 'Misty knight', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/luke-cage/daughter-of-the-dragon.png'),--Luke Cage | Daughter of the Dragon
       (25, 8, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/regroup.png'),--Luke Cage | Regroup
       (25, 272, 'Luke cage', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/luke-cage/skin-like-titanium.png'),--Luke Cage | Skin Like Titanium
       (25, 273, 'Luke cage', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/power-man.png'),--Luke Cage | Power Man
       (25, 274, 'Misty knight', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/got-my-back.png'),--Luke Cage | Got My Back?
       (25, 275, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/trash-talk.png'),--Luke Cage | Trash Talk
       (25, 276, 'Luke cage', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/luke-cage/wheres-my-money.png'),--Luke Cage | Where''s My Money?
       (26, 277, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/moon-knight/im-not-real.png'),--Moon Knight | I''m Not Real
       (26, 278, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/thats-why-i-always-win.png'),--Moon Knight | That''s Why I Always Win
       (26, 279, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/moon-knight/good-enough-for-us.png'),--Moon Knight | Good Enough For Us
       (26, 280, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/moon-knight/thats-the-part-i-like.png'),--Moon Knight | That''s The Part I Like
       (26, 281, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/moon-knight/fist-of-khonshu.png'),--Moon Knight | Fist of Khonshu
       (26, 282, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/let-your-insanity-guide-you.png'),--Moon Knight | Let Your Insanity Guide You
       (26, 283, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/past-and-present-intermingle.png'),--Moon Knight | Past and Present Intermingle
       (26, 284, 'Any', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/a-totally-sane-thing-to-do.png'),--Moon Knight | A Totally Sane Thing To Do
       (26, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/moon-knight/feint.png'),--Moon Knight | Feint
       (26, 285, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/were-all-in-this-together.png'),--Moon Knight | We''re All In This Together
       (26, 286, 'Any', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/madness-will-keep-you-alive.png'),--Moon Knight | Madness Will Keep You Alive
       (26, 287, 'Any', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/moon-knight/travelers-of-the-night.png'),--Moon Knight | Travelers of The Night
       (27, 288, 'Ghost rider', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/spirit-of-vengeance.png'),--Ghost Rider | Spirit Of Vengeance
       (27, 289, 'Ghost rider', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/i-brought-the-devil-with-me.png'),--Ghost Rider | I Brought The Devil With Me
       (27, 290, 'Ghost rider', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/blaze-of-glory.png'),--Ghost Rider | Blaze of Glory
       (27, 291, 'Ghost rider', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/i-finally-escaped-hell.png'),--Ghost Rider | I Finally Escaped Hell
       (27, 7, 'Ghost rider', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/ghost-rider/feint.png'),--Ghost Rider | Feint
       (27, 292, 'Ghost rider', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/control-the-demon.png'),--Ghost Rider | Control The Demon
       (27, 293, 'Ghost rider', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ghost-rider/penance-stare.png'),--Ghost Rider | Penance Stare
       (27, 294, 'Ghost rider', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/the-wicked-will-burn.png'),--Ghost Rider | The Wicked Will Burn
       (27, 295, 'Ghost rider', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/stoke-the-flames.png'),--Ghost Rider | Stoke The Flames
       (27, 296, 'Ghost rider', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/deal-with-the-devil.png'),--Ghost Rider | Deal With The Devil
       (27, 297, 'Ghost rider', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/hell-rides-with-me.png'),--Ghost Rider | Hell Rides With Me
       (27, 298, 'Ghost rider', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/ghost-rider/chains-of-hellfire.png'),--Ghost Rider | Chains of Hellfire
       (28, 299, 'Daredevil', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/daredevil/man-without-fear.png'),--Daredevil | Man Without Fear
       (28, 300, 'Daredevil', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/daredevil/devil-of-hells-kitchen.png'),--Daredevil | Devil of Hell''s Kitchen
       (28, 7, 'Daredevil', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/feint.png'),--Daredevil | Feint
       (28, 301, 'Daredevil', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/take-a-knee.png'),--Daredevil | Take A Knee
       (28, 302, 'Daredevil', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/grappling-hook.png'),--Daredevil | Grappling Hook
       (28, 303, 'Daredevil', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/son-of-a-boxer.png'),--Daredevil | Son Of A Boxer
       (28, 304, 'Daredevil', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/through-adversity.png'),--Daredevil | Through Adversity
       (28, 305, 'Daredevil', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/daredevil/breather.png'),--Daredevil | Breather
       (29, 306, 'Bullseye', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/bullseye/i-planned-to-be-here.png'),--Bullseye | I Planned To Be Here
       (29, 307, 'Bullseye', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/bullseye/i-never-miss.png'),--Bullseye | I Never Miss
       (29, 308, 'Bullseye', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bullseye/for-my-next-trick.png'),--Bullseye | For My Next Trick
       (29, 309, 'Bullseye', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/bullseye/worlds-greatest-assassin.png'),--Bullseye | World''s Greatest Assassin
       (29, 310, 'Bullseye', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bullseye/master-strategist.png'),--Bullseye | Master Strategist
       (29, 7, 'Bullseye', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/bullseye/feint.png'),--Bullseye | Feint
       (29, 311, 'Bullseye', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/bullseye/arrogant-but-effective.png'),--Bullseye | Arrogant But Effective
       (29, 312, 'Bullseye', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/bullseye/right-between-the-eyes.png'),--Bullseye | Right Between The Eyes
       (29, 313, 'Bullseye', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bullseye/ricochet.png'),--Bullseye | Ricochet
       (29, 314, 'Bullseye', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/bullseye/im-better-and-ill-prove-it.png'),--Bullseye | I''m Better And I''ll Prove It
       (29, 315, 'Bullseye', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/bullseye/tactical-retreat.png'),--Bullseye | Tactical Retreat
       (29, 316, 'Bullseye', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/bullseye/study-the-target.png'),--Bullseye | Study The Target
       (30, 317, 'Elektra', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/mystic-assassin.png'),--Elektra | Mystic Assassin
       (30, 318, 'The hand', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/the-fist.png'),--Elektra | The Fist
       (30, 319, 'Elektra', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/hands-of-red.png'),--Elektra | Hands of Red
       (30, 320, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/ninjitsu.png'),--Elektra | Ninjitsu
       (30, 321, 'Elektra', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/whirlwind.png'),--Elektra | Whirlwind
       (30, 322, 'Elektra', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/cloaked-in-shadow.png'),--Elektra | Cloaked In Shadow
       (30, 323, 'Elektra', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/sai.png'),--Elektra | Sai
       (30, 324, 'Elektra', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/intercept.png'),--Elektra | Intercept
       (30, 325, 'Elektra', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/snakeroot-clan.png'),--Elektra | Snakeroot Clan
       (30, 326, 'Elektra', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/elektra/mesmerize.png'),--Elektra | Mesmerize
       (31, 327, 'Dr. sattler', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/you-never-had-control-thats-the-illusion.png'),--Dr. Ellie Sattler | You Never Had Control, That''s the Illusion
       (31, 328, 'Dr. sattler', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/woman-inherits-the-earth.png'),--Dr. Ellie Sattler | Woman Inherits the Earth
       (31, 329, 'Dr. sattler', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/violently-if-necessary.png'),--Dr. Ellie Sattler | Violently, If Necessary
       (31, 330, 'Dr. sattler', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/sexism-in-survival-situations.png'),--Dr. Ellie Sattler | Sexism in Survival Situations
       (31, 331, 'Dr. malcolm', 3, 1,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/chaotician.png'),--Dr. Ellie Sattler | Chaotician
       (31, 332, 'Dr. malcolm', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/life-finds-a-way.png'),--Dr. Ellie Sattler | Life Finds a Way
       (31, 333, 'Any', 2, 1, 'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/must-go-faster.png'),--Dr. Ellie Sattler | Must Go Faster
       (31, 334, 'Dr. sattler', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/i-think-were-back-in-business.png'),--Dr. Ellie Sattler | I Think We''re Back In Business
       (31, 335, 'Any', 3, 1, 'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/hey-hey-hey.png'),--Dr. Ellie Sattler | Hey! Hey! Hey!
       (31, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/feint.png'),--Dr. Ellie Sattler | Feint
       (31, 8, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/regroup.png'),--Dr. Ellie Sattler | Regroup
       (31, 336, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/lock-the-doors.png'),--Dr. Ellie Sattler | Lock The Doors!
       (31, 337, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/the-concept-of-attraction.png'),--Dr. Ellie Sattler | The Concept of Attraction
       (31, 338, 'Dr. malcolm', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/dr-ellie-sattler/the-future-ex-mrs-malcolm.png'),--Dr. Ellie Sattler | The Future Ex-Mrs. Malcolm
       (32, 339, 'T-rex', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/reckless-lunge.png'),--T. Rex | Reckless Lunge
       (32, 340, 'T-rex', 3, 4,
        'https://static.unmatched.cards/images/umdb/decks/t-rex/when-dinosaurs-ruled-the-earth.png'),--T. Rex | When Dinosaurs Ruled the Earth
       (32, 341, 'T-rex', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/t-rex/15000-pounds-of-muscle.png'),--T. Rex | 15,000 Pounds of Muscle
       (32, 20, 'T-rex', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/commanding-impact.png'),--T. Rex | Commanding Impact
       (32, 342, 'T-rex', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/thrash.png'),--T. Rex | Thrash
       (32, 343, 'T-rex', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/t-rex/terrifying-roar.png'),--T. Rex | Terrifying Roar
       (32, 24, 'T-rex', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/momentous-shift.png'),--T. Rex | Momentous Shift
       (32, 344, 'T-rex', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/t-rex/youre-just-making-her-angry.png'),--T. Rex | You''re Just Making Her Angry
       (32, 245, 'T-rex', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/closer-than-she-appears.png'),--T. Rex | Closer Than She Appears
       (32, 345, 'T-rex', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/t-rex/65-million-years-of-gut-instinct.png'),--T. Rex | 65 Million Years of Gut Instinct
       (32, 346, 'T-rex', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/t-rex/ripples-in-the-water.png'),--T. Rex | Ripples in the Water
       (33, 347, 'Houdini', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/the-big-reveal.png'),--Harry Houdini | The Big Reveal
       (33, 348, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/sleight-of-hand.png'),--Harry Houdini | Sleight of Hand
       (33, 349, 'Any', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/houdini/flourish.png'),--Harry Houdini | Flourish
       (33, 350, 'Houdini', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/houdini/an-illusion-of-my-own-design.png'),--Harry Houdini | An Illusion of My Own Design
       (33, 308, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/for-my-next-trick.png'),--Harry Houdini | For My Next Trick
       (33, 351, 'Houdini', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/houdini/vanishing-act.png'),--Harry Houdini | Vanishing Act
       (33, 352, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/smoke-and-mirrors.png'),--Harry Houdini | Smoke and Mirrors
       (33, 353, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/houdini/misdirection.png'),--Harry Houdini | Misdirection
       (33, 354, 'Bess', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/and-the-beautiful-bess.png'),--Harry Houdini | And the Beautiful Bess!
       (33, 355, 'Houdini', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/houdini/grand-escape.png'),--Harry Houdini | Grand Escape
       (33, 356, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/all-part-of-the-show.png'),--Harry Houdini | All Part of the Show
       (33, 357, 'Bess', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/houdini/set-the-stage.png'),--Harry Houdini | Set the Stage
       (33, 358, 'Houdini', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/houdini/a-magician-never-reveals-his-secrets.png'),--Harry Houdini | A Magician Never Reveals His Secrets
       (34, 359, 'The genie', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/genie/your-wish-is-my-command.png'),--The Genie | Your Wish is My Command
       (34, 360, 'The genie', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/genie/imprisoned-wrath.png'),--The Genie | Imprisoned Wrath
       (34, 361, 'The genie', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/genie/i-am-freed.png'),--The Genie | I Am Freed
       (34, 362, 'The genie', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/genie/careful-what-you-wish-for.png'),--The Genie | Careful What You Wish For
       (34, 363, 'The genie', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/genie/wishing-for-more-wishes.png'),--The Genie | Wishing For More Wishes
       (34, 364, 'The genie', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/genie/this-is-no-parlor-trick.png'),--The Genie | This is No Parlor Trick
       (34, 365, 'The genie', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/genie/ive-made-sultans-out-of-less.png'),--The Genie | I''ve Made Sultans Out of Less
       (34, 366, 'The genie', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/genie/i-grant-you-death.png'),--The Genie | I Grant You Death
       (34, 7, 'The genie', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/genie/feint.png'),--The Genie | Feint
       (34, 367, 'The genie', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/genie/prisoners-torment.png'),--The Genie | Prisoner''s Torment
       (34, 368, 'The genie', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/genie/back-in-the-lamp.png'),--The Genie | Back In The Lamp
       (34, 369, 'The genie', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/genie/three-wishes.png'),--The Genie | Three Wishes
       (35, 370, 'Ms. marvel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/big-wind-up.png'),--Ms. Marvel | Big Wind Up
       (35, 371, 'Ms. marvel', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/ms-marvel/im-not-touching-you.png'),--Ms. Marvel | I''m Not Touching You
       (35, 372, 'Ms. marvel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/fangirl.png'),--Ms. Marvel | Fangirl
       (35, 373, 'Ms. marvel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/easy-peasy.png'),--Ms. Marvel | Easy Peasy
       (35, 374, 'Ms. marvel', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/embiggen.png'),--Ms. Marvel | Embiggen
       (35, 375, 'Ms. marvel', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ms-marvel/shrink-shrink-shrink.png'),--Ms. Marvel | Shrink! Shrink! Shrink!
       (35, 7, 'Ms. marvel', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/feint.png'),--Ms. Marvel | Feint
       (35, 24, 'Ms. marvel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/momentous-shift.png'),--Ms. Marvel | Momentous Shift
       (35, 376, 'Ms. marvel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/slingshot.png'),--Ms. Marvel | Slingshot
       (35, 377, 'Ms. marvel', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/ms-marvel/friends-and-family.png'),--Ms. Marvel | Friends and Family
       (35, 378, 'Ms. marvel', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ms-marvel/gyro-and-fries.png'),--Ms. Marvel | Gyro and Fries
       (36, 379, 'Squirrel', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/bite-of-steel.png'),--Squirrel Girl | Bite of Steel
       (36, 380, 'Squirrel girl', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/fuzzball-special.png'),--Squirrel Girl | Fuzzball Special
       (36, 381, 'Squirrel girl', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/kick-butts.png'),--Squirrel Girl | Kick Butts
       (36, 382, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/call-of-the-mild.png'),--Squirrel Girl | Call of the Mild
       (36, 383, 'Squirrel girl', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/get-em-tippy-toe.png'),--Squirrel Girl | Get ''Em Tippy-Toe!
       (36, 384, 'Squirrel girl', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/unbeatable-squirrel-girl.png'),--Squirrel Girl | Unbeatable Squirrel Girl
       (36, 385, 'Squirrel girl', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/squirmish.png'),--Squirrel Girl | Squirmish
       (36, 7, 'Squirrel girl', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/feint.png'),--Squirrel Girl | Feint
       (36, 3, 'Squirrel girl', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/dash.png'),--Squirrel Girl | Dash
       (36, 386, 'Squirrel girl', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/squirgility.png'),--Squirrel Girl | Squirgility
       (36, 387, 'Squirrel girl', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/eat-nuts.png'),--Squirrel Girl | Eat Nuts
       (36, 388, 'Squirrel girl', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/horde-of-squirrels.png'),--Squirrel Girl | Horde of Squirrels
       (36, 389, 'Squirrel girl', 2, 1,
        'https://static.unmatched.cards/images/umdb/decks/squirrel-girl/nutwork-of-spies.png'),--Squirrel Girl | Nutwork of Spies
       (37, 390, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/channel-the-dark.png'),--Cloak and Dagger | Channel the Dark
       (37, 391, 'Cloak', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/darkforce-dimension.png'),--Cloak and Dagger | Darkforce Dimension
       (37, 392, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/into-the-void.png'),--Cloak and Dagger | Into the Void
       (37, 393, 'Dagger', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/lightforce-barrage.png'),--Cloak and Dagger | Lightforce Barrage
       (37, 20, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/commanding-impact.png'),--Cloak and Dagger | Commanding Impact
       (37, 394, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/into-darkness.png'),--Cloak and Dagger | Into Darkness
       (37, 395, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/perfect-balance.png'),--Cloak and Dagger | Perfect Balance
       (37, 396, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/the-living-light.png'),--Cloak and Dagger | The Living Light
       (37, 397, 'Any', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/traverse-the-darkforce.png'),--Cloak and Dagger | Traverse the Darkforce
       (37, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/feint.png'),--Cloak and Dagger | Feint
       (37, 398, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/living-shadow.png'),--Cloak and Dagger | Living Shadow
       (37, 399, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/cloak-and-dagger/chosen-fate.png'),--Cloak and Dagger | Chosen Fate
       (38, 400, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/black-widow/fake-out.png'),--Black Widow | Fake Out
       (38, 401, 'Black widow', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/black-widow/widows-sting.png'),--Black Widow | Widow''s Sting
       (38, 402, 'Black widow', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/black-widow/widows-bite.png'),--Black Widow | Widow''s Bite
       (38, 403, 'Maria hill', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/acting-director-of-shield.png'),--Black Widow | Acting Director of S.H.I.E.L.D.
       (38, 404, 'Black widow', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/caught-in-a-web.png'),--Black Widow | Caught in a Web
       (38, 7, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/black-widow/feint.png'),--Black Widow | Feint
       (38, 405, 'Black widow', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/black-widow/widows-kiss.png'),--Black Widow | Widow''s Kiss
       (38, 406, 'Black widow', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/black-widow/widows-line.png'),--Black Widow | Widow''s Line
       (38, 407, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/black-widow/double-identity.png'),--Black Widow | Double Identity
       (38, 408, 'Maria hill', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/life-model-decoy.png'),--Black Widow | Life Model Decoy
       (38, 409, 'Black widow', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/the-budapest-gambit.png'),--Black Widow | The Budapest Gambit
       (38, 410, 'Black widow', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/the-firenze-agenda.png'),--Black Widow | The Firenze Agenda
       (38, 411, 'Black widow', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/the-kinshasa-directive.png'),--Black Widow | The Kinshasa Directive
       (38, 412, 'Black widow', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/the-madripoor-sanction.png'),--Black Widow | The Madripoor Sanction
       (38, 413, 'Black widow', 4, 1,
        'https://static.unmatched.cards/images/umdb/decks/black-widow/the-moscow-protocol.png'),--Black Widow | The Moscow Protocol
       (39, 414, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/black-panther/analyze-and-adjust.png'),--Black Panther | Analyze and Adjust
       (39, 415, 'Black panther', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/vibranium-shockwave.png'),--Black Panther | Vibranium Shockwave
       (39, 416, 'Black panther', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/ancestral-insight.png'),--Black Panther | Ancestral Insight
       (39, 417, 'Black panther', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/anti-metal-claws.png'),--Black Panther | Anti-Metal Claws
       (39, 418, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/black-panther/cat-like-reflexes.png'),--Black Panther | Cat-Like Reflexes
       (39, 7, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/black-panther/feint.png'),--Black Panther | Feint
       (39, 419, 'Shuri', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/nanotriage-processor.png'),--Black Panther | Nanotriage Processor
       (39, 8, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/black-panther/regroup.png'),--Black Panther | Regroup
       (39, 420, 'Black panther', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/wakanda-forever.png'),--Black Panther | Wakanda Forever!
       (39, 243, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/black-panther/evade.png'),--Black Panther | Evade
       (39, 421, 'Black panther', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/microweave-mesh.png'),--Black Panther | Microweave Mesh
       (39, 422, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/black-panther/stalking-panther.png'),--Black Panther | Stalking Panther
       (39, 423, 'Shuri', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/black-panther/tactical-remote-scanning.png'),--Black Panther | Tactical Remote Scanning
       (40, 424, 'Winter soldier', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/bionic-arm.png'),--Winter Soldier | Bionic Arm
       (40, 425, 'Winter soldier', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/marksman.png'),--Winter Soldier | Marksman
       (40, 426, 'Winter soldier', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/programmed-to-kill.png'),--Winter Soldier | Programmed to Kill
       (40, 427, 'Winter soldier', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/without-remorse.png'),--Winter Soldier | Without Remorse
       (40, 7, 'Winter soldier', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/winter-soldier/feint.png'),--Winter Soldier | Feint
       (40, 428, 'Winter soldier', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/reflex-memories.png'),--Winter Soldier | Reflex Memories
       (40, 429, 'Winter soldier', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/reprogram.png'),--Winter Soldier | Reprogram
       (40, 56, 'Winter soldier', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/wily-fighting.png'),--Winter Soldier | Wily Fighting
       (40, 430, 'Winter soldier', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/born-in-the-barracks.png'),--Winter Soldier | Born in the Barracks
       (40, 431, 'Winter soldier', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/complete-the-mission.png'),--Winter Soldier | Complete the Mission
       (40, 432, 'Winter soldier', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/a-boy-named-bucky.png'),--Winter Soldier | A Boy Named Bucky
       (40, 433, 'Winter soldier', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/winter-soldier/manipulation.png'),--Winter Soldier | Manipulation
       (41, 52, 'Spider-man', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/spider-man/disarming-shot.png'),--Spider-Man | Disarming Shot
       (41, 434, 'Spider-man', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spider-man/swinging-kick.png'),--Spider-Man | Swinging Kick
       (41, 435, 'Spider-man', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/spider-man/thwip.png'),--Spider-Man | Thwip!
       (41, 24, 'Spider-man', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spider-man/momentous-shift.png'),--Spider-Man | Momentous Shift
       (41, 436, 'Spider-man', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/spider-man/right-in-the-face.png'),--Spider-Man | Right in the Face!
       (41, 437, 'Spider-man', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/spider-man/spider-sense-tingling.png'),--Spider-Man | Spider-Sense Tingling!
       (41, 438, 'Spider-man', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/spider-man/wall-crawler.png'),--Spider-Man | Wall Crawler
       (41, 55, 'Spider-man', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/spider-man/snark.png'),--Spider-Man | Snark
       (41, 439, 'Spider-man', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/spider-man/counter-attack.png'),--Spider-Man | Counter-Attack
       (41, 440, 'Spider-man', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/spider-man/web-shooters.png'),--Spider-Man | Web Shooters
       (41, 441, 'Spider-man', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/spider-man/friendly-neighborhood-spider-man.png'),--Spider-Man | Friendly Neighborhood Spider-Man
       (41, 442, 'Spider-man', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/spider-man/with-great-power.png'),--Spider-Man | With Great Power
       (42, 443, 'She-hulk', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/the-savage-she-hulk.png'),--She-Hulk | The Savage She-Hulk
       (42, 444, 'She-hulk', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/sensational.png'),--She-Hulk | Sensational
       (42, 445, 'She-hulk', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/omega-level-threat.png'),--She-Hulk | Omega-Level Threat
       (42, 446, 'She-hulk', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/cease-and-desist.png'),--She-Hulk | Cease and Desist
       (42, 447, 'She-hulk', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/legalese.png'),--She-Hulk | Legalese
       (42, 448, 'She-hulk', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/she-hulk/nerve-cluster-strike.png'),--She-Hulk | Nerve Cluster Strike
       (42, 449, 'She-hulk', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/green-energy.png'),--She-Hulk | Green Energy
       (42, 450, 'She-hulk', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/lady-justice.png'),--She-Hulk | Lady Justice
       (42, 451, 'She-hulk', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/the-defense-rests.png'),--She-Hulk | The Defense Rests
       (42, 452, 'She-hulk', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/double-jeopardy.png'),--She-Hulk | Double Jeopardy
       (42, 453, 'She-hulk', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/she-hulk/jennifer-walters-esq.png'),--She-Hulk | Jennifer Walters, Esq.
       (42, 454, 'She-hulk', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/she-hulk/leap-toward.png'),--She-Hulk | Leap Toward
       (43, 455, 'Any', 3, 4, 'https://static.unmatched.cards/images/umdb/decks/doctor-strange/bolts-of-balthakk.png'),--Doctor Strange | Bolts of Balthakk
       (43, 456, 'Any', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/the-rings-of-raggadorr.png'),--Doctor Strange | The Rings of Raggadorr
       (43, 457, 'Doctor strange', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/the-winds-of-watoomb.png'),--Doctor Strange | The Winds of Watoomb
       (43, 458, 'Doctor strange', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/cloak-of-levitation.png'),--Doctor Strange | Cloak of Levitation
       (43, 459, 'Wong', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/steadfast-disciple.png'),--Doctor Strange | Steadfast Disciple
       (43, 460, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/master-of-kamar-taj.png'),--Doctor Strange | Master of Kamar-Taj
       (43, 461, 'Doctor strange', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/seven-suns-of-cinnibus.png'),--Doctor Strange | Seven Suns of Cinnibus
       (43, 7, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/doctor-strange/feint.png'),--Doctor Strange | Feint
       (43, 462, 'Doctor strange', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/the-mists-of-munnopor.png'),--Doctor Strange | The Mists of Munnopor
       (43, 463, 'Doctor strange', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/eye-of-agamotto.png'),--Doctor Strange | Eye of Agamotto
       (43, 464, 'Doctor strange', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/doctor-strange/no-really-im-a-doctor.png'),--Doctor Strange | No Really, I''m a Doctor
       (44, 465, 'Tesla', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/7-hertz.png'),--Nikola Tesla | 7 Hertz
       (44, 466, 'Tesla', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/the-alternating-current.png'),--Nikola Tesla | The Alternating Current
       (44, 467, 'Tesla', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/death-ray.png'),--Nikola Tesla | Death Ray
       (44, 468, 'Tesla', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/kinetic-induction.png'),--Nikola Tesla | Kinetic Induction
       (44, 469, 'Tesla', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/lightning-storm.png'),--Nikola Tesla | Lightning Storm
       (44, 470, 'Tesla', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/polyphase-coils.png'),--Nikola Tesla | Polyphase Coils
       (44, 471, 'Tesla', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/repulsion-blast.png'),--Nikola Tesla | Repulsion Blast
       (44, 472, 'Tesla', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/x-ray-radiation.png'),--Nikola Tesla | X-Ray Radiation
       (44, 473, 'Tesla', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/intense-experimentation.png'),--Nikola Tesla | Intense Experimentation
       (44, 474, 'Tesla', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/fully-charged.png'),--Nikola Tesla | Fully Charged
       (44, 475, 'Tesla', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/nikola-tesla/remote-control.png'),--Nikola Tesla | Remote Control
       (45, 476, 'Jill trent', 4, 3,
        'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/battle-of-wits.png'),--Dr. Jill Trent | Battle of Wits
       (45, 477, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/energizing-spray.png'),--Dr. Jill Trent | Energizing Spray
       (45, 478, 'Jill trent', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/utility-belt.png'),--Dr. Jill Trent | Utility Belt
       (45, 479, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/stasis-diffuser.png'),--Dr. Jill Trent | Stasis Diffuser
       (45, 480, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/gyroscopic-jetpack.png'),--Dr. Jill Trent | Gyroscopic Jetpack
       (45, 481, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/laser-pen.png'),--Dr. Jill Trent | Laser Pen
       (45, 482, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/insightful-deduction.png'),--Dr. Jill Trent | Insightful Deduction
       (45, 483, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/caught-red-handed.png'),--Dr. Jill Trent | Caught Red-Handed
       (45, 484, 'Daisy', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/sisters-in-arms.png'),--Dr. Jill Trent | Sisters in Arms
       (45, 485, 'Daisy', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/ace-fighter.png'),--Dr. Jill Trent | Ace Fighter
       (45, 486, 'Jill trent', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/hypnotist.png'),--Dr. Jill Trent | Hypnotist
       (45, 487, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/indestructible-cloth.png'),--Dr. Jill Trent | Indestructible Cloth
       (45, 488, 'Daisy', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/dr-jill-trent/helpful-assistant.png'),--Dr. Jill Trent | Helpful Assistant
       (46, 489, 'Golden bat', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/a-punch-to-shake-the-earth.png'),--Golden Bat | A Punch to Shake the Earth
       (46, 490, 'Golden bat', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/golden-bat/super-strength.png'),--Golden Bat | Super Strength
       (46, 491, 'Golden bat', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/vaporizing-eyebeams.png'),--Golden Bat | Vaporizing Eyebeams
       (46, 492, 'Golden bat', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/insight-of-the-ancients.png'),--Golden Bat | Insight of the Ancients
       (46, 493, 'Golden bat', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/like-a-flash-of-golden-light.png'),--Golden Bat | Like a Flash of Golden Light
       (46, 494, 'Golden bat', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/sight-beyond-sight.png'),--Golden Bat | Sight Beyond Sight
       (46, 31, 'Golden bat', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/golden-bat/skirmish.png'),--Golden Bat | Skirmish
       (46, 343, 'Golden bat', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/golden-bat/terrifying-roar.png'),--Golden Bat | Terrifying Roar
       (46, 495, 'Golden bat', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/he-laughs-at-your-feebleness.png'),--Golden Bat | He Laughs at Your Feebleness
       (46, 496, 'Golden bat', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/imposing-presence.png'),--Golden Bat | Imposing Presence
       (46, 497, 'Golden bat', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/golden-bat/alpine-fortress.png'),--Golden Bat | Alpine Fortress
       (46, 498, 'Golden bat', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/golden-bat/arrive-just-in-time.png'),--Golden Bat | Arrive Just in Time
       (47, 499, 'Annie', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/lagniappe.png'),--Annie Christmas | Lagniappe
       (47, 500, 'Charlie', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/annie-christmas/bottom-dealing.png'),--Annie Christmas | Bottom Dealing
       (47, 501, 'Annie', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/annie-christmas/keep-your-hands-to-yourself.png'),--Annie Christmas | Keep Your Hands to Yourself
       (47, 502, 'Annie', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/striking-beauty.png'),--Annie Christmas | Striking Beauty
       (47, 503, 'Any', 1, 4, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/better-together.png'),--Annie Christmas | Better Together
       (47, 504, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/long-shot.png'),--Annie Christmas | Long Shot
       (47, 505, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/quite-a-pair.png'),--Annie Christmas | Quite a Pair
       (47, 506, 'Charlie', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/annie-christmas/the-turn-and-the-river.png'),--Annie Christmas | The Turn and the River
       (47, 507, 'Annie', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/annie-christmas/mississippi-queen.png'),--Annie Christmas | Mississippi Queen
       (47, 508, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/slick-talker.png'),--Annie Christmas | Slick Talker
       (47, 509, 'Annie', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/annie-christmas/a-few-more-pearls.png'),--Annie Christmas | A Few More Pearls
       (47, 510, 'Annie', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/annie-christmas/captains-orders.png'),--Annie Christmas | Captain''s Orders
       (48, 511, 'Tomoe gozen', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/fearsome-strength.png'),--Tomoe Gozen | Fearsome Strength
       (48, 512, 'Tomoe gozen', 4, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/witness-my-last-battle.png'),--Tomoe Gozen | Witness My Last Battle
       (48, 513, 'Tomoe gozen', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/five-against-thousands.png'),--Tomoe Gozen | Five Against Thousands
       (48, 514, 'Tomoe gozen', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/a-warriors-way.png'),--Tomoe Gozen | A Warrior''s Way
       (48, 53, 'Tomoe gozen', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/piercing-shot.png'),--Tomoe Gozen | Piercing Shot
       (48, 515, 'Tomoe gozen', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/confront-any-demon-or-god.png'),--Tomoe Gozen | Confront Any Demon or God
       (48, 516, 'Tomoe gozen', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/a-worthy-opponent.png'),--Tomoe Gozen | A Worthy Opponent
       (48, 517, 'Tomoe gozen', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/flash-of-steel.png'),--Tomoe Gozen | Flash of Steel
       (48, 31, 'Tomoe gozen', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/skirmish.png'),--Tomoe Gozen | Skirmish
       (48, 518, 'Tomoe gozen', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/refuse-to-retreat.png'),--Tomoe Gozen | Refuse to Retreat
       (48, 519, 'Tomoe gozen', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/deeds-of-valor.png'),--Tomoe Gozen | Deeds of Valor
       (48, 520, 'Tomoe gozen', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/tomoe-gozen/lord-kisos-final-stand.png'),--Tomoe Gozen | Lord Kiso''s Final Stand
       (49, 521, 'Oda nobunaga', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/student-of-war.png'),--Oda Nobunaga | Student of War
       (49, 522, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/fire-and-flames.png'),--Oda Nobunaga | Fire and Flames
       (49, 523, 'Honor guard', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/lightning-and-thunder.png'),--Oda Nobunaga | Lightning and Thunder
       (49, 524, 'Honor guard', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/sun-and-moon.png'),--Oda Nobunaga | Sun and Moon
       (49, 525, 'Any', 2, 4, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/battle-maneuvers.png'),--Oda Nobunaga | Battle Maneuvers
       (49, 24, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/momentous-shift.png'),--Oda Nobunaga | Momentous Shift
       (49, 526, 'Any', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/patience-and-strategy.png'),--Oda Nobunaga | Patience and Strategy
       (49, 527, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/spring-the-trap.png'),--Oda Nobunaga | Spring the Trap
       (49, 528, 'Oda nobunaga', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/pragmatism.png'),--Oda Nobunaga | Pragmatism
       (49, 529, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/reinforce.png'),--Oda Nobunaga | Reinforce
       (49, 530, 'Oda nobunaga', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/oda-nobunaga/demon-king-of-the-sixth-heaven.png'),--Oda Nobunaga | Demon King of the Sixth Heaven
       (50, 531, 'Hamlet', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/cruel-to-be-kind.png'),--Hamlet | Cruel To Be Kind
       (50, 532, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/hamlet/uncertain-doom.png'),--Hamlet | Uncertain Doom
       (50, 533, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/hamlet/to-sleep-perchance-to-dream.png'),--Hamlet | To Sleep, Perchance To Dream
       (50, 534, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/the-readiness-is-all.png'),--Hamlet | The Readiness Is All
       (50, 535, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/hamlet/the-plays-the-thing.png'),--Hamlet | The Play''s The Thing
       (50, 536, 'Hamlet', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/hamlet/blood-will-have-blood.png'),--Hamlet | Blood Will Have Blood
       (50, 537, 'Hamlet', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/outrageous-fortune.png'),--Hamlet | Outrageous Fortune
       (50, 538, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/maddening-insight.png'),--Hamlet | Maddening Insight
       (50, 539, 'Hamlet', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/the-rest-is-silence.png'),--Hamlet | The Rest Is Silence
       (50, 540, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/hamlet/nothing-either-good-or-bad.png'),--Hamlet | Nothing Either Good Or Bad
       (50, 541, 'Hamlet', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/hamlet/method-in-the-madness.png'),--Hamlet | Method In The Madness
       (50, 542, 'Hamlet', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/hamlet/the-ghost.png'),--Hamlet | The Ghost
       (51, 543, 'Titania', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/titania/queen-of-the-fairies.png'),--Titania | Queen Of The Fairies
       (51, 544, 'Oberon', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/titania/met-by-moonlight.png'),--Titania | Met By Moonlight
       (51, 545, 'Titania', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/titania/as-wise-as-beautiful.png'),--Titania | As Wise As Beautiful
       (51, 546, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/titania/whisked-away.png'),--Titania | Whisked Away
       (51, 547, 'Titania', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/titania/the-moon-looks-down.png'),--Titania | The Moon Looks Down
       (51, 548, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/titania/fairy-song.png'),--Titania | Fairy Song
       (51, 549, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/titania/parting-gift.png'),--Titania | Parting Gift
       (51, 550, 'Titania', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/titania/but-a-dream.png'),--Titania | But A Dream
       (51, 551, 'Any', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/titania/protection-of-the-fairy-woods.png'),--Titania | Protection Of The Fairy Woods
       (51, 10, 'Titania', 4, 2, 'https://static.unmatched.cards/images/umdb/decks/titania/a-momentary-glance.png'),--Titania | A Momentary Glance
       (51, 552, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/titania/gift-of-the-fair-folk.png'),--Titania | Gift Of The Fair Folk
       (51, 553, 'Oberon', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/titania/what-fools-these-mortals-be.png'),--Titania | What Fools These Mortals Be
       (52, 554, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/double-double.png'),--The Wayward Sisters | Double, Double 🦎
       (52, 555, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/all-seeing-familiar.png'),--The Wayward Sisters | All-Seeing Familiar 🦎
       (52, 556, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/hurly-burly.png'),--The Wayward Sisters | Hurly-Burly 🐍
       (52, 557, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/fire-burn-and-cauldron-bubble.png'),--The Wayward Sisters | Fire Burn And Cauldron Bubble 🦇
       (52, 558, 'Any', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/the-stars-align.png'),--The Wayward Sisters | The Stars Align 🦎
       (52, 559, 'Any', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/curious-familiar.png'),--The Wayward Sisters | Curious Familiar 🦇
       (52, 560, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/ward.png'),--The Wayward Sisters | Ward 🦇
       (52, 561, 'Any', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/toil-and-trouble.png'),--The Wayward Sisters | Toil And Trouble 🐍
       (52, 562, 'Any', 1, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/pricking-of-my-thumbs.png'),--The Wayward Sisters | Pricking Of My Thumbs 🐍
       (52, 563, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/unnatural-remedy.png'),--The Wayward Sisters | Unnatural Remedy 🐍
       (52, 564, 'Any', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/something-wicked-this-way-comes.png'),--The Wayward Sisters | Something Wicked This Way Comes 🦇
       (52, 565, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/the-wayward-sisters/sisters-prophecy.png'),--The Wayward Sisters | Prophecy 🦎
       (53, 566, 'Shakespeare', 3, 5,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/horror.png'),--William Shakespeare | Horror 2️⃣
       (53, 567, 'Shakespeare', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/my-kingdom-for-a-horse.png'),--William Shakespeare | My Kingdom For A Horse 6️⃣
       (53, 568, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/all-are-punished.png'),--William Shakespeare | All Are Punished 4️⃣
       (53, 569, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/places-places.png'),--William Shakespeare | Places, Places! 4️⃣
       (53, 570, 'Shakespeare', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/once-more-unto-the-breach.png'),--William Shakespeare | Once More Unto The Breach 6️⃣
       (53, 571, 'Shakespeare', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/alas.png'),--William Shakespeare | Alas 2️⃣
       (53, 572, 'Shakespeare', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/the-ides-of-march.png'),--William Shakespeare | The Ides Of March 4️⃣
       (53, 573, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/et-tu-brute.png'),--William Shakespeare | Et Tu, Brute? 4️⃣
       (53, 574, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/deceive.png'),--William Shakespeare | Deceive 2️⃣
       (53, 575, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/revise.png'),--William Shakespeare | Revise 2️⃣
       (53, 576, 'Actor', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/such-sweet-sorrow.png'),--William Shakespeare | Such Sweet Sorrow 4️⃣
       (53, 577, 'Actor', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/william-shakespeare/again.png'),--William Shakespeare | Again 2️⃣
       (54, 578, 'Eredin', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/brutal-strike.png'),--Eredin | Brutal Strike
       (54, 579, 'Eredin', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/backhand.png'),--Eredin | Backhand
       (54, 580, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/eredin/foul-purpose.png'),--Eredin | Foul Purpose
       (54, 581, 'Red rider', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/unyielding-hordes.png'),--Eredin | Unyielding Hordes
       (54, 582, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/wild-hunt.png'),--Eredin | Wild Hunt
       (54, 31, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/skirmish.png'),--Eredin | Skirmish
       (54, 583, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/icy-guile.png'),--Eredin | Icy Guile
       (54, 584, 'Eredin', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/eredin/portal-defense.png'),--Eredin | Portal Defense
       (54, 585, 'Eredin', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/implacable.png'),--Eredin | Implacable
       (54, 586, 'Eredin', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/eredin/might-of-the-aen-elle.png'),--Eredin | Might Of The Aen Elle
       (54, 587, 'Any', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/eredin/close-for-the-kill.png'),--Eredin | Close For The Kill
       (55, 588, 'Philippa', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/chain-lightning.png'),--Philippa | Chain Lightning
       (55, 589, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/regicide.png'),--Philippa | Regicide
       (55, 590, 'Philippa', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/philippa/lightning-bolt.png'),--Philippa | Lightning Bolt
       (55, 591, 'Philippa', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/philippa/owlform.png'),--Philippa | Owlform
       (55, 592, 'Any', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/cunning.png'),--Philippa | Cunning
       (55, 593, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/philippa/redanian-plot.png'),--Philippa | Redanian Plot
       (55, 594, 'Philippa', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/philippa/spellbreaker.png'),--Philippa | Spellbreaker
       (55, 595, 'Philippa', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/paralyzing-fetters.png'),--Philippa | Paralyzing Fetters
       (55, 110, 'Any', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/do-my-bidding.png'),--Philippa | Do My Bidding
       (55, 596, 'Philippa', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/blinding-dust.png'),--Philippa | Blinding Dust
       (55, 597, 'Philippa', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/backup-plan.png'),--Philippa | Backup Plan
       (55, 598, 'Dijkstra', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/spymasters-ruse.png'),--Philippa | Spymaster''s Ruse
       (55, 599, 'Philippa', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/philippa/polymorphy.png'),--Philippa | Polymorphy
       (56, 600, 'Yennefer', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/incinerate.png'),--Yennefer & Triss | Incinerate
       (56, 601, 'Triss', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/merigolds-hailstorm.png'),--Yennefer & Triss | Merigold''s Hailstorm
       (56, 602, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/portal-to-anywhere.png'),--Yennefer & Triss | Portal To Anywhere
       (56, 603, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/echoing-blast.png'),--Yennefer & Triss | Echoing Blast
       (56, 604, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/ball-lightning.png'),--Yennefer & Triss | Ball Lightning
       (56, 605, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/telepathy.png'),--Yennefer & Triss | Telepathy
       (56, 606, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/quick-and-ready.png'),--Yennefer & Triss | Quick And Ready
       (56, 607, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/magical-barrier.png'),--Yennefer & Triss | Magical Barrier
       (56, 595, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/paralyzing-fetters.png'),--Yennefer & Triss | Paralyzing Fetters
       (56, 608, 'Any', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/advisor-to-the-king.png'),--Yennefer & Triss | Advisor To The King
       (56, 609, 'Any', 2, 2,
        'https://static.unmatched.cards/images/umdb/decks/yennefer-triss/lodge-of-sorceresses.png'),--Yennefer & Triss | Lodge Of Sorceresses
       (57, 610, 'Ciri', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/lion-cub-of-cintra.png'),--Ciri | Lion Cub Of Cintra 🔵
       (57, 611, 'Ciri', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/channel-the-source.png'),--Ciri | Channel The Source
       (57, 612, 'Ihuarraquax', 4, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/bane-of-the-aen-elle.png'),--Ciri | Bane Of The Aen Elle
       (57, 613, 'Ciri', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/pushed-to-the-brink.png'),--Ciri | Pushed To The Brink 🔵
       (57, 614, 'Ciri', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ciri/the-lady-of-space-and-time.png'),--Ciri | The Lady Of Space And Time 🔵
       (57, 615, 'Ciri', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/zireael.png'),--Ciri | Zireael 🔵
       (57, 616, 'Ciri', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/blink.png'),--Ciri | Blink
       (57, 617, 'Ihuarraquax', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/searching-strike.png'),--Ciri | Searching Strike
       (57, 618, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ciri/parry.png'),--Ciri | Parry
       (57, 619, 'Ciri', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ciri/child-of-the-elder-blood.png'),--Ciri | Child Of The Elder Blood 🔵
       (57, 620, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ciri/unicorn-ally.png'),--Ciri | Unicorn Ally
       (58, 621, 'Leshen', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/primeval-slam.png'),--Ancient Leshen | Primeval Slam
       (58, 622, 'Leshen', 1, 2, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/flock-of-birds.png'),--Ancient Leshen | Flock Of Birds
       (58, 623, 'Wolf', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/disturbing-howls.png'),--Ancient Leshen | Disturbing Howls
       (58, 624, 'Any', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/nature-abounds.png'),--Ancient Leshen | Nature Abounds
       (58, 625, 'Any', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/command-the-forest.png'),--Ancient Leshen | Command The Forest
       (58, 56, 'Any', 1, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/wily-fighting.png'),--Ancient Leshen | Wily Fighting
       (58, 626, 'Any', 3, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/planted-feet.png'),--Ancient Leshen | Planted Feet
       (58, 627, 'Wolf', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/harrying-strike.png'),--Ancient Leshen | Harrying Strike
       (58, 628, 'Leshen', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/primeval-guardian.png'),--Ancient Leshen | Primeval Guardian
       (58, 629, 'Leshen', 1, 3,
        'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/strength-of-the-pack.png'),--Ancient Leshen | Strength Of The Pack
       (58, 630, 'Leshen', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/ancient-leshen/vanish-into-murder.png'),--Ancient Leshen | Vanish Into Murder
       (59, 631, 'Geralt', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/igni.png'),--Geralt of Rivia | Igni
       (59, 632, 'Geralt', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-sword-of-steel.png'),--Geralt of Rivia | GEAR: Sword of Steel
       (59, 633, 'Geralt', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-sword-of-silver.png'),--Geralt of Rivia | Gear: Sword of Silver
       (59, 634, 'Geralt', 2, 2, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/riposte.png'),--Geralt of Rivia | Riposte
       (59, 635, 'Geralt', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/yrden.png'),--Geralt of Rivia | Yrden
       (59, 636, 'Geralt', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/rend.png'),--Geralt of Rivia | Rend
       (59, 637, 'Geralt', 2, 3,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/disciplined-duelist.png'),--Geralt of Rivia | Disciplined Duelist
       (59, 638, 'Geralt', 4, 3,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/damn-youre-ugly.png'),--Geralt of Rivia | Damn, You''re Ugly
       (59, 639, 'Dandelion', 3, 3,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/annoying-tune.png'),--Geralt of Rivia | Annoying Tune
       (59, 640, 'Dandelion', 2, 3, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/plot-twist.png'),--Geralt of Rivia | Plot Twist
       (59, 641, 'Geralt', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-wolf-medallion.png'),--Geralt of Rivia | GEAR: Wolf Medallion
       (59, 642, 'Geralt', 3, 2,
        'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-armor-of-the-forgotten-wolf.png'),--Geralt of Rivia | GEAR: Armor Of The Forgotten Wolf
       (59, 643, 'Geralt', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/witcher-senses.png'),--Geralt of Rivia | Witcher Senses
       (59, 644, 'Geralt', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-blizzard.png'),--Geralt of Rivia | GEAR: Blizzard
       (59, 645, 'Geralt', 3, 2, 'https://static.unmatched.cards/images/umdb/decks/geralt-of-rivia/gear-tawny-owl.png');--Geralt of Rivia | GEAR: Tawny Owl