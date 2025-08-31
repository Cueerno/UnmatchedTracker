export interface CardDto {
    title: string;
    type: CardType;
    characterName: string;
    value: number;
    effect: string;
}

export enum CardType {
    ATTACK = 'ATTACK',
    VERSATILE = 'VERSATILE',
    DEFENSE = 'DEFENSE',
    SCHEME = 'SCHEME'
}