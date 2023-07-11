package brc.studybuddy.backend.gateway.client

import brc.studybuddy.backend.gateway.client.extra.GroupMembersActions
import brc.studybuddy.backend.gateway.client.extra.MeetingAttendeesActions
import brc.studybuddy.input.UserInput
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@Service
class UsersWebClient : GroupMembersActions, MeetingAttendeesActions {
    @Autowired
    private lateinit var webClientBuilder: WebClient.Builder
    override val webClient by lazy { webClientBuilder.baseUrl(USERS_BASEURL).build() }


    fun saveUser(input: UserInput): Mono<User> = webClient.post()
        .uri(USERS_ENDPOINT)
        .bodyValue(input)
        .retrieve()
        .bodyToMono(User::class.java)


    fun getUsers(ids: Optional<List<Long>>): Flux<User> = webClient.get()
        .uri { b -> b.path(USERS_ENDPOINT).queryParamIfPresent("id", ids).build() }
        .retrieve()
        .bodyToFlux(User::class.java)

    fun getUsersByGroupId(id: Long, isOwner: Optional<Boolean>): Flux<User> = webClient.get()
        .uri { b -> b.path("$USERS_ENDPOINT/group/$id").queryParamIfPresent("is_owner", isOwner).build() }
        .retrieve()
        .bodyToFlux(User::class.java)

    fun getUsersByMeetingId(id: Long, isHost: Optional<Boolean>): Flux<User> = webClient.get()
        .uri { b -> b.path("$USERS_ENDPOINT/meeting/$id").queryParamIfPresent("is_host", isHost).build() }
        .retrieve()
        .bodyToFlux(User::class.java)

    fun getUser(id: Long): Mono<User> = webClient.get()
        .uri("$USERS_ENDPOINT/$id")
        .retrieve()
        .bodyToMono(User::class.java)

    fun getUserByEmail(email: String): Mono<User> = webClient.get()
        .uri("$USERS_ENDPOINT/email/$email")
        .retrieve()
        .bodyToMono(User::class.java)

    fun getUserByFbId(id: String): Mono<User> = webClient.get()
        .uri("$USERS_ENDPOINT/fbid/$id")
        .retrieve()
        .bodyToMono(User::class.java)
}
