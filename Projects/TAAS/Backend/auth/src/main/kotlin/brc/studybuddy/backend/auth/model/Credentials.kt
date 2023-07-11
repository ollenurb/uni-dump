package brc.studybuddy.backend.auth.model

import com.fasterxml.jackson.annotation.JsonSubTypes
import com.fasterxml.jackson.annotation.JsonTypeInfo

@JsonTypeInfo(use = JsonTypeInfo.Id.DEDUCTION, include = JsonTypeInfo.As.PROPERTY)
@JsonSubTypes(
    JsonSubTypes.Type(value = EmailCredentials::class),
    JsonSubTypes.Type(value = FacebookCredentials::class)
)
interface Credentials

data class EmailCredentials (
    val email: String,
    val password: String,
): Credentials

data class FacebookCredentials (
    val userId: Long,
    val token: String,
): Credentials
