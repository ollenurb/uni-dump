import { REFRESH_LIST } from '../actions/grouplist'

const initialState = {
    refresh: 1,
}

const groupList = (state = initialState, action) => {
    switch (action.type) {
        case REFRESH_LIST:
            return {
                refresh: state.refresh + 1,
            }
        default:
            return state
    }
}

export default groupList
