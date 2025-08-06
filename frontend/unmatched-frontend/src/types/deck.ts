export interface SidekickDto {
    name: string,
    quantity: number,
    hp: number,
    move: number,
    attackType: AttackType;
    imageUrl: string;
}

export enum AttackType {
    MELEE = 'MELEE',
    RANGED = 'RANGED',
}

export interface DeckRatingDto {
    rating: number;
    name: string;
    win_count: number;
}

export interface DeckDto {
    name: string;
    frontImageUrl: string;
    backImageUrl: string;
    notes: string;
    hero: HeroDto;
    sidekick: SidekickDto;
    cards: CardDto[];
    ruleCards: RuleCardDto[];
    extraCharacters: ExtraCharacterDto[];
}

export interface HeroDto {
    name: string;
    specialAbility: string;
    quantity: number;
    hp: number;
    move: number;
    attackType: AttackType;
    imageUrl: string;
}

export interface CardDto {
    title: string;
    type: CardType;
    characterName: string;
    value: number;
    boost: number;
    quantity: number;
    basicText: string;
    immediateText: string;
    duringText: string;
    afterText: string;
    imageUrl: string;
}

export enum CardType {
    ATTACK = 'ATTACK',
    ATTACK_DEFENSE = 'ATTACK_DEFENSE',
    DEFENSE = 'DEFENSE',
    SCHEME = 'SCHEME'
}

export interface RuleCardDto {
    title: string;
    text: string;
    imageUrl: string;
}

export interface ExtraCharacterDto {
    name: string;
    specialAbility: string;
    quantity: number;
    hp: number;
    move: number;
    attackType: AttackType;
    imageUrl: string;
}