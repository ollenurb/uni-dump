package brc.studybuddy.backend.gateway.config

import io.jsonwebtoken.JwtParser
import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import java.security.Key
import java.util.*
import javax.crypto.spec.SecretKeySpec

@Configuration
class AuthConfig {
    @Bean
    fun privateKeyProvider(@Value("\${auth.secret}") authSecret: String): Key = SecretKeySpec(
        Base64.getDecoder().decode(authSecret), SignatureAlgorithm.HS256.jcaName
    )

    @Bean
    fun jwtParserProvider(privateKeyProvider: Key): JwtParser = Jwts.parserBuilder()
        .setSigningKey(privateKeyProvider)
        .build()
}
