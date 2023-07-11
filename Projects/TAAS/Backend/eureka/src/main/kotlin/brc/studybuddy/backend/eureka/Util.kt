package brc.studybuddy.backend.eureka

import java.security.MessageDigest

fun sha256sum(input: String): String {
    val md = MessageDigest.getInstance("SHA-256")
    val digest = md.digest(input.toByteArray())
    return digest.fold("") { str, b -> str + "%02x".format(b) }
}
