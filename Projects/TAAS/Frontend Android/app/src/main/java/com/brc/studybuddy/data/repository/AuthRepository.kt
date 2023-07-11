package com.brc.studybuddy.data.repository

import com.brc.studybuddy.data.model.Credentials
import com.brc.studybuddy.data.model.Token
import com.brc.studybuddy.data.model.UserInput

interface AuthRepository {

    suspend fun authenticate(credentials: Credentials): Token

    suspend fun refresh(refreshToken: String): Token

    suspend fun register(userInput: UserInput): Token

}