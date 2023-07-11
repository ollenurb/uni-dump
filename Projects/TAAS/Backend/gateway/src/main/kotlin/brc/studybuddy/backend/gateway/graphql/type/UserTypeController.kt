package brc.studybuddy.backend.gateway.graphql.type

import brc.studybuddy.backend.gateway.client.GroupsWebClient
import brc.studybuddy.backend.gateway.client.MeetingsWebClient
import brc.studybuddy.model.Group
import brc.studybuddy.model.Meeting
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.graphql.data.method.annotation.Argument
import org.springframework.graphql.data.method.annotation.SchemaMapping
import org.springframework.stereotype.Controller
import reactor.core.publisher.Flux
import java.util.*

@Controller
@SchemaMapping(typeName = "User")
class UserTypeController {
    @Autowired
    private lateinit var groupsWebClient: GroupsWebClient

    @Autowired
    private lateinit var meetingsWebClient: MeetingsWebClient


    @SchemaMapping(field = "groups")
    fun getFieldGroups(user: User, @Argument owned: Optional<Boolean>): Flux<Group> =
        groupsWebClient.getGroupsByUserId(user.id, owned)

    @SchemaMapping(field = "meetings")
    fun getFieldMeetings(user: User, @Argument hosted: Optional<Boolean>): Flux<Meeting> =
        meetingsWebClient.getMeetingsByUserId(user.id, hosted)
}
