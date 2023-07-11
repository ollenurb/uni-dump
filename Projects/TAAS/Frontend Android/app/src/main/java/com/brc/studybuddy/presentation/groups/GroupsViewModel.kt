package com.brc.studybuddy.presentation.groups

import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brc.studybuddy.data.repository.GroupRepository
import com.brc.studybuddy.presentation.util.FetchStatus
import com.brc.studybuddy.presentation.util.Navigator
import com.brc.studybuddy.presentation.util.Screen
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class GroupsViewModel @Inject constructor(
    private val groupRepository: GroupRepository
): ViewModel() {

    private val _state = mutableStateOf(GroupsState())
    val state: State<GroupsState> = _state
    private var getGroupsJob: Job? = null

    init {
        getGroups()
    }

    fun navigateToAddGroupScreen() {
        Navigator.navigateTo(Screen.AddGroupScreen)
    }

    fun refreshData() {
        getGroups();
    }

    private fun getGroups() {
        getGroupsJob?.cancel()
        getGroupsJob = viewModelScope.launch {
            // Set loading UI state
            _state.value = state.value.copy(
                fetchGroups = FetchStatus.Loading
            )
            try {
                _state.value = state.value.copy(
                    fetchGroups = FetchStatus.fromValue(groupRepository.getGroups())
                )
            } catch (e: Exception) {
                Navigator.navigateTo(Screen.LoginScreen, true)
                this.cancel()
            }
        }
    }

}