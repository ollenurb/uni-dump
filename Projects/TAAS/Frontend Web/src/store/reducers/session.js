// Actions
import { LOGIN, LOGOUT } from '../actions/session'

// Initial state
const initState = {
    secret: null,
}

// Reducer
const session = (state = initState, action) => {
    switch (action.type) {
        case LOGIN:
            return { secret: action.value }
        case LOGOUT:
            return initState
        default:
            return state
    }
}

export default session
