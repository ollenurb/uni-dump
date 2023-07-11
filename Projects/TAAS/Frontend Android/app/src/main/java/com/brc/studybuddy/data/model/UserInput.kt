package com.brc.studybuddy.data.model

data class UserInput(
    val email: String,
    val firstName: String? = null,
    val lastName: String? = null,
    val authValue: String,
    val authType: AuthType
)

enum class AuthType {
    PASSWORD,
    FACEBOOK
}