package com.brc.studybuddy.presentation;

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.mutableStateOf
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.brc.studybuddy.data.repository.AccessTokenRepository
import com.brc.studybuddy.presentation.addgroup.components.AddGroupScreen
import com.brc.studybuddy.presentation.groups.components.GroupsScreen
import com.brc.studybuddy.presentation.login.components.LoginScreen
import com.brc.studybuddy.presentation.registration.components.RegisterScreen
import com.brc.studybuddy.presentation.util.Navigator
import com.brc.studybuddy.presentation.util.Screen
import com.brc.studybuddy.ui.theme.StudyBuddyTheme
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import kotlinx.coroutines.runBlocking
import javax.inject.Inject

@AndroidEntryPoint
class MainActivity : ComponentActivity() {

    @Inject lateinit var accessTokenRepository: AccessTokenRepository

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Check here if the user is already logged in
        val token = runBlocking(Dispatchers.IO) { accessTokenRepository.get().firstOrNull() }
        var loggedIn = false
        if (token != null) {
            loggedIn = true
        }

        setContent {
            StudyBuddyTheme {
                Surface(color = MaterialTheme.colors.background) {
                    val navController = rememberNavController()

                    LaunchedEffect("navigation") {
                        Navigator.sharedFlow.onEach {
                            navController.navigate(it.first.route) {
                                if (it.second) {
                                    popUpTo(0) { inclusive = false }
                                }
                                launchSingleTop = true
                            }
                        }.launchIn(this)
                    }

                    NavHost(
                        navController = navController,
                        startDestination = if(loggedIn) { Screen.GroupsScreen.route } else { Screen.LoginScreen.route }
                    ) {
                        composable(route = Screen.LoginScreen.route) {
                            LoginScreen()
                        }
                        composable(route = Screen.GroupsScreen.route) {
                            GroupsScreen()
                        }
                        composable(route = Screen.RegisterScreen.route) {
                            RegisterScreen()
                        }
                        composable(route = Screen.AddGroupScreen.route) {
                            AddGroupScreen()
                        }


//                        composable(
//                            route = Screen.AddEditNoteScreen.route +
//                                    "?noteId={noteId}&noteColor={noteColor}",
//                            arguments = listOf(
//                                navArgument(
//                                    name = "noteId"
//                                ) {
//                                    type = NavType.IntType
//                                    defaultValue = -1
//                                },
//                                navArgument(
//                                    name = "noteColor"
//                                ) {
//                                    type = NavType.IntType
//                                    defaultValue = -1
//                                },
//                            )
//                        ) {
//                            val color = it.arguments?.getInt("noteColor") ?: -1
//                            AddEditNoteScreen(
//                                navController = navController,
//                                noteColor = color
//                            )
//                        }
                    }
                }
            }
        }
    }

}
