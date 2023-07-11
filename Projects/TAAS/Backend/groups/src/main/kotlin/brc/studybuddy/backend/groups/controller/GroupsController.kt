package brc.studybuddy.backend.groups.controller

import brc.studybuddy.backend.groups.repository.GroupsRepository
import brc.studybuddy.input.GroupInput
import brc.studybuddy.model.Group
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@RestController
@RequestMapping(value = ["groups"], produces = [MediaType.APPLICATION_JSON_VALUE])
class GroupsController {
    @Autowired
    private lateinit var groupsRepository: GroupsRepository


    @PostMapping
    fun save(@RequestBody input: GroupInput): Mono<Group> =
        Mono.just(input)
            .map(GroupInput::toModel)
            .flatMap(groupsRepository::save)


    @GetMapping // /groups?id=1&id=2...
    fun findAll(@RequestParam id: Optional<List<Long>>): Flux<Group> =
        when (id.isPresent) {
            true -> groupsRepository.findAllById(id.get())
            false -> groupsRepository.findAll()
        }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Mono<Group> =groupsRepository.findById(id)

    @GetMapping("/title/{title}")
    fun findByTitle(@PathVariable title: String): Mono<Group> = groupsRepository.findByTitle(title)

    @GetMapping("/user/{id}")
    fun findAllByUserId(@PathVariable id: Long, @RequestParam("is_owner") isOwner: Optional<Boolean>): Flux<Group> =
        when (isOwner.isPresent) {
            true -> groupsRepository.findAllByUserIdAndIsOwner(id, isOwner.get())
            false -> groupsRepository.findAllByUserId(id)
        }


    @PutMapping("/{id}")
    fun updateById(@PathVariable id: Long, @RequestBody input: GroupInput): Mono<Group> =
        groupsRepository.findById(id)
            .map(input::updateModel)
            .flatMap(groupsRepository::save)

    @PutMapping("/title/{title}")
    fun updateByTitle(@PathVariable title: String, @RequestBody input: GroupInput): Mono<Group> =
        groupsRepository.findByTitle(title)
            .map(input::updateModel)
            .flatMap(groupsRepository::save)


    @DeleteMapping("/{id}")
    fun deleteById(@PathVariable id: Long): Mono<Group> =
        groupsRepository.findById(id)
            .flatMap { g ->
                groupsRepository.deleteById(id)
                    .thenReturn(g)
            }

    @DeleteMapping("/title/{title}")
    fun deleteByTitle(@PathVariable title: String): Mono<Group> =
        groupsRepository.findByTitle(title)
            .flatMap { g ->
                groupsRepository.deleteById(g.id)
                    .thenReturn(g)
            }

    @DeleteMapping("/user/{id}")
    fun deleteAllByUserIdAndIsOwnerTrue(@PathVariable id: Long): Flux<Group> =
        groupsRepository.findAllByUserIdAndIsOwner(id, true)
            .flatMap { g ->
                groupsRepository.deleteById(g.id)
                    .thenReturn(g)
            }

    @DeleteMapping(path = ["/group/{groupId}/user/{userId}", "/user/{userId}/group/{groupId}"])
    fun deleteByGroupIdAndUserIdAndIsOwnerTrue(@PathVariable groupId: Long, @PathVariable userId: Long): Mono<Group> =
        groupsRepository.findByGroupIdAndUserIdAndIsOwnerTrue(groupId, userId)
            .flatMap { g ->
                groupsRepository.deleteById(g.id)
                    .thenReturn(g)
            }
}
