import React, {useState} from 'react'
import {useNavigate} from 'react-router-dom'
import {createUser} from '../../api/user'

export function CreateUser() {
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
            navigate('/')
        } catch (err) {
            setError(err instanceof Error ? err.message : 'Unknown error')
        } finally {
            setLoading(false)
        }
    }

    return (
        <div style={{maxWidth: 400, margin: '40px auto'}}>
            <h1>Create User</h1>

            <form onSubmit={handleSubmit}>
                <label style={{display: 'block', marginBottom: 12}}>
                    Username
                    <input
                        type="text"
                        value={username}
                        onChange={e => setUsername(e.target.value)}
                        required
                        style={{
                            width: '100%',
                            padding: 8,
                            marginTop: 4,
                            boxSizing: 'border-box',
                        }}
                    />
                </label>

                {error && (
                    <p style={{color: 'red', marginBottom: 12}}>
                        {error}
                    </p>
                )}

                <button
                    type="submit"
                    disabled={loading}
                    style={{
                        padding: '10px 16px',
                        backgroundColor: '#007bff',
                        color: '#fff',
                        border: 'none',
                        borderRadius: 4,
                        cursor: loading ? 'not-allowed' : 'pointer',
                    }}
                >
                    {loading ? 'Creating...' : 'Create'}
                </button>
            </form>
        </div>
    )
}
