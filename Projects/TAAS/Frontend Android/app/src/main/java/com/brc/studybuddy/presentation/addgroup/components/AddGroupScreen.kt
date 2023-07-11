package com.brc.studybuddy.presentation.addgroup.components

import android.widget.Toast
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Description
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material.icons.filled.KeyboardArrowUp
import androidx.compose.material.icons.filled.Title
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.layout.onGloballyPositioned
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.toSize
import androidx.hilt.navigation.compose.hiltViewModel
import com.brc.studybuddy.presentation.addgroup.AddGroupViewModel
import com.brc.studybuddy.presentation.util.components.IconTextField

@Composable
fun AddGroupScreen(
    viewModel: AddGroupViewModel = hiltViewModel()
) {
    var title by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }
    var areaOfInterest by remember { mutableStateOf("") }

    val errorMessageChannel = viewModel.toastMessage
    val ctx = LocalContext.current

    LaunchedEffect(Unit) {
        errorMessageChannel
            .collect {
                Toast.makeText(ctx, it, Toast.LENGTH_SHORT).show()
            }
    }

    Column {
        TopAppBar(
            title = { Text(text = "Create a new Group") }
        )
        Column(
            modifier = Modifier.padding(32.dp),
            verticalArrangement = Arrangement.spacedBy(18.dp)
        ) {

            OutlinedTextField(
                value = title,
                onValueChange = { title = it },
                modifier = Modifier
                    .fillMaxWidth(),
                label = { Text(text="Title") },
                trailingIcon = {
                    Icon(Icons.Default.Title, "")
                }
            )

            OutlinedTextField(
                value = description,
                onValueChange = { description = it },
                modifier = Modifier
                    .fillMaxWidth(),
                label = { Text(text="Description") },
                trailingIcon = {
                    Icon(Icons.Default.Description, "")
                }
            )

            CustomDropDownMenu(
                onValueChange = { areaOfInterest = it },
                itemsList = listOf(
                    "Computer Science",
                    "Engineering",
                    "Math",
                    "Biology",
                    "Other",
                ),
                label = "Area of interest"
            )

            Button(
                onClick = { viewModel.addGroup(title, description, areaOfInterest) },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(text = "Add", style = MaterialTheme.typography.button)
            }
        }
    }
}

@Composable
@Preview
fun AddGroupScreenPreview() {
    AddGroupScreen()
}

@Composable
fun CustomDropDownMenu(
    modifier: Modifier = Modifier,
    itemsList: List<String>,
    label: String,
    onValueChange: (String) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    var selectedItem by remember { mutableStateOf("") }
    var textFieldSize by remember { mutableStateOf(Size.Zero) }

    val icon = if(expanded) {
       Icons.Filled.KeyboardArrowUp
    } else {
       Icons.Filled.KeyboardArrowDown
    }

    Column {
        Box {
            OutlinedTextField(
                value = selectedItem,
                onValueChange = {
                    selectedItem = it
                },
                modifier = modifier
                    .fillMaxWidth()
                    .onGloballyPositioned { coordinates ->
                        textFieldSize = coordinates.size.toSize()
                    },
                label = { Text(text=label) },
                trailingIcon = {
                    Icon(icon, "", Modifier.clickable { expanded = !expanded })
                },
            )
            Box(modifier = Modifier.matchParentSize().alpha(0f).clickable(onClick = { expanded = !expanded }))
        }

        DropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false },
            modifier = Modifier.width(with(LocalDensity.current){ textFieldSize.width.toDp() })
        ) {
            itemsList.forEach { label ->
                DropdownMenuItem(onClick = {
                    onValueChange(label)
                    selectedItem = label
                    expanded = false
                }) {
                    Text(text = label)
                }
            }
        }
    }
}