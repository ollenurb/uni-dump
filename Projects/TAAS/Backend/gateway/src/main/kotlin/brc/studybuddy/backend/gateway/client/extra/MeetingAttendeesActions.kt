package brc.studybuddy.backend.gateway.client.extra

import brc.studybuddy.backend.gateway.client.ATTENDEES_ENDPOINT
import brc.studybuddy.backend.gateway.client.MEMBERS_ENDPOINT
import brc.studybuddy.input.MeetingAttendeeInput
import brc.studybuddy.model.MeetingAttendee
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

internal interface MeetingAttendeesActions {
    val webClient: WebClient


    fun saveMeetingAttendee(input: MeetingAttendeeInput): Mono<MeetingAttendee> = webClient.post()
        .uri(ATTENDEES_ENDPOINT)
        .bodyValue(input)
        .retrieve()
        .bodyToMono(MeetingAttendee::class.java)


    fun getMeetingAttendeesByMeetingId(id: Long): Flux<MeetingAttendee> = webClient.get()
        .uri("$ATTENDEES_ENDPOINT/meeting/$id")
        .retrieve()
        .bodyToFlux(MeetingAttendee::class.java)

    fun getMeetingAttendeesByUserId(id: Long): Flux<MeetingAttendee> = webClient.get()
        .uri("$MEMBERS_ENDPOINT/user/$id")
        .retrieve()
        .bodyToFlux(MeetingAttendee::class.java)

    fun getMeetingAttendeesByMeetingIdAndUserId(meetingId: Long, userId: Long): Mono<MeetingAttendee> = webClient.get()
        .uri("$ATTENDEES_ENDPOINT/meeting/$meetingId/user/$userId")
        .retrieve()
        .bodyToMono(MeetingAttendee::class.java)


    fun deleteMeetingAttendeesByMeetingId(id: Long): Flux<MeetingAttendee> = webClient.delete()
        .uri("$ATTENDEES_ENDPOINT/meeting/$id")
        .retrieve()
        .bodyToFlux(MeetingAttendee::class.java)

    fun deleteMeetingAttendeesByUserId(id: Long): Flux<MeetingAttendee> = webClient.delete()
        .uri("$ATTENDEES_ENDPOINT/user/$id")
        .retrieve()
        .bodyToFlux(MeetingAttendee::class.java)

    fun deleteMeetingAttendee(input: MeetingAttendeeInput): Mono<MeetingAttendee> = webClient.delete()
        .uri("$ATTENDEES_ENDPOINT/meeting/${input.meetingId}/user/${input.userId}")
        .retrieve()
        .bodyToMono(MeetingAttendee::class.java)
}
