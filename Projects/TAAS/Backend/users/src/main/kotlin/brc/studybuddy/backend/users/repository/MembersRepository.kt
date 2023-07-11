package brc.studybuddy.backend.users.repository

import brc.studybuddy.model.GroupMember
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import org.springframework.stereotype.Repository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
sealed interface MembersRepository : ReactiveCrudRepository<GroupMember, Long> {
    fun findAllByGroupId(groupId: Long): Flux<GroupMember>
    fun findAllByGroupIdAndIsOwner(groupId: Long, isOwner: Boolean = true): Flux<GroupMember>

    fun deleteAllByGroupId(groupId: Long): Mono<Void>
    fun deleteAllByUserId(userId: Long): Mono<Void>
    fun deleteByGroupIdAndUserId(groupId: Long, userId: Long): Mono<Void>
}
