import React, {useState} from 'react'
import {useNavigate} from 'react-router-dom'
import {createUser} from '../../api/user'
import './CreateUser.css'

export default function CreateUser() {
    const [username, setUsername] = useState('')
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState<string | null>(null)
    const navigate = useNavigate()

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)
        setError(null)

        try {
            await createUser({username})
            navigate('/parties')
        } catch (err) {
            setError(err instanceof Error ? err.message : 'Unknown error')
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="create-container">
            <h1 className="create-title">Create User</h1>

            <form className="create-form" onSubmit={handleSubmit}>
                <label className="form-label">
                    Username
                    <input
                        className="form-input"
                        type="text"
                        value={username}
                        onChange={e => setUsername(e.target.value)}
                        required
                        placeholder="Enter username"
                    />
                </label>

                {error && <p className="form-error">{error}</p>}

                <button
                    className="form-button"
                    type="submit"
                    disabled={loading}
                >
                    {loading ? 'Creating...' : 'Create'}
                </button>
            </form>
        </div>
    )
}
