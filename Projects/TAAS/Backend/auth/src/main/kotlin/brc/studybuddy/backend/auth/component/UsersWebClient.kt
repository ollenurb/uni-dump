package brc.studybuddy.backend.auth.component

import brc.studybuddy.input.UserInput
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Mono

internal const val USERS_BASEURL = "lb://users"

@Component
class UsersWebClient {

    @Autowired
    lateinit var loadBalancedWebClientBuilder: WebClient.Builder
    val webClient by lazy { loadBalancedWebClientBuilder.baseUrl(USERS_BASEURL).build() }

    fun getUserByEmail(email: String?): Mono<User> =
            webClient.get()
                .uri("/users/email/{email}", email)
                .retrieve()
                .bodyToMono(User::class.java)

    fun getUserByFbId(id: Long?): Mono<User> =
        webClient.get()
            .uri("/users/fbid/{id}", id)
            .retrieve()
            .bodyToMono(User::class.java)

    fun insertUser(userInput: UserInput): Mono<User> {
        return webClient.post()
            .uri("/users")
            .bodyValue(userInput)
            .retrieve()
            .bodyToMono(User::class.java)
            .share()
    }

}