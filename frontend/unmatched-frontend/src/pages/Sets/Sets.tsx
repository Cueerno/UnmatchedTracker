import React from 'react';
import {ContentPage} from "../../components/ContentPage/ContentPage";
import {SetDto} from "../../types/set";
import {getAll} from "../../api/set";
import {Link} from "react-router-dom";
import "./Sets.css"
import {FaChessBoard, FaUser} from "react-icons/fa";

function SetCardRenderer({set}: { set: SetDto }) {
    const [imgError, setImgError] = React.useState(false);

    function getYear(releaseDate: string) {
        const year = new Date(releaseDate).getFullYear();
        if (year > new Date().getFullYear()) {
            return 'Unknown';
        }
        return new Date(set.releaseDate).toLocaleDateString('en-EN', {
            month: 'long',
            year: 'numeric',
        });
    }

    return (
        <article aria-label={set.name}>
            <Link to={`/sets/${encodeURIComponent(set.name)}`} className="card-item-link" title={set.name}>

                <div className="card-item-art" aria-hidden>
                    {set.imageUrl && !imgError ? (
                        <img
                            src={set.imageUrl}
                            alt={set.name}
                            onError={() => setImgError(true)}
                        />
                    ) : (
                        <div className="card-item-art-fallback">Deadpool will return image soon</div>
                    )}
                </div>

                <div className="card-item-footer">
                    <div className="card-item-header">
                        <div className="card-item-title">
                            {set.name}
                        </div>
                    </div>

                    <div className="card-item-stats">
                        <div className="release-date">
                            {getYear(set.releaseDate)}
                        </div>

                        <div className="decks-and-boards">
                            <FaUser/>{set.decks.length}

                            {set.boards.length > 0 && (
                                <>
                                    <FaChessBoard />{set.boards.length}
                                </>
                            )}
                        </div>
                    </div>
                </div>
            </Link>
        </article>
    )
}

export default function Sets() {

    const sortOptions = [
        {label: '— none —', value: ''},
        {label: 'Set name', value: 'name'},
        {label: 'Decks', value: 'decks.length'},
        {label: 'Boards', value: 'boards.length'},
        {label: 'Release date', value: 'releaseDate'},
    ];

    return (
        <ContentPage<SetDto>
            title="Sets"
            fetchFn={getAll}
            sortOptions={sortOptions.filter(o => o.value)}
            keyExtractor={set => set.name}
            renderCard={set => <SetCardRenderer set={set}/>}
            searchFields={['name']}
        />
    );
}
