export interface Sidekick {
    "name": string,
    count: number,
    hp: number,
    move: number,
    attackType: AttackType;
}

export interface CharacterDto {
    name: string;
    hp: number;
    move: number;
    attackType: AttackType
    sidekick: Sidekick | null;
}

export enum AttackType {
    MELEE  = 'MELEE',
    RANGED = 'RANGED',
}