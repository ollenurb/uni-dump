package brc.studybuddy.backend.groups.controller

import brc.studybuddy.backend.groups.repository.MembersRepository
import brc.studybuddy.input.GroupMemberInput
import brc.studybuddy.model.GroupMember
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@RestController
@RequestMapping(value = ["members"], produces = [MediaType.APPLICATION_JSON_VALUE])
class MembersController {
    @Autowired
    private lateinit var membersRepository: MembersRepository


    @PostMapping
    fun save(@RequestBody input: GroupMemberInput): Mono<GroupMember> =
        Mono.just(input)
            .map(GroupMemberInput::toModel)
            .flatMap(membersRepository::save)


    @GetMapping("/group/{id}")
    fun findAllByGroupId(@PathVariable id: Long): Flux<GroupMember> =
        membersRepository.findAllByGroupId(id)

    @GetMapping("/user/{id}")
    fun findAllByUserId(@PathVariable id: Long): Flux<GroupMember> =
        membersRepository.findAllByUserId(id)

    @GetMapping(path = ["/group/{groupId}/user/{userId}", "/user/{userId}/group/{groupId}"])
    fun findByGroupIdAndUserId(@PathVariable groupId: Long, @PathVariable userId: Long): Mono<GroupMember> =
        membersRepository.findByGroupIdAndUserId(groupId, userId)


    @DeleteMapping("/group/{id}")
    fun deleteAllByGroupId(@PathVariable id: Long): Flux<GroupMember> =
        membersRepository.findAllByGroupId(id)
            .flatMap { m ->
                membersRepository.deleteByGroupIdAndUserId(m.groupId, m.userId)
                    .thenReturn(m)
            }

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserId(@PathVariable id: Long): Flux<GroupMember> =
        membersRepository.findAllByUserId(id)
            .flatMap { m ->
                membersRepository.deleteByGroupIdAndUserId(m.groupId, m.userId)
                    .thenReturn(m)
            }

    @DeleteMapping(path = ["/group/{groupId}/user/{userId}", "/user/{userId}/group/{groupId}"])
    fun deleteByGroupIdAndUserId(@PathVariable groupId: Long, @PathVariable userId: Long): Mono<GroupMember> =
        membersRepository.findByGroupIdAndUserId(groupId, userId)
            .flatMap { m ->
                membersRepository.deleteByGroupIdAndUserId(groupId, userId)
                    .thenReturn(m)
            }
}
