package brc.studybuddy.backend.gateway.client

import brc.studybuddy.backend.gateway.client.extra.GroupMembersActions
import brc.studybuddy.input.GroupInput
import brc.studybuddy.model.Group
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@Service
class GroupsWebClient : GroupMembersActions {
    @Autowired
    private lateinit var webClientBuilder: WebClient.Builder
    override val webClient by lazy { webClientBuilder.baseUrl(GROUPS_BASEURL).build() }


    fun saveGroup(input: GroupInput): Mono<Group> = webClient.post()
        .uri(GROUPS_ENDPOINT)
        .bodyValue(input)
        .retrieve()
        .bodyToMono(Group::class.java)


    fun getGroups(ids: Optional<List<Long>>): Flux<Group> = webClient.get()
        .uri { b -> b.path(GROUPS_ENDPOINT).queryParamIfPresent("id", ids).build() }
        .retrieve()
        .bodyToFlux(Group::class.java)

    fun getGroupsByUserId(id: Long, isOwner: Optional<Boolean>): Flux<Group> = webClient.get()
        .uri { b -> b.path("$GROUPS_ENDPOINT/user/$id").queryParamIfPresent("is_owner", isOwner).build() }
        .retrieve()
        .bodyToFlux(Group::class.java)

    fun getGroup(id: Long): Mono<Group> = webClient.get()
        .uri("$GROUPS_ENDPOINT/$id")
        .retrieve()
        .bodyToMono(Group::class.java)

    fun getGroupByTitle(title: String): Mono<Group> = webClient.get()
        .uri("$GROUPS_ENDPOINT/title/$title")
        .retrieve()
        .bodyToMono(Group::class.java)


    fun updateGroup(id: Long, input: GroupInput): Mono<Group> = webClient.put()
        .uri("$GROUPS_ENDPOINT/$id")
        .bodyValue(input)
        .retrieve()
        .bodyToMono(Group::class.java)


    fun deleteGroup(id: Long): Mono<Group> = webClient.delete()
        .uri("$GROUPS_ENDPOINT/$id")
        .retrieve()
        .bodyToMono(Group::class.java)

    fun deleteGroupByIdAndUserIdAndIsOwnerTrue(groupId: Long, userId: Long): Mono<Group> = webClient.delete()
        .uri("$GROUPS_ENDPOINT/group/$groupId/user/$userId")
        .retrieve()
        .bodyToMono(Group::class.java)
}
