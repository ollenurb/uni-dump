package brc.studybuddy.backend.gateway.config

import org.springframework.cloud.client.loadbalancer.LoadBalanced
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpHeaders
import org.springframework.http.MediaType
import org.springframework.http.client.reactive.ReactorClientHttpConnector
import org.springframework.web.reactive.function.client.WebClient
import reactor.netty.http.client.HttpClient
import java.time.Duration

@Configuration
class WebClientConfig {
    @Bean
    fun httpClient(): HttpClient = HttpClient.create()
        .responseTimeout(Duration.ofSeconds(3))

    @Bean
    @LoadBalanced
    fun webClientBuilder(httpClient: HttpClient): WebClient.Builder = WebClient.builder()
        .clientConnector(ReactorClientHttpConnector(httpClient))
        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
}
