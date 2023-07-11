package brc.studybuddy.backend.groups

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient

@EnableEurekaClient
@SpringBootApplication
class GroupsMicroserviceApplication

fun main(args: Array<String>) {
    runApplication<GroupsMicroserviceApplication>(*args)
}
