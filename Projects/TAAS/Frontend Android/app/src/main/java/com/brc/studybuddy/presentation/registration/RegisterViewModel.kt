package com.brc.studybuddy.presentation.registration

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brc.studybuddy.data.model.AuthType
import com.brc.studybuddy.data.model.UserInput
import com.brc.studybuddy.data.repository.AccessTokenRepository
import com.brc.studybuddy.data.repository.AuthRepository
import com.brc.studybuddy.presentation.util.Navigator
import com.brc.studybuddy.presentation.util.Screen
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RegisterViewModel @Inject constructor(
    private val authRepository: AuthRepository,
    private val accessTokenRepository: AccessTokenRepository
): ViewModel() {

    private val _toastMessage: MutableSharedFlow<String?> = MutableSharedFlow()
    val toastMessage = _toastMessage.asSharedFlow()

    fun register(email: String, firstName: String, lastName: String, password: String) {
        val userInput = UserInput(email, firstName, lastName, password, AuthType.PASSWORD)
        viewModelScope.launch {
            try {
                val token = authRepository.register(userInput)
                accessTokenRepository.save(token)
                _toastMessage.emit("User successfully registered")
            } catch (e: Exception) {
                // Emit the error message back to the view
                _toastMessage.emit(e.message)
                // Cancel the job
                this.cancel(e.message!!, e)
            }
        }.invokeOnCompletion {
            if(it == null) {
                // Iterator is null, it means that there are no Throwable(s), then we can
                // save the token and then navigate to the Groups Screen
                Navigator.navigateTo(Screen.GroupsScreen)
            } else {
                Log.e("Error", "Exception", it)
            }
        }
    }

}