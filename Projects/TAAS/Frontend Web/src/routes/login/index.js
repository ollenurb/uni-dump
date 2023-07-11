import { useState, useEffect } from 'preact/hooks'
import { route } from 'preact-router'
import { useDispatch } from 'react-redux'

import axios from '../../api/auth'
import { useAxiosFunction } from '../../hooks/useAxiosFunction.js'

import { doLogin } from '../../store/actions/session'
import { notifyError } from '../../store/actions/notify'

// SASS style
import style from './style.scss'

//
import EmailForm from './components/emailform'
import FacebookForm from './components/facebookform'
import RegisterSwitch from './components/registerswitch'
import LoginImage from './img/login.svg'

// Login Component page
const LogIn = () => {
    // Page states
    const rememberState = useState(false) // "rememberState[0]" is "remember"; "rememberState[1]" is "setRemember"
    const [isRegister, setRegister] = useState(false)

    // Axios functions
    const [response, error, loading, axiosFetch] = useAxiosFunction()
    const sendAuthRequest = (formData, method = 'post') =>
        axiosFetch({
            axiosInstance: axios,
            url: '/auth',
            method,
            requestConfig: formData,
        })
    const handleRegistration = ({ password, ...data }) =>
        sendAuthRequest(
            {
                ...data,
                authType: 'PASSWORD',
                authValue: password,
            },
            'put'
        )
    const handleFacebookAuth = ({ userID, accessToken }) =>
        sendAuthRequest({
            userId: userID,
            token: accessToken,
        })

    //
    const dispatch = useDispatch()

    useEffect(() => {
        if (response && response.data) {
            dispatch(doLogin(response.data))
            route('/', true)
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [response])

    useEffect(() => {
        if (error) {
            dispatch(notifyError(error))
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [error])

    return (
        <div className="row flex-grow-1">
            <div className="col d-flex align-items-center justify-content-center p-3">
                <div>
                    {/* Header */}
                    <img src={LoginImage} className={style.loginhero} alt="Login" />
                    <h1 className="text-center my-4">{isRegister ? 'Register' : 'Sign In'}</h1>

                    {/* Email login/register form */}
                    <EmailForm
                        isRegister={isRegister}
                        isLoading={loading}
                        rememberState={rememberState}
                        loginHandler={sendAuthRequest}
                        registerHandler={handleRegistration}
                    />

                    {/* Facebook login form */}
                    <FacebookForm
                        show={!isRegister}
                        onSuccess={handleFacebookAuth}
                        onProfileSuccess={console.log}
                        onFail={console.log}
                    />

                    {/* Register switch */}
                    <div className="d-flex justify-content-center mt-3">
                        <RegisterSwitch isRegister={isRegister} setRegister={setRegister} />
                    </div>
                </div>
            </div>
            <div className={`d-lg-block d-none col ${style.placeholder}`} />
        </div>
    )
}

export default LogIn
