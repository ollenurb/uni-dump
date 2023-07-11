import { save, clear } from '../tokenService'

// Actions
export const LOGIN = 0x301
export const LOGOUT = 0x302

// Functional actions
export const doLogin = (secret) => {
    save(secret)
    console.log('Login request: ', secret)
    return {
        type: LOGIN,
        value: secret,
    }
}

export const doLogout = () => {
    clear()
    console.log('Logut request')
    return {
        type: LOGOUT,
    }
}
