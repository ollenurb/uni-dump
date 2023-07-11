package com.brc.studybuddy.data.repository

import com.brc.studybuddy.data.model.Token
import kotlinx.coroutines.flow.Flow

interface AccessTokenRepository {

    fun get(): Flow<Token>

    suspend fun save(token: Token)

}