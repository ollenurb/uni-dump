package brc.studybuddy.backend.eureka.environment

import brc.studybuddy.backend.eureka.sha256sum
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.cloud.config.environment.Environment
import org.springframework.cloud.config.environment.PropertySource
import org.springframework.cloud.config.server.environment.EnvironmentRepository
import org.springframework.context.ApplicationContext
import org.springframework.core.Ordered
import java.util.*


private const val authTTL: Short = 300 // 5 minutes in seconds
private const val authRefreshTTL: Int = 604800 // 1 week in seconds


class RuntimeEnvironmentRepository : EnvironmentRepository, Ordered {
    @Autowired
    lateinit var appContext: ApplicationContext

    private fun genAuthSecret(): String {
        val calendar = Calendar.getInstance().apply {
            timeInMillis = appContext.startupDate
            set(Calendar.MILLISECOND, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.HOUR, 0)
        }

        return sha256sum(calendar.timeInMillis.toString())
    }

    override fun findOne(application: String?, profile: String?, label: String?) =
        Environment(application, profile).apply {
            add(
                PropertySource(
                    "RuntimePropertySource", mapOf(
                        Pair("auth.secret", genAuthSecret()),
                        Pair("auth.ttl", authTTL),
                        Pair("auth.refresh.ttl", authRefreshTTL)
                    )
                )
            )
        }

    override fun getOrder(): Int = Ordered.HIGHEST_PRECEDENCE
}
