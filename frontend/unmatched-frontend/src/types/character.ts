export interface SidekickDto {
    "name": string,
    count: number,
    hp: number,
    move: number,
    attackType: AttackType;
}

export interface CharacterDto {
    name: string;
    count: number;
    hp: number;
    move: number;
    attackType: AttackType
    sidekick: SidekickDto | null;
}

export enum AttackType {
    MELEE  = 'MELEE',
    RANGED = 'RANGED',
}

export interface CharacterTopItem {
    rating: number;
    name: string;
    win_count: number;
}