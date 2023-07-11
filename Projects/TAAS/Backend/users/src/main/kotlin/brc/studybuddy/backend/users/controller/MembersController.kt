package brc.studybuddy.backend.users.controller

import brc.studybuddy.backend.users.repository.MembersRepository
import brc.studybuddy.input.GroupMemberInput
import brc.studybuddy.model.GroupMember
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Mono

@RestController
@RequestMapping(value = ["members"], produces = [MediaType.APPLICATION_JSON_VALUE])
class MembersController {
    @Autowired
    private lateinit var membersRepository: MembersRepository


    @PostMapping
    fun save(@RequestBody input: GroupMemberInput): Mono<GroupMember> = Mono.just(input)
        .map(GroupMemberInput::toModel)
        .flatMap(membersRepository::save)


    @DeleteMapping("/group/{id}")
    fun deleteAllByGroupId(@PathVariable id: Long): Mono<Boolean> =
        membersRepository.deleteAllByGroupId(id)
            .thenReturn(true)
            .onErrorReturn(false)

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserId(@PathVariable id: Long): Mono<Boolean> =
        membersRepository.deleteAllByUserId(id)
            .thenReturn(true)
            .onErrorReturn(false)

    @DeleteMapping(path = ["/group/{groupId}/user/{userId}", "/user/{userId}/group/{groupId}"])
    fun deleteByGroupIdAndUserId(@PathVariable groupId: Long, @PathVariable userId: Long): Mono<Boolean> =
        membersRepository.deleteByGroupIdAndUserId(groupId, userId)
            .thenReturn(true)
            .onErrorReturn(false)
}
