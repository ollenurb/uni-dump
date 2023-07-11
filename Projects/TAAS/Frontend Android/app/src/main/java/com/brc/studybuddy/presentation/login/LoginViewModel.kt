package com.brc.studybuddy.presentation.login

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brc.studybuddy.data.model.AuthType
import com.brc.studybuddy.data.model.Credentials
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
class LoginViewModel @Inject constructor(
    private val authRepository: AuthRepository,
    private val accessTokenRepository: AccessTokenRepository
): ViewModel() {

    // Mutable state is not visible to the outside
    private val _errorMessage: MutableSharedFlow<String?> = MutableSharedFlow()
    val errorMessage = _errorMessage.asSharedFlow()

    fun authenticate(credentials: Credentials) =
        viewModelScope.launch {
            try {
                val token = authRepository.authenticate(credentials)
                accessTokenRepository.save(token)
            } catch (e: Exception) {
                // Emit the error message back to the view
                _errorMessage.emit(e.message)
                // Cancel the job
                this.cancel(e.message!!, e)
            }
        }.invokeOnCompletion {
            if(it == null) {
                // Iterator is null, it means that there are no Throwable(s), then we can
                // save the token and then navigate to the Groups Screen
                Navigator.navigateTo(Screen.GroupsScreen, true)
            } else {
                Log.e("Error", "Exception", it)
            }
        }

    fun navigateToRegister() {
        Navigator.navigateTo(Screen.RegisterScreen)
    }

}