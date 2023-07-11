import Router, { route } from 'preact-router'
import store from './store'

// Router pages
import Home from './routes/home'
import LogIn from './routes/login'
import Profile from './routes/profile'
import GroupPage from './routes/groupage'

const handleRoute = async ({ url }) => {
    const { session } = store.getState()
    const isLoggedOff = session.secret == null

    if (url != '/login') {
        if (isLoggedOff) {
            route('/login', true)
        }
    }
}

const AppRouter = () => (
    <Router onChange={handleRoute}>
        <Home path="/" />
        <LogIn path="/login" />
        <Profile path="/profile" />
        <GroupPage path="/group/:id" />
    </Router>
)

export default AppRouter
