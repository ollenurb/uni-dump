package com.brc.studybuddy.di

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.core.handlers.ReplaceFileCorruptionHandler
import androidx.datastore.preferences.SharedPreferencesMigration
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.emptyPreferences
import androidx.datastore.preferences.preferencesDataStoreFile
import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.network.okHttpClient
import com.brc.studybuddy.data.repository.storage.AccessTokenRepositoryMock
import com.brc.studybuddy.data.repository.remote.utils.AuthRefresher
import com.brc.studybuddy.data.repository.remote.impl.AuthRepositoryImpl
import com.brc.studybuddy.data.repository.AccessTokenRepository
import com.brc.studybuddy.data.repository.AuthRepository
import com.brc.studybuddy.data.repository.GroupRepository
import com.brc.studybuddy.data.repository.remote.impl.GroupRepositoryImpl
import com.brc.studybuddy.data.repository.remote.endpoints.AuthApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.runBlocking
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

const val SERVER_BASE_URL = "http://192.168.1.230:8080/"
const val USER_PREFERENCES = "user_preferences"

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    /*
    * Provides a fake datasource implementation for the AccessToken Repository
    */
    @Provides
    @Singleton
    fun injectAccessTokenRepository(
        dataStore: DataStore<Preferences>
    ): AccessTokenRepository = AccessTokenRepositoryMock(dataStore)

    @Provides
    @Singleton
    fun injectAuthRefresher(
        authRepository: AuthRepository,
        accessTokenRepository: AccessTokenRepository
    ): AuthRefresher = AuthRefresher(
        authRepository = authRepository,
        accessTokenRepository = accessTokenRepository
    )

    /*
    * Provides a fake datasource implementation for the Authentication Repository
    */
    @Provides
    @Singleton
    fun injectAuthRepository(
        baseHttpClientBuilder: OkHttpClient.Builder
    ): AuthRepository {
        val retrofit: Retrofit = Retrofit.Builder()
            .baseUrl(SERVER_BASE_URL)
            .client(baseHttpClientBuilder.build())
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        return AuthRepositoryImpl(
            retrofit.create(AuthApi::class.java)
        )
    }

    @Provides
    @Singleton
    fun injectGroupRepository(
        apolloClient: ApolloClient
    ): GroupRepository = GroupRepositoryImpl(apolloClient)

    @Provides
    @Singleton
    fun injectApolloClient(
        baseHttpClientBuilder: OkHttpClient.Builder,
        authRefresher: AuthRefresher,
        accessTokenRepository: AccessTokenRepository
    ): ApolloClient {
        val httpClient = baseHttpClientBuilder
                .addInterceptor { chain ->
                    chain.proceed(chain.request().newBuilder().also { request ->
                        request.addHeader("Accept", "application/json")
                        val token = runBlocking { accessTokenRepository.get().firstOrNull() }
                        token?.let { request.addHeader("Authorization", "Bearer ${it.accessToken}") }
                    }.build())
                }.also { client ->
                    client.authenticator(authRefresher)
                }.build()

        return ApolloClient.Builder()
            .serverUrl(SERVER_BASE_URL + "graphql")
            .okHttpClient(httpClient)
            .build()
    }

    /*
     * Provides a base OkHttpClient Builder with base logging and
     * automatic exception decoding
     */
    @Provides
    @Singleton
    fun injectBaseHttpClientBuilder(): OkHttpClient.Builder {
        val loggerInterceptor = HttpLoggingInterceptor()
        loggerInterceptor.setLevel(HttpLoggingInterceptor.Level.BODY)
        return OkHttpClient.Builder()
            .addInterceptor(loggerInterceptor)
    }

    @Provides
    @Singleton
    fun providePreferencesDataStore(@ApplicationContext appContext: Context): DataStore<Preferences> =
        PreferenceDataStoreFactory.create(
            corruptionHandler = ReplaceFileCorruptionHandler(
                produceNewData = { emptyPreferences() }
            ),
            migrations = listOf(SharedPreferencesMigration(appContext, USER_PREFERENCES)),
            scope = CoroutineScope(Dispatchers.IO + SupervisorJob()),
            produceFile = { appContext.preferencesDataStoreFile(USER_PREFERENCES)}
        )

}