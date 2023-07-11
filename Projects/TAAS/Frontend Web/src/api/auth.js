import { SERVER_URL } from '../constants'
import axios from 'axios'

export default axios.create({
    baseURL: SERVER_URL,
    timeout: 2000,
    headers: { 'Content-Type': 'application/json' },
})
