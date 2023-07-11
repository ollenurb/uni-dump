package brc.studybuddy.backend.auth

import brc.webflux.response.wrapper.ResponseWrapper
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient
import org.springframework.context.annotation.Import

@EnableEurekaClient
@SpringBootApplication
@Import(ResponseWrapper::class)
class AuthenticationMicroserviceApplication

fun main(args: Array<String>) {
    runApplication<AuthenticationMicroserviceApplication>(*args)
}
