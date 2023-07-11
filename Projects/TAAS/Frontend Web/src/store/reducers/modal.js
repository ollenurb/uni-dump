import { HIDE_MODAL, SHOW_MODAL } from '../actions/modal'

const initialState = {
    show: false,
}

const modal = (state = initialState, action) => {
    switch (action.type) {
        case SHOW_MODAL:
            return { show: true }
        case HIDE_MODAL:
            return { show: false }
        default:
            return state
    }
}

export default modal
