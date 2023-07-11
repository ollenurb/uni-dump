package brc.studybuddy.backend.gateway.graphql

import brc.studybuddy.backend.gateway.auth.USERID_KEY
import brc.studybuddy.backend.gateway.client.GroupsWebClient
import brc.studybuddy.backend.gateway.client.MeetingsWebClient
import brc.studybuddy.backend.gateway.client.UsersWebClient
import brc.studybuddy.input.GroupInput
import brc.studybuddy.input.GroupMemberInput
import brc.studybuddy.input.MeetingAttendeeInput
import brc.studybuddy.input.MeetingInput
import brc.studybuddy.model.Group
import brc.studybuddy.model.GroupMember
import brc.studybuddy.model.Meeting
import brc.studybuddy.model.MeetingAttendee
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.graphql.data.method.annotation.Argument
import org.springframework.graphql.data.method.annotation.MutationMapping
import org.springframework.stereotype.Controller
import reactor.core.publisher.Mono

@Controller
class MutationController {
    @Autowired
    private lateinit var usersWebClient: UsersWebClient

    @Autowired
    private lateinit var groupsWebClient: GroupsWebClient

    @Autowired
    private lateinit var meetingsWebClient: MeetingsWebClient


    // ------------------------------------------------------
    // --------------------- Group Class --------------------
    // ------------------------------------------------------

    @MutationMapping
    fun saveGroup(
        @Argument input: GroupInput
    ): Mono<Group> = groupsWebClient.saveGroup(input)
        .flatMap { g ->
            Mono.deferContextual { ctx ->
                Mono.just(GroupMemberInput(g.id, ctx.get(USERID_KEY), true))
            }
                .flatMap { m ->
                    groupsWebClient.saveGroupMember(m)
                        .then(usersWebClient.saveGroupMember(m))
                        .onErrorResume { e ->
                            groupsWebClient.deleteGroupMember(m)
                                .then(Mono.error(e))
                        }
                }
                .onErrorResume { e ->
                    groupsWebClient.deleteGroup(g.id)
                        .then(Mono.error(e))
                }
                .thenReturn(g)
        }

    @MutationMapping
    fun updateGroup(
        @Argument groupId: Long,
        @Argument input: GroupInput
    ): Mono<Group> = Mono.deferContextual { ctx ->
        groupsWebClient.getGroupMemberByGroupIdAndUserId(groupId, ctx.get(USERID_KEY))
    }
        .filter(GroupMember::isOwner)
        .then(groupsWebClient.updateGroup(groupId, input))
        .switchIfEmpty(Mono.error(Exception("The current user is NOT allowed to perform this action!")))

    @MutationMapping
    fun deleteGroup(
        @Argument groupId: Long
    ): Mono<Group> = Mono.deferContextual { ctx ->
        groupsWebClient.getGroupMemberByGroupIdAndUserId(groupId, ctx.get(USERID_KEY))
            .filter(GroupMember::isOwner)
            .thenMany(usersWebClient.deleteGroupMembersByGroupId(groupId))
            .then(
                groupsWebClient.deleteGroupByIdAndUserIdAndIsOwnerTrue(
                    groupId,
                    ctx.get(USERID_KEY)
                )
            )
    }
        .onErrorResume { e ->
            groupsWebClient.getGroupMembersByGroupId(groupId)
                .flatMap { m -> usersWebClient.saveGroupMember(m.toInput()) }
                .then(Mono.error(e))
        }
        .switchIfEmpty(Mono.error(Exception("The current user is NOT allowed to perform this action!")))

    @MutationMapping
    fun addGroupMember(@Argument groupId: Long, @Argument userId: Long): Mono<Boolean> =
        Mono.just(GroupMemberInput(groupId, userId, false))
            .flatMap { m ->
                groupsWebClient.saveGroupMember(m)
                    .then(usersWebClient.saveGroupMember(m))
                    .onErrorResume { e ->
                        groupsWebClient.deleteGroupMember(m)
                            .then(Mono.error(e))
                    }
                    .thenReturn(true)
            }

    @MutationMapping
    fun removeGroupMember(@Argument groupId: Long, @Argument userId: Long): Mono<GroupMember> =
        Mono.just(GroupMemberInput(groupId, userId, false))
            .flatMap { m ->
                groupsWebClient.deleteGroupMember(m)
                    .then(usersWebClient.deleteGroupMember(m))
                    .onErrorResume { e ->
                        groupsWebClient.saveGroupMember(m)
                            .then(Mono.error(e))
                    }
            }


    // ------------------------------------------------------
    // -------------------- Meeting Class -------------------
    // ------------------------------------------------------

    @MutationMapping
    fun saveMeeting(
        @Argument input: MeetingInput
    ): Mono<Meeting> = meetingsWebClient.saveMeeting(input)
        .flatMap { m ->
            Mono.deferContextual { ctx ->
                Mono.just(MeetingAttendeeInput(m.id, ctx.get(USERID_KEY), true))
            }
                .flatMap { a ->
                    meetingsWebClient.saveMeetingAttendee(a)
                        .then(usersWebClient.saveMeetingAttendee(a))
                        .onErrorResume { e ->
                            meetingsWebClient.deleteMeetingAttendee(a)
                                .then(Mono.error(e))
                        }
                }
                .onErrorResume { e ->
                    meetingsWebClient.deleteMeeting(m.id)
                        .then(Mono.error(e))
                }
                .thenReturn(m)
        }


    @MutationMapping
    fun updateMeeting(
        @Argument meetingId: Long,
        @Argument input: MeetingInput
    ): Mono<Meeting> = Mono.deferContextual { ctx ->
        meetingsWebClient.getMeetingAttendeesByMeetingIdAndUserId(meetingId, ctx.get(USERID_KEY))
    }
        .filter(MeetingAttendee::isHost)
        .then(meetingsWebClient.updateMeeting(meetingId, input))
        .switchIfEmpty(Mono.error(Exception("The current user is NOT allowed to perform this action!")))

    @MutationMapping
    fun deleteMeeting(
        @Argument meetingId: Long
    ): Mono<Meeting> = Mono.deferContextual { ctx ->
        meetingsWebClient.getMeetingAttendeesByMeetingIdAndUserId(meetingId, ctx.get(USERID_KEY))
            .filter(MeetingAttendee::isHost)
            .thenMany(usersWebClient.deleteMeetingAttendeesByMeetingId(meetingId))
            .then(
                meetingsWebClient.deleteMeetingByIdAndUserIdAndIsHostTrue(
                    meetingId,
                    ctx.get(USERID_KEY)
                )
            )
    }
        .onErrorResume { e ->
            meetingsWebClient.getMeetingAttendeesByMeetingId(meetingId)
                .flatMap { a -> usersWebClient.saveMeetingAttendee(a.toInput()) }
                .then(Mono.error(e))
        }
        .switchIfEmpty(Mono.error(Exception("The current user is NOT allowed to perform this action!")))


    @MutationMapping
    fun addMeetingAttendee(@Argument meetingId: Long, @Argument userId: Long): Mono<Boolean> =
        Mono.just(MeetingAttendeeInput(meetingId, userId, false))
            .flatMap { a ->
                meetingsWebClient.saveMeetingAttendee(a)
                    .then(usersWebClient.saveMeetingAttendee(a))
                    .onErrorResume { e ->
                        meetingsWebClient.deleteMeetingAttendee(a)
                            .then(Mono.error(e))
                    }
                    .thenReturn(true)
            }

    @MutationMapping
    fun removeMeetingAttendee(@Argument meetingId: Long, @Argument userId: Long): Mono<MeetingAttendee> =
        Mono.just(MeetingAttendeeInput(meetingId, userId, false))
            .flatMap { a ->
                meetingsWebClient.deleteMeetingAttendee(a)
                    .then(usersWebClient.deleteMeetingAttendee(a))
                    .onErrorResume { e ->
                        meetingsWebClient.saveMeetingAttendee(a)
                            .then(Mono.error(e))
                    }
            }
}
