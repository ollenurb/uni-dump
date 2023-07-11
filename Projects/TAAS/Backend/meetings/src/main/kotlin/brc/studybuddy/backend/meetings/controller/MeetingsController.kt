package brc.studybuddy.backend.meetings.controller

import brc.studybuddy.backend.meetings.repository.MeetingsRepository
import brc.studybuddy.input.MeetingInput
import brc.studybuddy.model.Meeting
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@RestController
@RequestMapping(value = ["meetings"], produces = [MediaType.APPLICATION_JSON_VALUE])
class MeetingsController {
    @Autowired
    lateinit var meetingsRepository: MeetingsRepository


    @PostMapping
    fun save(@RequestBody input: MeetingInput): Mono<Meeting> =
        Mono.just(input)
            .map(MeetingInput::toModel)
            .flatMap(meetingsRepository::save)


    @GetMapping
    fun findAll(@RequestParam id: Optional<List<Long>>): Flux<Meeting> =
        when (id.isPresent) {
            true -> meetingsRepository.findAllById(id.get())
            false -> meetingsRepository.findAll()
        }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Mono<Meeting> = meetingsRepository.findById(id)

    @GetMapping("/name/{name}")
    fun findByName(@PathVariable name: String): Mono<Meeting> = meetingsRepository.findByName(name)

    @GetMapping("/location/{location}")
    fun findAllByLocation(@PathVariable location: String): Flux<Meeting> =
        meetingsRepository.findAllByLocation(location)

    @GetMapping("/user/{id}")
    fun findAllByUserId(@PathVariable id: Long, @RequestParam("is_host") isHost: Optional<Boolean>): Flux<Meeting> =
        when (isHost.isPresent) {
            true -> meetingsRepository.findAllByUserIdAndIsHost(id, isHost.get())
            false -> meetingsRepository.findAllByUserId(id)
        }

    @GetMapping("/group/{id}")
    fun findAllByGroupId(@PathVariable id: Long): Flux<Meeting> = meetingsRepository.findAllByGroupId(id)


    @PutMapping("/{id}")
    fun updateById(@PathVariable id: Long, @RequestBody input: MeetingInput): Mono<Meeting> =
        meetingsRepository.findById(id)
            .map(input::updateModel)
            .flatMap(meetingsRepository::save)

    @PutMapping("/name/{name}")
    fun updateByName(@PathVariable name: String, @RequestBody input: MeetingInput): Mono<Meeting> =
        meetingsRepository.findByName(name)
            .map(input::updateModel)
            .flatMap(meetingsRepository::save)


    @DeleteMapping("/{id}")
    fun deleteById(@PathVariable id: Long): Mono<Meeting> =
        meetingsRepository.findById(id)
            .flatMap { m ->
                meetingsRepository.deleteById(id)
                    .thenReturn(m)
            }

    @DeleteMapping("/name/{name}")
    fun deleteByName(@PathVariable name: String): Mono<Meeting> =
        meetingsRepository.findByName(name)
            .flatMap { m ->
                meetingsRepository.deleteById(m.id)
                    .thenReturn(m)
            }

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserIdAndIsHostTrue(@PathVariable id: Long): Flux<Meeting> =
        meetingsRepository.findAllByUserIdAndIsHost(id, true)
            .flatMap { m ->
                meetingsRepository.deleteById(m.id)
                    .thenReturn(m)
            }

    @DeleteMapping(path = ["/meeting/{meetingId}/user/{userId}", "/user/{userId}/meeting/{meetingId}"])
    fun deleteAllByMeetingIdAndUserIdAndIsHostTrue(meetingId: Long, userId: Long): Mono<Meeting> =
        meetingsRepository.findByMeetingIdAndUserIdAndIsHostTrue(meetingId, userId)
            .flatMap { m ->
                meetingsRepository.deleteById(m.id)
                    .thenReturn(m)
            }
}
