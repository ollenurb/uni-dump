package com.brc.studybuddy.presentation.util

import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asSharedFlow

object Navigator {

    private val _sharedFlow = MutableSharedFlow<Pair<Screen, Boolean>>(extraBufferCapacity = 1)
    val sharedFlow = _sharedFlow.asSharedFlow()

    fun navigateTo(screen: Screen, clearPrevious: Boolean = false) {
        _sharedFlow.tryEmit(Pair(screen, clearPrevious))
    }

}