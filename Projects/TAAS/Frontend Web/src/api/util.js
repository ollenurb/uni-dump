import axios from './graphql'
import authAxiosClient from './auth'
import { retrieve } from '../store/tokenService'
import { doLogout, doLogin } from '../store/actions/session'
import { route } from 'preact-router'

// Wrap the qurey and a map of Variables -> Values to the accepted format by GraphQl
export const graphQlQuery = (query, variables = undefined) => ({
    query,
    variables,
})

// Setup interceptors for the GraphQl client
export const setupInterceptors = ({ dispatch }) => {
    console.log('Setting up interceptors')

    axios.interceptors.request.use(
        async (config) => {
            const accessToken = retrieve().accessToken
            config.headers = {
                ...config.headers,
                authorization: `Bearer ${accessToken}`,
            }
            return config
        },
        (error) => Promise.reject(error)
    )

    axios.interceptors.response.use(
        (response) => response,
        async ({ config, response }) => {
            if (response && response.status == 401 && !config.sent) {
                config.sent = true
                console.log('Got 401, trying to refresh the session...')
                try {
                    const refreshToken = retrieve().refreshToken
                    console.log(`Refreshing session with: ${refreshToken}`)
                    const tokens = await authAxiosClient.post('/auth/refresh', refreshToken)
                    if (tokens.data !== undefined) {
                        console.log(`Refreshed data, got ${tokens.data}`)
                        dispatch(doLogin(tokens.data.data))
                    } else {
                        throw Error('A problem has occurred while refreshing the current session')
                    }
                } catch (e) {
                    // TODO: Handle logout with redux
                    dispatch(doLogout())
                    route('/login', true)
                    return Promise.reject(e)
                }
                return axios(config)
            }
        }
    )
}
