package brc.studybuddy.backend.gateway.graphql.type

import brc.studybuddy.backend.gateway.client.MeetingsWebClient
import brc.studybuddy.backend.gateway.client.UsersWebClient
import brc.studybuddy.model.Group
import brc.studybuddy.model.Meeting
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.graphql.data.method.annotation.SchemaMapping
import org.springframework.stereotype.Controller
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@Controller
@SchemaMapping(typeName = "Group")
class GroupTypeController {
    @Autowired
    private lateinit var usersWebClient: UsersWebClient

    @Autowired
    private lateinit var meetingsWebClient: MeetingsWebClient


    @SchemaMapping(field = "owner")
    fun getFieldOwner(group: Group): Mono<User> =
        usersWebClient.getUsersByGroupId(group.id, Optional.of(true))
            .singleOrEmpty()

    @SchemaMapping(field = "members")
    fun getFieldMembers(group: Group): Flux<User> = usersWebClient.getUsersByGroupId(group.id, Optional.empty())

    @SchemaMapping(field = "meetings")
    fun getFieldMeetings(group: Group): Flux<Meeting> = meetingsWebClient.getMeetingsByGroupId(group.id)
}
