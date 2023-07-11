package brc.studybuddy.backend.gateway.client

import brc.studybuddy.backend.gateway.client.extra.MeetingAttendeesActions
import brc.studybuddy.input.MeetingInput
import brc.studybuddy.model.Meeting
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

@Service
class MeetingsWebClient : MeetingAttendeesActions {
    @Autowired
    private lateinit var webClientBuilder: WebClient.Builder
    override val webClient by lazy { webClientBuilder.baseUrl(MEETINGS_BASEURL).build() }


    fun saveMeeting(input: MeetingInput): Mono<Meeting> = webClient.post()
        .uri(MEETINGS_ENDPOINT)
        .bodyValue(input)
        .retrieve()
        .bodyToMono(Meeting::class.java)


    fun getMeetingsByGroupId(id: Long): Flux<Meeting> = webClient.get()
        .uri("$MEETINGS_ENDPOINT/group/$id")
        .retrieve()
        .bodyToFlux(Meeting::class.java)

    fun getMeetingsByUserId(id: Long, isHost: Optional<Boolean>): Flux<Meeting> = webClient.get()
        .uri { b -> b.path("$MEETINGS_ENDPOINT/user/$id").queryParamIfPresent("is_host", isHost).build() }
        .retrieve()
        .bodyToFlux(Meeting::class.java)

    fun getMeeting(id: Long): Mono<Meeting> = webClient.get()
        .uri("$MEETINGS_ENDPOINT/$id")
        .retrieve()
        .bodyToMono(Meeting::class.java)


    fun updateMeeting(id: Long, input: MeetingInput): Mono<Meeting> = webClient.put()
        .uri("$MEETINGS_ENDPOINT/$id")
        .bodyValue(input)
        .retrieve()
        .bodyToMono(Meeting::class.java)


    fun deleteMeeting(id: Long): Mono<Meeting> = webClient.delete()
        .uri("$MEETINGS_ENDPOINT/$id")
        .retrieve()
        .bodyToMono(Meeting::class.java)

    fun deleteMeetingByIdAndUserIdAndIsHostTrue(meetingId: Long, userId: Long): Mono<Meeting> = webClient.delete()
        .uri("$MEETINGS_ENDPOINT/meeting/$meetingId/user/$userId")
        .retrieve()
        .bodyToMono(Meeting::class.java)
}
