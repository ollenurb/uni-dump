package brc.studybuddy.backend.auth

import brc.studybuddy.backend.auth.component.FacebookWebClient
import org.junit.jupiter.api.Test
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.TestPropertySource

@TestPropertySource(properties = ["secrets.facebook.apptoken=FB_ACCESS_TOKEN"])
@SpringBootTest
class FacebookClientTests {

    @Autowired
    lateinit var facebookClient: FacebookWebClient

    var logger: Logger? = LoggerFactory.getLogger(FacebookClientTests::class.java)

    @Test
    fun testFacebookTokenInfo() {
    }

}