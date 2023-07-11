package com.brc.studybuddy.presentation.addgroup

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brc.studybuddy.data.model.Group
import com.brc.studybuddy.data.repository.GroupRepository
import com.brc.studybuddy.presentation.util.Navigator
import com.brc.studybuddy.presentation.util.Screen
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class AddGroupViewModel @Inject constructor(
    private val groupRepository: GroupRepository
): ViewModel() {

    private val _toastMessage: MutableSharedFlow<String?> = MutableSharedFlow()
    val toastMessage = _toastMessage.asSharedFlow()

    fun addGroup(title: String, description: String, areaOfInterest: String) {
        val group = Group(
            title = title,
            description = description,
            areaOfInterest = areaOfInterest
        )

        viewModelScope.launch {
            try {
                groupRepository.createGroup(group)
                _toastMessage.emit("Group successfully inserted")
            } catch (e: Exception) {
                _toastMessage.emit("An error has occurred: ${e.message}")
            }
        }.invokeOnCompletion {
            Navigator.navigateTo(Screen.GroupsScreen, true)
        }
    }

}