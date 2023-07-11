import { Provider } from 'react-redux'

// Application router
import AppRouter from './router'

// Redux store
import store from './store'
import { setupInterceptors } from './api/util'

import './theme.scss'

// Components
import Header from './components/header'
import Notifies from './components/notifies'

// Main component
const App = () => (
    <Provider store={store}>
        <Header />
        <AppRouter />
        <Notifies />
    </Provider>
)

setupInterceptors(store)

export default App
