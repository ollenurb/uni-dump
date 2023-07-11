package brc.studybuddy.backend.eureka.config

import brc.studybuddy.backend.eureka.environment.RuntimeEnvironmentRepository
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class RuntimeEnvConfig {
    @Bean
    fun runtimeEnvironmentRepository(): RuntimeEnvironmentRepository = RuntimeEnvironmentRepository()
}
