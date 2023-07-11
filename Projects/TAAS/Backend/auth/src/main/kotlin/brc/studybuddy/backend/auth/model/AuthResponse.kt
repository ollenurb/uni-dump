package brc.studybuddy.backend.auth.model

sealed interface AuthResponse

data class AuthSuccess(
    val accessToken: String,
    val accessTokenTtl: Short,
    val refreshToken: String,
    val refreshTokenTtl: Int,
) : AuthResponse