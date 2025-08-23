import React from 'react';
import {ReactComponent as Zona} from "../../assets/zona.svg";
import {ReactComponent as Space} from "../../assets/space.svg";
import {BoardDto} from "../../types/board";
import {ContentPage} from "../../components/ContentPage/ContentPage";
import {getAll} from "../../api/board";
import "./Boards.css"
import {FaUsers} from "react-icons/fa";

function BoardCardRenderer({board}: { board: BoardDto }) {
    const [imgError, setImgError] = React.useState(false);

    return (
        <article aria-label={board.name}>
            <div className="board-art" aria-hidden>
                {board.imageUrl && !imgError ? (
                    <img
                        src={board.imageUrl}
                        alt={board.name}
                        onError={() => setImgError(true)}
                    />
                ) : (
                    <div className="card-art-fallback">Deadpool will return image soon</div>
                )}
            </div>

            <div className="card-footer">
                <div className="card-header">
                    <div className="card-title">
                        {board.name}
                    </div>
                </div>

                <div className="card-stats">
                    <div className="max-players">
                        <FaUsers/>{board.maxPlayers}
                    </div>

                    <div className="spaces">
                        <Space/>{board.spaces}
                    </div>

                    <div className="zones">
                        <Zona/>{board.zones}
                    </div>
                </div>
            </div>
        </article>
    );
}

export default function Boards() {
    const sortOptions = [
        {label: '— none —', value: ''},
        {label: 'Board name', value: 'name'},
        {label: 'Max Players', value: 'maxPlayers'},
        {label: 'Spaces', value: 'spaces'},
        {label: 'Zones', value: 'zones'},
        {label: 'Feature', value: 'feature'},
    ];

    return (
        <ContentPage<BoardDto>
            title={"Boards"}
            fetchFn={getAll}
            sortOptions={sortOptions.filter(o => o.value)}
            keyExtractor={board => board.name}
            renderCard={board => <BoardCardRenderer board={board}/>}
        />
    );
}

