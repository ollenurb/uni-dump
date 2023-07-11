package brc.studybuddy.backend.groups.repository

import brc.studybuddy.model.Group
import org.springframework.data.r2dbc.repository.Query
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import org.springframework.stereotype.Repository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
sealed interface GroupsRepository : ReactiveCrudRepository<Group, Long> {
    fun findByTitle(title: String): Mono<Group>

    @Query("""
        SELECT g.* FROM groups g
            JOIN members m ON m.group_id = g.id
            WHERE m.user_id = :userId
    """)
    fun findAllByUserId(userId: Long): Flux<Group>

    @Query("""
        SELECT g.* FROM groups g
            JOIN members m ON m.group_id = g.id
            WHERE m.user_id = :userId AND m.is_owner = :isOwner
    """)
    fun findAllByUserIdAndIsOwner(userId: Long, isOwner: Boolean): Flux<Group>

    @Query("""
        SELECT g.* FROM groups g
            JOIN members m ON m.group_id = g.id
            WHERE g.id = :groupId AND m.user_id = :userId AND m.is_owner = TRUE
    """)
    fun findByGroupIdAndUserIdAndIsOwnerTrue(groupId: Long, userId: Long): Mono<Group>
}
