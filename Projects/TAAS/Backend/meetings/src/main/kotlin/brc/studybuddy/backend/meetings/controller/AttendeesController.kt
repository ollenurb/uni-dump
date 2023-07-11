package brc.studybuddy.backend.meetings.controller

import brc.studybuddy.backend.meetings.repository.AttendeesRepository
import brc.studybuddy.input.MeetingAttendeeInput
import brc.studybuddy.model.MeetingAttendee
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@RestController
@RequestMapping(value = ["attendees"], produces = [MediaType.APPLICATION_JSON_VALUE])
class AttendeesController {
    @Autowired
    lateinit var attendeesRepository: AttendeesRepository


    @PostMapping
    fun save(@RequestBody input: MeetingAttendeeInput): Mono<MeetingAttendee> =
        Mono.just(input)
            .map(MeetingAttendeeInput::toModel)
            .flatMap(attendeesRepository::save)


    @GetMapping("/meeting/{id}")
    fun findAllByMeetingId(@PathVariable id: Long): Flux<MeetingAttendee> =
        attendeesRepository.findAllByMeetingId(id)

    @GetMapping("/user/{id}")
    fun findAllByUserId(@PathVariable id: Long): Flux<MeetingAttendee> =
        attendeesRepository.findAllByUserId(id)

    @GetMapping(path = ["/meeting/{meetingId}/user/{userId}", "/user/{userId}/meeting/{meetingId}"])
    fun findByUserIdAndMeetingId(@PathVariable meetingId: Long, @PathVariable userId: Long): Mono<MeetingAttendee> =
        attendeesRepository.findByMeetingIdAndUserId(meetingId, userId)


    @DeleteMapping("/meeting/{id}")
    fun deleteAllByMeetingId(@PathVariable id: Long): Flux<MeetingAttendee> =
        attendeesRepository.findAllByMeetingId(id)
            .flatMap { a ->
                attendeesRepository.deleteByMeetingIdAndUserId(a.meetingId, a.userId)
                    .thenReturn(a)
            }

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserId(@PathVariable id: Long): Flux<MeetingAttendee> =
        attendeesRepository.findAllByUserId(id)
            .flatMap { a ->
                attendeesRepository.deleteByMeetingIdAndUserId(a.meetingId, a.userId)
                    .thenReturn(a)
            }

    @DeleteMapping(path = ["/meeting/{meetingId}/user/{userId}", "/user/{userId}/meeting/{meetingId}"])
    fun deleteByUserIdAndMeetingId(@PathVariable meetingId: Long, @PathVariable userId: Long): Mono<MeetingAttendee> =
        attendeesRepository.findByMeetingIdAndUserId(meetingId, userId)
            .flatMap { a ->
                attendeesRepository.deleteByMeetingIdAndUserId(meetingId, userId)
                    .thenReturn(a)
            }
}
