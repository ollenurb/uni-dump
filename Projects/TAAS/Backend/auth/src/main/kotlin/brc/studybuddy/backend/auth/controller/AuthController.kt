package brc.studybuddy.backend.auth.controller

import brc.studybuddy.backend.auth.model.AuthResponse
import brc.studybuddy.backend.auth.model.AuthSuccess
import brc.studybuddy.backend.auth.model.Credentials
import brc.studybuddy.backend.auth.model.EmailCredentials
import brc.studybuddy.backend.auth.service.AuthService
import brc.studybuddy.backend.auth.service.RegisterService
import brc.studybuddy.input.UserInput
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Mono

@RestController
@RequestMapping(value = ["auth"], produces = [MediaType.APPLICATION_JSON_VALUE])
class AuthController {
    @Autowired
    lateinit var authService: AuthService

    @Autowired
    lateinit var registerService: RegisterService

    @Value("\${auth.ttl}")
    private var accessTokenTtl: Short = 0

    @Value("\${auth.refresh.ttl}")
    private var refreshTokenTtl: Int = 0

    @PostMapping
    fun authenticate(@RequestBody credentials: Credentials): Mono<AuthResponse> =
        authService.authenticate(credentials)
            .map { s -> AuthSuccess(s.first, accessTokenTtl, s.second, refreshTokenTtl) }

    @PostMapping(path = ["/refresh"])
    fun refresh(@RequestBody refreshToken: String): Mono<AuthResponse> =
        authService.refresh(refreshToken.removeSurrounding("\""))
            .map { s -> AuthSuccess(s.first, accessTokenTtl, s.second, refreshTokenTtl) }

    @PutMapping
    fun register(@RequestBody user: UserInput): Mono<AuthResponse> =
        registerService.register(user)
            .flatMap { authService.authenticate(EmailCredentials(it.email, it.authValue)) }
            .map { s -> AuthSuccess(s.first, accessTokenTtl, s.second, refreshTokenTtl) }

}
