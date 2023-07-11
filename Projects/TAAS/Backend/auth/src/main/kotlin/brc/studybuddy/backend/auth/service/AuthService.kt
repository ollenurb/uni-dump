package brc.studybuddy.backend.auth.service

import brc.studybuddy.backend.auth.component.FacebookWebClient
import brc.studybuddy.backend.auth.component.TokenManager
import brc.studybuddy.backend.auth.component.Tokens
import brc.studybuddy.backend.auth.component.UsersWebClient
import brc.studybuddy.backend.auth.model.*
import brc.studybuddy.input.UserInput
import brc.studybuddy.model.User
import brc.webflux.response.wrapper.model.Response
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Service
import reactor.core.publisher.Mono

@Service
class AuthService {

    @Autowired
    lateinit var facebookWebClient: FacebookWebClient

    @Autowired
    lateinit var usersWebClient: UsersWebClient

    @Autowired
    lateinit var tokenManager: TokenManager

    /*
     * Authenticate the User using the given credentials
     * @returns:
     *   - A Mono of pair that contains the access token and the refresh token of the given user
     *   - A Mono containing an error that encode the cause
     */
    fun authenticate(credentials: Credentials): Mono<Tokens> =
        Mono.just(credentials)
            .flatMap {
                when (credentials) {
                    is FacebookCredentials -> {
                        facebookAuthentication(it as FacebookCredentials)
                    }
                    is EmailCredentials -> {
                        emailAuthentication(it as EmailCredentials)
                    }
                    else -> Mono.error(Response.Error(HttpStatus.BAD_REQUEST, "The given input does not conform to the API specifications"))
                }
            }
            .map { tokenManager.generateTokens(it.id) }

    /*
    *  Perform the authentication using email and password
    */
    fun emailAuthentication(credentials: EmailCredentials): Mono<User> =
        Mono.just(credentials)
            .flatMap { c ->
                usersWebClient.getUserByEmail(c.email)
                    .filter { it.authValue == c.password }
            }
            .switchIfEmpty(Mono.error(Response.Error(HttpStatus.UNAUTHORIZED, "Incorrect credentials")))

    /*
    * Perform the authentication using the provided Facebook token
    * It checks if the received Facebook token is valid by calling
    * Facebook's Graph API, if it is valid, then it tries to fetch the
    * corresponding user from the Users microservice. If no users are
    * found, then it sends a request to create such user.
    * @returns:
    *   - A Mono<User> containing the authenticated user associated
    *     with the given token
    *   - A Mono<AuthError> enconding the encountered error
    */
    fun facebookAuthentication(credentials: FacebookCredentials): Mono<User> =
        facebookWebClient.getUser(credentials)
            .map { response ->
                when (response) {
                    is FacebookSuccess -> response
                    is FacebookError -> throw Response.Error(HttpStatus.valueOf(response.error.code), response.error.message)
                    else -> throw Error("An unexpected error occurred while trying to fetch Facebook token data")
                }
            }
            .flatMap {
                usersWebClient
                    .getUserByFbId(it.id)
                    .switchIfEmpty(
                        usersWebClient.insertUser(
                            UserInput(
                                it.email,
                                it.firstName,
                                it.lastName,
                                User.AuthType.FACEBOOK,
                                it.id.toString()
                            )
                        )
                    )
            }

    fun refresh(refreshToken: String): Mono<Tokens> =
        Mono.just(refreshToken)
            .map(tokenManager::validateRefreshToken)
            .onErrorMap { e -> Response.Error(HttpStatus.BAD_REQUEST, e.message!!) }
            .map(tokenManager::generateTokens)

}