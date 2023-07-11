import { SERVER_URL } from '../constants'
import axios from 'axios'

// Axios client that automatically refresh the session when the
// server sends a 401 response
export default axios.create({
    baseURL: SERVER_URL,
    timeout: 2000,
    headers: {
        'Content-Type': 'application/json',
    },
})
