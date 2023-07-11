package brc.studybuddy.backend.meetings

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient

@EnableEurekaClient
@SpringBootApplication
class MeetingsMicroserviceApplication

fun main(args: Array<String>) {
    runApplication<MeetingsMicroserviceApplication>(*args)
}
