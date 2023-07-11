import { createStore } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'
import { retrieve } from './tokenService'

// Reducers
import reducers from './reducers'

// Get the persisted state (Access/Refresh tokens)
const persistedState = retrieve()

// Store
const store = createStore(reducers, persistedState, composeWithDevTools())

export default store
