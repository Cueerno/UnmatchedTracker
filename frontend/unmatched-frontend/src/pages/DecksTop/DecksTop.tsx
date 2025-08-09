import React, {useState} from 'react'
import {useSearchParams} from 'react-router-dom'
import {DeckTopTable} from '../../components/DeckTopTable/DeckTopTable'
import './DecksTop.css'

interface FormatOption {
    label: string
    value?: string
}

const FORMATS: FormatOption[] = [
    {label: 'All', value: undefined},
    {label: '1v1', value: 'HEADS_UP'},
    {label: '2v2', value: 'TEAMS'},
    {label: 'Free-for-all', value: 'FREE_FOR_ALL'},
]

export function DecksTop() {
    const [searchParams, setSearchParams] = useSearchParams()
    const initialFormat = searchParams.get('format') ?? undefined

    const [selectedFormat, setSelectedFormat] = useState<string | undefined>(initialFormat)
    const [appliedFormat, setAppliedFormat] = useState<string | undefined>(initialFormat)

    const applyFormat = () => {
        const newParams = new URLSearchParams(searchParams)

        if (selectedFormat) {
            newParams.set('format', selectedFormat)
        } else {
            newParams.delete('format')
        }

        setSearchParams(newParams)
        setAppliedFormat(selectedFormat)
    }

    return (
        <div className="decks-top-container">
            <h1>Decks Ranking by Wins</h1>

            <div className="format-tabs">
                {FORMATS.map((f) => (
                    <button
                        key={f.label}
                        className={selectedFormat === f.value ? 'active' : ''}
                        onClick={() => setSelectedFormat(f.value)}
                    >
                        {f.label}
                    </button>
                ))}
            </div>

            <button className="apply-button" onClick={applyFormat}>
                Apply
            </button>

            <DeckTopTable key={appliedFormat ?? 'all'} format={appliedFormat}/>
        </div>
    )
}

