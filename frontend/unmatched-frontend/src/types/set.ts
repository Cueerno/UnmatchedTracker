import {DeckDto} from "./deck";
import {BoardDto} from "./board";

export interface SetDto {
    name: string;
    decks: DeckDto[];
    description: string;
    boards: BoardDto[];
    releaseDate: string;
}