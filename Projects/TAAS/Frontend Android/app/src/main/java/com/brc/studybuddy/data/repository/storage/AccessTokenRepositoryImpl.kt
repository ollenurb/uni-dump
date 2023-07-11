package com.brc.studybuddy.data.repository.storage

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import com.brc.studybuddy.data.model.Token
import com.brc.studybuddy.data.repository.AccessTokenRepository
import kotlinx.coroutines.flow.*

private val REFRESH = stringPreferencesKey("REFRESH_TOKEN")
private val ACCESS = stringPreferencesKey("ACCESS_TOKEN")

class AccessTokenRepositoryMock(
    private val dataStore: DataStore<Preferences>
): AccessTokenRepository {

    override fun get(): Flow<Token> =
        dataStore.data
            .map {
                val refresh = it[REFRESH]
                val auth = it[ACCESS]
                if (refresh != null && auth != null) {
                    return@map Token(refresh, auth)
                } else { return@map null }
            }.filterNotNull()

    override suspend fun save(token: Token)  {
        dataStore.edit {
            it[REFRESH] = token.refreshToken
            it[ACCESS] = token.accessToken
        }
    }

}
