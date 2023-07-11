package com.brc.studybuddy.presentation.groups

import com.brc.studybuddy.data.model.Group
import com.brc.studybuddy.presentation.util.FetchStatus

/*
 * Holds the state of the Groups screen
 */
data class GroupsState(

    val fetchGroups: FetchStatus<List<Group>> = FetchStatus.fromValue(emptyList())

)
