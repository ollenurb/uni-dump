package brc.studybuddy.backend.eureka

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.config.server.EnableConfigServer
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@EnableEurekaServer
@EnableConfigServer
@SpringBootApplication
class EurekaMicroserviceApplication

fun main(args: Array<String>) {
    runApplication<EurekaMicroserviceApplication>(*args)
}
