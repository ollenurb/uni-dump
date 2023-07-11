package brc.studybuddy.backend.gateway.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.reactive.CorsWebFilter
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource

@Configuration
class CorsConfig : CorsConfiguration() {
    @Bean
    fun corsFilter(): CorsWebFilter {
        val source = UrlBasedCorsConfigurationSource().apply {
            val conf = CorsConfiguration().apply {
                addAllowedOrigin("*")

                allowedMethods = listOf("GET", "POST", "PUT", "DELETE", "OPTIONS", "HEAD")

                addAllowedHeader("origin")
                addAllowedHeader("content-type")
                addAllowedHeader("accept")
                addAllowedHeader("authorization")
                addAllowedHeader("cookie")
            }

            registerCorsConfiguration("/**", conf)
        }

        return CorsWebFilter(source)
    }
}
