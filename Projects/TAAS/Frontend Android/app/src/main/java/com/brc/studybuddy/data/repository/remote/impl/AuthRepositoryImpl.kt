package com.brc.studybuddy.data.repository.remote.impl

import android.util.Log
import com.brc.studybuddy.data.model.*
import com.brc.studybuddy.data.repository.AuthRepository
import com.brc.studybuddy.data.repository.remote.endpoints.AuthApi

class AuthRepositoryImpl(
    private val authApi: AuthApi
): AuthRepository {

    override suspend fun authenticate(credentials: Credentials): Token {
        // I'm doing this because I cannot call directly the 'authenticate' method
        val res = when(credentials) {
           is FacebookCredentials -> authApi.authenticate(credentials)
           is EmailCredentials -> authApi.authenticate(credentials)
        }
        return res.data!!
    }

    override suspend fun refresh(refreshToken: String): Token =
        authApi.refresh(refreshToken = refreshToken).data!!

    override suspend fun register(userInput: UserInput): Token =
        authApi.register(userInput = userInput).data!!

}