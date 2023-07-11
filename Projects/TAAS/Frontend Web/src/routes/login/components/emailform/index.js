import { useState } from 'preact/hooks'
import TextInput from './textinput'
import LoginBtn from './loginbtn'
import style from './style.scss'

const EmailForm = ({
    isRegister,
    isLoading,
    rememberState: [remember, setRemember],
    loginHandler,
    registerHandler,
}) => {
    const emailState = useState()
    const passwordState = useState()
    const firstNameState = useState()
    const lastNameState = useState()

    const onFormSubmit = (e) => {
        e.preventDefault()
        const formHandler = isRegister ? registerHandler : loginHandler
        formHandler({
            email: emailState[0],
            password: passwordState[0],
            firstName: firstNameState[0],
            lastName: lastNameState[0],
        })
    }

    return (
        <form onSubmit={onFormSubmit}>
            {/* Email textinput */}
            <TextInput id="email" type="email" labelText="Email Address" valueState={emailState} />

            {/* Firstname & Lastname textinputs */}
            {isRegister && (
                <>
                    <TextInput
                        id="firstname"
                        type="text"
                        labelText="Firstname"
                        valueState={firstNameState}
                    />
                    <TextInput
                        id="lastname"
                        type="text"
                        labelText="Lastname"
                        valueState={lastNameState}
                    />
                </>
            )}

            {/* Password textinput */}
            <TextInput
                id="password"
                type="password"
                labelText="Password"
                valueState={passwordState}
            />

            {isRegister || (
                <div className="d-flex flex-column ps-1">
                    {/* Remember me checkbox */}

                    <div>
                        <input
                            id="rememberme"
                            type="checkbox"
                            className="form-check-input"
                            checked={remember}
                            onChange={() => setRemember(!remember)}
                        />
                        <label
                            for="rememberme"
                            className={`form-check-label ${style.rememberlabel}`}
                        >
                            Remember me
                        </label>
                    </div>

                    {/* Fake "Forgot password" link */}
                    <a href="#">Forgot your password?</a>
                </div>
            )}

            {/* Login button */}
            <LoginBtn isRegister={isRegister} isLoading={isLoading} />
        </form>
    )
}

export default EmailForm
