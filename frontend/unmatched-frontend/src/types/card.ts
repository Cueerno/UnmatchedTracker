export enum CardType {
    ATTACK = 'ATTACK',
    VERSATILE = 'VERSATILE',
    DEFENSE = 'DEFENSE',
    SCHEME = 'SCHEME'
}

export interface CardDto {
    title: string;
    type: CardType;
    value: number;
    effect: string;
}

export interface CardWithDecksDto {
    title: string;
    type: CardType;
    value: number;
    effect: string;
    decks: CardDeckDto[];
}

export interface CardDeckDto {
    deckName: string;
    characterName: string;
    boost: number;
    quantity: number;
    imageUrl: string;
}