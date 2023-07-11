package brc.studybuddy.backend.meetings.repository

import brc.studybuddy.model.Meeting
import org.springframework.data.r2dbc.repository.Query
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import org.springframework.stereotype.Repository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
sealed interface MeetingsRepository : ReactiveCrudRepository<Meeting, Long> {
    fun findByName(name: String): Mono<Meeting>

    fun findAllByGroupId(groupId: Long): Flux<Meeting>

    fun findAllByLocation(location: String): Flux<Meeting>

    @Query(
        """
        SELECT m.* FROM meetings m
            JOIN attendees a ON a.meeting_id = m.id
            WHERE a.user_id = :userId
    """
    )
    fun findAllByUserId(userId: Long): Flux<Meeting>

    @Query(
        """
        SELECT m.* FROM meetings m
            JOIN attendees a ON a.meeting_id = m.id
            WHERE a.user_id = :userId AND a.is_host = :isHost
    """
    )
    fun findAllByUserIdAndIsHost(userId: Long, isHost: Boolean): Flux<Meeting>

    @Query(
        """
        SELECT m.* FROM meetings m
            JOIN attendees a ON a.meeting_id = m.id
            WHERE m.id = :meetingId AND a.user_id = :userId AND a.is_host = TRUE
    """
    )
    fun findByMeetingIdAndUserIdAndIsHostTrue(meetingId: Long, userId: Long): Mono<Meeting>
}
