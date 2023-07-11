package brc.studybuddy.backend.gateway.client.extra

import brc.studybuddy.backend.gateway.client.MEMBERS_ENDPOINT
import brc.studybuddy.input.GroupMemberInput
import brc.studybuddy.model.GroupMember
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

internal interface GroupMembersActions {
    val webClient: WebClient


    fun saveGroupMember(input: GroupMemberInput): Mono<GroupMember> = webClient.post()
        .uri(MEMBERS_ENDPOINT)
        .bodyValue(input)
        .retrieve()
        .bodyToMono(GroupMember::class.java)


    fun getGroupMembersByGroupId(id: Long): Flux<GroupMember> = webClient.get()
        .uri("$MEMBERS_ENDPOINT/group/$id")
        .retrieve()
        .bodyToFlux(GroupMember::class.java)

    fun getGroupMembersByUserId(id: Long): Flux<GroupMember> = webClient.get()
        .uri("$MEMBERS_ENDPOINT/user/$id")
        .retrieve()
        .bodyToFlux(GroupMember::class.java)

    fun getGroupMemberByGroupIdAndUserId(groupId: Long, userId: Long): Mono<GroupMember> = webClient.get()
        .uri("$MEMBERS_ENDPOINT/group/$groupId/user/$userId")
        .retrieve()
        .bodyToMono(GroupMember::class.java)


    fun deleteGroupMembersByGroupId(id: Long): Flux<GroupMember> = webClient.delete()
        .uri("$MEMBERS_ENDPOINT/group/$id")
        .retrieve()
        .bodyToFlux(GroupMember::class.java)

    fun deleteGroupMembersByUserId(id: Long): Flux<GroupMember> = webClient.delete()
        .uri("$MEMBERS_ENDPOINT/user/$id")
        .retrieve()
        .bodyToFlux(GroupMember::class.java)

    fun deleteGroupMember(input: GroupMemberInput): Mono<GroupMember> = webClient.delete()
        .uri("$MEMBERS_ENDPOINT/group/${input.groupId}/user/${input.userId}")
        .retrieve()
        .bodyToMono(GroupMember::class.java)
}
