package brc.studybuddy.backend.gateway.auth

import io.jsonwebtoken.ExpiredJwtException
import io.jsonwebtoken.JwtException
import io.jsonwebtoken.JwtParser
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.core.annotation.Order
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpMethod
import org.springframework.http.HttpStatus
import org.springframework.http.server.reactive.ServerHttpRequest
import org.springframework.stereotype.Component
import org.springframework.web.server.ServerWebExchange
import org.springframework.web.server.WebFilter
import org.springframework.web.server.WebFilterChain
import reactor.core.publisher.Mono
import java.util.*
import java.util.function.Predicate
import java.util.regex.Matcher
import java.util.regex.Pattern


const val USERID_KEY = "X-UserId"

private const val AUTHORIZATION_HEADER = "Authorization"
private val BEARER_PATTERN: Pattern = Pattern.compile("^Bearer (.+?)$")


private fun getHeaderAuthToken(headers: HttpHeaders): Optional<String> =
    Optional.ofNullable(headers.getFirst(AUTHORIZATION_HEADER))
        .filter(Predicate.not(String::isEmpty))
        .map(BEARER_PATTERN::matcher)
        .filter(Matcher::find)
        .map { m -> m.group(1) }


@Component
@Order(Int.MIN_VALUE)
class WebRequestFilter : WebFilter {
    private val logger: Logger by lazy { LoggerFactory.getLogger(this::class.java) }

    @Autowired
    lateinit var jwtParser: JwtParser

    private fun getAuthorizedUserId(request: ServerHttpRequest) =
        getHeaderAuthToken(request.headers)
            .map { tok ->
                try {
                    val jwt = jwtParser.parseClaimsJws(tok)
                    jwt.body.subject.toLong()
                } catch (_: ExpiredJwtException) {
                    // Do nothing
                    null
                } catch (e: JwtException) {
                    logger.error("JWT Authentication", e)
                    null
                }
            }

    // Webflux filter
    override fun filter(exchange: ServerWebExchange, chain: WebFilterChain): Mono<Void> {
        val reqPath = exchange.request.path.value()
        if (reqPath.startsWith("/auth") || exchange.request.method == HttpMethod.OPTIONS) {
            return chain.filter(exchange)
        }

        val authUserId = getAuthorizedUserId(exchange.request)
        if (authUserId.isPresent) {
            return chain.filter(exchange)
                .contextWrite { ctx -> ctx.put(USERID_KEY, authUserId.get()) }
        }

        return with(exchange.response) {
            statusCode = HttpStatus.UNAUTHORIZED
            headers.add(
                "WWW-Authenticate",
                "Bearer realm=\"Access to the user's private area\", charset=\"UTF-8\""
            )
            setComplete()
        }
    }
}
