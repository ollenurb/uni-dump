package com.brc.studybuddy.data.repository

import com.brc.studybuddy.data.model.Group
import com.brc.studybuddy.data.model.User

interface GroupRepository {

    suspend fun getGroups(): List<Group>

    suspend fun createGroup(group: Group)

    suspend fun addMember(groupId: Int, user: User)

}