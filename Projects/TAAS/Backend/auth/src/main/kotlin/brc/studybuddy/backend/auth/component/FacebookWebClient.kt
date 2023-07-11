package brc.studybuddy.backend.auth.component

import brc.studybuddy.backend.auth.model.FacebookCredentials
import brc.studybuddy.backend.auth.model.FacebookResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Mono

@Component
class FacebookWebClient {

    @Autowired
    lateinit var webClientBuilder: WebClient.Builder
    val webClient by lazy { webClientBuilder.baseUrl("https://graph.facebook.com/v15.0").build() }

    // Given a userId and a valid accessToken, returns the corresponding
    // info to that user
    fun getUser(credentials: FacebookCredentials): Mono<FacebookResponse> {
        return webClient.get()
            .uri("/${credentials.userId}?fields=id,email,last_name,first_name&access_token=${credentials.token}")
            .retrieve()
            .bodyToMono(FacebookResponse::class.java)
    }

}