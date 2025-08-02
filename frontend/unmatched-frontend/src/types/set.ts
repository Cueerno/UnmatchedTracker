import {CharacterDto} from "./character";
import {BoardDto} from "./board";

export interface SetDto {
    name: string;
    characters: CharacterDto[];
    description: string;
    boards: BoardDto[];
    releaseDate: string;
}