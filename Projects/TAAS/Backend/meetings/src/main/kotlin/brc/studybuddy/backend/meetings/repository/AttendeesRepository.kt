package brc.studybuddy.backend.meetings.repository

import brc.studybuddy.model.MeetingAttendee
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import org.springframework.stereotype.Repository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
sealed interface AttendeesRepository : ReactiveCrudRepository<MeetingAttendee, Long> {
    fun findAllByUserId(userId: Long): Flux<MeetingAttendee>
    fun findAllByMeetingId(meetingId: Long): Flux<MeetingAttendee>
    fun findByMeetingIdAndUserId(meetingId: Long, userId: Long): Mono<MeetingAttendee>

    fun deleteByMeetingIdAndUserId(meetingId: Long, userId: Long): Mono<Void>
}
