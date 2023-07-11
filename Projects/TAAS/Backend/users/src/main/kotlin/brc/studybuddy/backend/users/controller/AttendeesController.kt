package brc.studybuddy.backend.users.controller

import brc.studybuddy.backend.users.repository.AttendeesRepository
import brc.studybuddy.input.MeetingAttendeeInput
import brc.studybuddy.model.MeetingAttendee
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Mono

@RestController
@RequestMapping(value = ["attendees"], produces = [MediaType.APPLICATION_JSON_VALUE])
class AttendeesController {
    @Autowired
    private lateinit var attendeesRepository: AttendeesRepository


    @PostMapping
    fun save(@RequestBody input: MeetingAttendeeInput): Mono<MeetingAttendee> = Mono.just(input)
        .map(MeetingAttendeeInput::toModel)
        .flatMap(attendeesRepository::save)


    @DeleteMapping("/meeting/{id}")
    fun deleteAllByMeetingId(@PathVariable id: Long): Mono<Boolean> =
        attendeesRepository.deleteAllByMeetingId(id)
            .thenReturn(true)
            .onErrorReturn(false)

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserId(@PathVariable id: Long): Mono<Boolean> =
        attendeesRepository.deleteAllByUserId(id)
            .thenReturn(true)
            .onErrorReturn(false)

    @DeleteMapping(path = ["/meeting/{meetingId}/user/{userId}", "/user/{userId}/meeting/{meetingId}"])
    fun deleteByMeetingIdAndUserId(@PathVariable meetingId: Long, @PathVariable userId: Long): Mono<Boolean> =
        attendeesRepository.deleteByMeetingIdAndUserId(meetingId, userId)
            .thenReturn(true)
            .onErrorReturn(false)
}
