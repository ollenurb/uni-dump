package com.brc.studybuddy.data.model

data class ApiResponse<T>(
    val data: T?,
    val error: ApiError? = null,
    val errors: List<ApiError>? = null,
)

data class ApiError(
    val status: Int?,
    val message: String,
)
