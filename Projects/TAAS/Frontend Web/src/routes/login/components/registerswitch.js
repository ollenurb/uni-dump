const RegisterSwitch = ({ isRegister, setRegister }) => (
    <div className="form-check form-switch">
        <input
            id="register-switch"
            className="form-check-input"
            type="checkbox"
            role="switch"
            checked={isRegister}
            onChange={() => setRegister(!isRegister)}
        />
        <label className="form-check-label" for="register-switch">
            Register
        </label>
    </div>
)

export default RegisterSwitch
