package brc.studybuddy.backend.users.repository

import brc.studybuddy.model.MeetingAttendee
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import org.springframework.stereotype.Repository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
sealed interface AttendeesRepository : ReactiveCrudRepository<MeetingAttendee, Long> {
    fun findAllByMeetingId(meetingId: Long): Flux<MeetingAttendee>
    fun findAllByMeetingIdAndIsHost(meetingId: Long, isHost: Boolean = true): Flux<MeetingAttendee>

    fun deleteAllByMeetingId(meetingId: Long): Mono<Void>
    fun deleteAllByUserId(userId: Long): Mono<Void>
    fun deleteByMeetingIdAndUserId(meetingId: Long, userId: Long): Mono<Void>
}
