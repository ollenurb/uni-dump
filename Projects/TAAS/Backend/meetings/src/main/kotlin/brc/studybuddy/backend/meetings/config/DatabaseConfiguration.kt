package brc.studybuddy.backend.meetings.config

import io.r2dbc.spi.ConnectionFactory
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.core.io.ClassPathResource
import org.springframework.r2dbc.connection.init.ConnectionFactoryInitializer
import org.springframework.r2dbc.connection.init.ResourceDatabasePopulator

@Configuration
class DatabaseConfiguration {

    @Bean
    @Suppress("SpringJavaInjectionPointsAutowiringInspection")
    fun dbConnInitializer(connectionFactory: ConnectionFactory): ConnectionFactoryInitializer =
        with(ConnectionFactoryInitializer()) {
            this.setConnectionFactory(connectionFactory)
            this.setDatabasePopulator(ResourceDatabasePopulator(ClassPathResource("schema.sql")))
            return this
        }

}