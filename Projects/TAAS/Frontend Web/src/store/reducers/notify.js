// Actions
import { SHOW_INFO, SHOW_SUCCESS, SHOW_WARN, SHOW_ERROR } from '../actions/notify'

// Initial state
const initState = []

// Reducer
const notify = (state = initState, { type, message }) => {
    switch (type) {
        case SHOW_INFO:
            return [...state, { message, type: 'primary' }]
        case SHOW_SUCCESS:
            return [...state, { message, type: 'success' }]
        case SHOW_WARN:
            return [...state, { message, type: 'warning' }]
        case SHOW_ERROR:
            return [...state, { message, type: 'danger' }]
        default:
            return state
    }
}

export default notify
