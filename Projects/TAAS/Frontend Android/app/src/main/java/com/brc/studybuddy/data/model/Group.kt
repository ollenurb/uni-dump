package com.brc.studybuddy.data.model

data class Group(
    val id: Int? = null,
    val title: String,
    val description: String? = null,
    val areaOfInterest: String? = null,
    val owner: String? = null,
    val participants: Int? = null,
)
