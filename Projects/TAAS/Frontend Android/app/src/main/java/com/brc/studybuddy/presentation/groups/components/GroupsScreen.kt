package com.brc.studybuddy.presentation.groups.components

import android.widget.Toast
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Inbox
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.brc.studybuddy.data.model.Group
import com.brc.studybuddy.presentation.util.FetchStatus
import com.brc.studybuddy.presentation.groups.GroupsViewModel

@Composable
fun GroupsScreen(
    viewModel: GroupsViewModel = hiltViewModel()
) {
    val state by viewModel.state

    Scaffold(
        floatingActionButton = {
            FloatingActionButton(
                onClick = { viewModel.navigateToAddGroupScreen() },
                backgroundColor = MaterialTheme.colors.primary
            ) {
                Icon(imageVector = Icons.Default.Add, contentDescription = "Add Group")
            }
        },
        topBar = {
            AppBar(
                title = "Groups",
                onRefreshClicked = { viewModel.refreshData() }
            )
        }
    ) {
        when (val status = state.fetchGroups) {
            is FetchStatus.Success -> {
                if(status.result.isEmpty()) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.Inbox,
                            contentDescription = "Empty List",
                            modifier = Modifier.size(64.dp).alpha(ContentAlpha.disabled)
                        )
                        Text(
                            text = "No Groups yet",
                            modifier = Modifier.padding(vertical = 16.dp).alpha(ContentAlpha.disabled),
                            style = MaterialTheme.typography.h4
                        )
                        Text(
                            text = "Do you want to add one?",
                            modifier = Modifier.alpha(ContentAlpha.disabled),
                        )
                    }
                } else {
                    GroupsList(groups = status.result)
                }
            }
            is FetchStatus.Loading -> {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    CircularProgressIndicator()
                }
            }
            is FetchStatus.Error -> {
                val context = LocalContext.current
                Toast.makeText(context, "An error has been encountered while fecthing the data", Toast.LENGTH_LONG).show()
            }
        }
    }
}

@Composable
fun GroupsList(
    groups: List<Group>
) {
    Column {
        LazyColumn(
            modifier = Modifier.fillMaxHeight(),
            contentPadding = PaddingValues(16.dp, 16.dp, 16.dp, 16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp),
        ) {
            items(groups) {
                NormalGroupItem(group = it)
            }
        }
    }
}


@Preview
@Composable
fun GroupsScreenPreview() {
    GroupsList(
        groups = listOf(
            Group(0, "Title 1", "Desc", null),
            Group(1, "Title 2","Desc", null),
            Group(2, "Title 3","Desc", null),
            Group(3, "Title 4","Desc", null),
            Group(4, "Title 5","Desc", null),
            Group(5, "Title 6","Desc", null),
        ),
    )
}