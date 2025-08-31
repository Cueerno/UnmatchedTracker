import React, {useEffect, useState} from "react";
import {getByTitle} from "../../api/card";
import {useParams} from "react-router-dom";
import {CardDto} from "../../types/card";

export default function Card() {
    const {title} = useParams<{ title: string }>();
    const [card, setCard] = useState<CardDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!title) return;
        setLoading(true);
        getByTitle(title)
            .then((data) => setCard(data))
            .catch((e) => setError(e?.message ?? "Loading error"))
            .finally(() => setLoading(false));
    }, [title]);

    return (
        <div>
            <p>{card?.title}</p>
            <p>{card?.type}</p>
            <p>{card?.value}</p>
        </div>
    );
}
