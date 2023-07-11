package brc.studybuddy.backend.auth.component

import io.jsonwebtoken.*
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component
import java.time.Instant
import java.util.*
import javax.crypto.spec.SecretKeySpec

const val TOKEN_TYPE_CLAIM_NAME: String = "isRefreshToken"

typealias Tokens = Pair<String, String>

@Component
class TokenManager(
    @Value("\${auth.ttl}") val accessTokenTimeToLive: Long,
    @Value("\${auth.refresh.ttl}") val refreshTokenTimeToLive: Long,
    @Value("\${auth.secret}") val secretKey: String
) {

    private final val signingKey = SecretKeySpec(
        Base64.getDecoder().decode(secretKey),
        SignatureAlgorithm.HS256.jcaName
    )

    val signer: JwtBuilder =
        Jwts.builder()
            .signWith(signingKey)

    val parser: JwtParser =
        Jwts.parserBuilder()
            .setSigningKey(signingKey)
            .build()

    /*
     * Generate access and refresh token for the given user, with the given time to live (expressed in seconds)
     */
    fun generateTokens(userId: Long): Tokens {
        val now = Instant.now()
        val accessTokenExpire = now.plusSeconds(accessTokenTimeToLive)
        val refreshTokenExpire = accessTokenExpire.plusSeconds(refreshTokenTimeToLive)

        val tokenBuilder = signer.setSubject(userId.toString())
            .setIssuedAt(Date.from(now))

        return Pair(
            tokenBuilder.claim(TOKEN_TYPE_CLAIM_NAME, false)
                .setExpiration(Date.from(accessTokenExpire))
                .compact(),
            tokenBuilder.claim(TOKEN_TYPE_CLAIM_NAME, true)
                .setExpiration(Date.from(refreshTokenExpire))
                .compact()
        )
    }

    /*
    * Checks if the given refresh token is valid
    * Returns the UserId contained inside the token, otherwise throws an exception
    */
    fun validateRefreshToken(token: String): Long {
        val tokenBody: Claims = parser.parseClaimsJws(token).body
        val isRefreshToken = tokenBody.getOrDefault(TOKEN_TYPE_CLAIM_NAME, false) as Boolean

        if(!isRefreshToken) throw Error("The token provided is not a refresh token")

        return tokenBody.subject.toLong()
    }

}