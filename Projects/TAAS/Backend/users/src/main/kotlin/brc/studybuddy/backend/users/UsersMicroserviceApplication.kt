package brc.studybuddy.backend.users

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient

@EnableEurekaClient
@SpringBootApplication
class UsersMicroserviceApplication

fun main(args: Array<String>) {
    runApplication<UsersMicroserviceApplication>(*args)
}
