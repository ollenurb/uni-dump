import { Link } from 'preact-router/match'
import { useSelector } from 'react-redux'

// SASS style
import style from './style.scss'

// Component
const Header = () => {
    const isLoggedIn = useSelector((state) => state.session.secret != null)

    return (
        <nav className="navbar navbar-dark navbar-expand-lg bg-primary py-0">
            <div className="container-fluid" style="max-width: 1280px">
                <Link
                    className={`navbar-brand ${style.textTitle}`}
                    href={isLoggedIn ? '/' : '/login'}
                >
                    StudyBuddy
                </Link>

                <div className="flex-grow-1 d-flex align-items-center justify-content-center text-white">
                    <span className={style.textMotto}>"Everybody needs somebody to study"</span>
                </div>
                <ul className="navbar-nav">
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            activeClassName="active"
                            href={isLoggedIn ? '/' : '/login'}
                        >
                            {isLoggedIn ? 'Home' : 'Login'}
                        </Link>
                    </li>
                </ul>
            </div>
        </nav>
    )
}

export default Header
