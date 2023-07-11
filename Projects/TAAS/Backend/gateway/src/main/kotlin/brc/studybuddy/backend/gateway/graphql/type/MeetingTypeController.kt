package brc.studybuddy.backend.gateway.graphql.type

import brc.studybuddy.backend.gateway.client.GroupsWebClient
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
@SchemaMapping(typeName = "Meeting")
class MeetingTypeController {
    @Autowired
    private lateinit var usersWebClient: UsersWebClient

    @Autowired
    private lateinit var groupsWebClient: GroupsWebClient


    @SchemaMapping(field = "host")
    fun getFieldHost(meeting: Meeting): Mono<User> =
        usersWebClient.getUsersByMeetingId(meeting.id, Optional.of(true))
            .singleOrEmpty()

    @SchemaMapping(field = "group")
    fun getFieldGroup(meeting: Meeting): Mono<Group> = groupsWebClient.getGroup(meeting.groupId)

    @SchemaMapping(field = "attendees")
    fun getFieldAttendees(meeting: Meeting): Flux<User> =
        usersWebClient.getUsersByMeetingId(meeting.id, Optional.empty())
}
