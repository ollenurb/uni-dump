package com.brc.studybuddy.presentation.util

sealed class FetchStatus<out T: Any> {
    data class Success<out T: Any>(val result: T): FetchStatus<T>()
    data class Error(val message: String, val exception: Exception? = null): FetchStatus<Nothing>()
    object Loading: FetchStatus<Nothing>()

    companion object {
        fun <T: Any> fromValue(value: T): FetchStatus<T> = Success(value)
    }
}
