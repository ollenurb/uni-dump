const LoginBtn = ({ isRegister, isLoading }) => (
    <button className="btn btn-lg btn-secondary mt-3 w-100" type="submit" disabled={isLoading}>
        {isLoading && <i className="fa fa-refresh fa-spin" style={{ marginRight: '5px' }} />}
        {isRegister ? 'Register' : 'Login'}
    </button>
)

export default LoginBtn
