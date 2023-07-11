import { combineReducers } from 'redux'

// Reducers
import session from './session'
import modal from './modal'
import groupList from './grouplist'
import notify from './notify'

// --- Reducer ---
export default combineReducers({ session, notify, modal, groupList })
