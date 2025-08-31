import {CardDto} from "./card";

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
    cards: DeckCardDto[];
    ruleCards: RuleCardDto[];
    extraCharacters: ExtraCharacterDto[];
}

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
    UNKNOWN = 'UNKNOWN'
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

export interface DeckCardDto {
    card: CardDto;
    boost: number;
    quantity: number;
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
