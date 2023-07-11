package brc.studybuddy.backend.users.controller

import brc.studybuddy.backend.users.repository.AttendeesRepository
import brc.studybuddy.backend.users.repository.MembersRepository
import brc.studybuddy.backend.users.repository.UsersRepository
import brc.studybuddy.input.UserInput
import brc.studybuddy.model.GroupMember
import brc.studybuddy.model.MeetingAttendee
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@RestController
@RequestMapping(value = ["users"], produces = [MediaType.APPLICATION_JSON_VALUE])
class UsersController {
    @Autowired
    private lateinit var usersRepository: UsersRepository

    @Autowired
    private lateinit var membersRepository: MembersRepository

    @Autowired
    private lateinit var attendeesRepository: AttendeesRepository


    @PostMapping
    fun save(@RequestBody input: UserInput): Mono<User> = Mono.just(input)
        .map(UserInput::toModel)
        .flatMap(usersRepository::save)


    @GetMapping // /users?id=1&id=2...
    fun findAll(@RequestParam id: Optional<List<Long>>): Flux<User> = when (id.isPresent) {
        true -> usersRepository.findAllById(id.get())
        false -> usersRepository.findAll()
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Mono<User> = usersRepository.findById(id)

    @GetMapping("/email/{email}")
    fun findByEmail(@PathVariable email: String): Mono<User> = usersRepository.findByEmail(email)

    @GetMapping("/fbid/{id}")
    fun findByFbId(@PathVariable id: String): Mono<User> = usersRepository.findByFbId(id)

    @GetMapping("/group/{id}")
    fun findAllByGroupId(@PathVariable id: Long, @RequestParam("is_owner") isOwner: Optional<Boolean>): Flux<User> =
        when (isOwner.isPresent) {
            true -> membersRepository.findAllByGroupIdAndIsOwner(id, isOwner.get())
            false -> membersRepository.findAllByGroupId(id)
        }
            .map(GroupMember::userId)
            .flatMap(usersRepository::findById)

    @GetMapping("/meeting/{id}")
    fun findAllByMeetingId(@PathVariable id: Long, @RequestParam("is_host") isHost: Optional<Boolean>): Flux<User> =
        when (isHost.isPresent) {
            true -> attendeesRepository.findAllByMeetingIdAndIsHost(id, isHost.get())
            false -> attendeesRepository.findAllByMeetingId(id)
        }
            .map(MeetingAttendee::userId)
            .flatMap(usersRepository::findById)


    @PutMapping("/{id}")
    fun updateById(@PathVariable id: Long, @RequestBody input: UserInput): Mono<User> =
        usersRepository.findById(id)
            .map(input::updateModel)
            .flatMap(usersRepository::save)

    @PutMapping("/email/{email}")
    fun updateByEmail(@PathVariable email: String, @RequestBody input: UserInput): Mono<User> =
        usersRepository.findByEmail(email)
            .map(input::updateModel)
            .flatMap(usersRepository::save)


    @DeleteMapping("/{id}")
    fun deleteById(@PathVariable id: Long): Mono<Boolean> = usersRepository.deleteById(id)
        .thenReturn(true)
        .onErrorReturn(false)

    @DeleteMapping("/email/{email}")
    fun deleteByEmail(@PathVariable email: String): Mono<Boolean> = usersRepository.deleteByEmail(email)
        .thenReturn(true)
        .onErrorReturn(false)
}
