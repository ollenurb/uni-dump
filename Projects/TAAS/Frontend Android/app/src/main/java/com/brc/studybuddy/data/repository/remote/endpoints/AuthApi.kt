package com.brc.studybuddy.data.repository.remote.endpoints

import com.brc.studybuddy.data.model.*
import retrofit2.http.*

interface AuthApi {

    @Headers("Content-Type: application/json")
    @POST("/auth/refresh")
    suspend fun refresh(@Body refreshToken: String): ApiResponse<Token>

    @Headers("Content-Type: application/json")
    @POST("/auth/")
    suspend fun authenticate(@Body credentials: EmailCredentials): ApiResponse<Token>

    // We must overload the method
    @Headers("Content-Type: application/json")
    @POST("/auth/")
    suspend fun authenticate(@Body credentials: FacebookCredentials): ApiResponse<Token>

    @Headers("Content-Type: application/json")
    @PUT("/auth/")
    suspend fun register(@Body userInput: UserInput): ApiResponse<Token>

}
