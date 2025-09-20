import {CardDto} from "./card";

export enum AttackType {
    MELEE = 'MELEE',
    RANGED = 'RANGED',
    UNKNOWN = 'UNKNOWN'
}

export interface DeckDto {
    setName: string;
    name: string;
    notes: string;
    quote: string;
    artImageUrl: string;
    frontImageUrl: string;
    backImageUrl: string;
    hero: HeroDto;
    sidekick: SidekickDto;
    ruleCards: RuleCardDto[];
    extraCharacters: ExtraCharacterDto[];
}

export interface DeckWithCardsDto {
    setName: string;
    name: string;
    notes: string;
    quote: string;
    artImageUrl: string;
    frontImageUrl: string;
    backImageUrl: string;
    hero: HeroDto;
    sidekick: SidekickDto;
    ruleCards: RuleCardDto[];
    extraCharacters: ExtraCharacterDto[];
    cards: DeckCardDto[];
}

export interface DeckCardDto {
    deckName: string;
    characterName: string;
    boost: number;
    quantity: number;
    imageUrl: string;
    card: CardDto;
}

export interface SidekickDto {
    name: string,
    quantity: number,
    hp: number,
    move: number,
    attackType: AttackType;
    imageUrl: string;
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

export interface DeckRatingDto {
    name: string;
    winCount: number;
    totalCount: number;
    winRatePercent: number;
}
