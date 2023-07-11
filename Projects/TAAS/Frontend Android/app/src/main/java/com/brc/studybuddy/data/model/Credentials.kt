package com.brc.studybuddy.data.model

sealed interface Credentials

data class EmailCredentials(
    val email: String,
    val password: String,
): Credentials

data class FacebookCredentials(
    val userId: Long,
    val token: String,
): Credentials