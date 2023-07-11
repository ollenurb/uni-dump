import { SECRET_STORE_KEY } from '../constants'

// Save into local storage, overwriting the existing value associated with the key
export const save = (value) => {
    try {
        localStorage.setItem(SECRET_STORE_KEY, JSON.stringify(value))
        return true
    } catch (e) {
        console.warn(`Storage: cannot store ${SECRET_STORE_KEY} (${e})`)
        return false
    }
}

// Retrieve from local storage
export const retrieve = () => {
    const value = localStorage.getItem(SECRET_STORE_KEY)
    return value ? JSON.parse(value) : {}
}

// Unset from local storage
export const clear = () => localStorage.removeItem(SECRET_STORE_KEY)
