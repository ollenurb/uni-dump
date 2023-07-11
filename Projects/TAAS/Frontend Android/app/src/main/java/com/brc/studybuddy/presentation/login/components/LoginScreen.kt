package com.brc.studybuddy.presentation.login.components

import android.util.Log
import android.widget.Toast
import androidx.activity.result.ActivityResultRegistryOwner
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Email
import androidx.compose.material.icons.filled.Password
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.brc.studybuddy.R
import com.brc.studybuddy.data.model.EmailCredentials
import com.brc.studybuddy.data.model.FacebookCredentials
import com.brc.studybuddy.presentation.login.LoginViewModel
import com.brc.studybuddy.presentation.util.components.IconTextField
import com.facebook.CallbackManager
import com.facebook.FacebookCallback
import com.facebook.FacebookException
import com.facebook.login.LoginManager
import com.facebook.login.LoginResult
import kotlinx.coroutines.flow.collect

@Composable
fun LoginScreen(
    viewModel: LoginViewModel = hiltViewModel()
) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }

    val errorMessageChannel = viewModel.errorMessage
    val ctx = LocalContext.current

    LaunchedEffect(Unit) {
        errorMessageChannel
            .collect {
                Toast.makeText(ctx, it, Toast.LENGTH_SHORT).show()
            }
    }

    Column(
        modifier = Modifier.padding(32.dp),
        verticalArrangement = Arrangement.SpaceBetween
    ) {
        Image(
            painter = painterResource(id = R.drawable.ic_undraw_login),
            contentDescription = null,
        )
        Column(
            modifier = Modifier.padding(top = 32.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Sign In",
                style = MaterialTheme.typography.h4
            )
            Spacer(Modifier.height(16.dp))
            IconTextField(
                text = email,
                placeholder = "Email",
                onTextChange = { email = it },
                icon = Icons.Default.Email
            )
            IconTextField(
                text = password,
                placeholder = "Password",
                onTextChange = { password = it },
                icon = Icons.Default.Password
            )
            Button(
                onClick = { viewModel.authenticate(EmailCredentials(email, password)) },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(text = "Sign In", style = MaterialTheme.typography.button)
            }
            FacebookLoginButton("Login with Facebook") {
                viewModel.authenticate(it)
            }
            CaptionedSeparator(text = "Don't have an account?")
            Button(
                onClick = { viewModel.navigateToRegister() },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(text = "Register Here", style = MaterialTheme.typography.button)
            }
        }
    }

}

@Composable
fun CaptionedSeparator(
    text: String,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        verticalAlignment = Alignment.CenterVertically
    ) {
        val lineColor = LocalContentColor.current.copy(LocalContentAlpha.current)
        Canvas(modifier = Modifier.weight(1f)) {
            drawLine(
                start = Offset(x = 0f, y = 0f),
                end = Offset(x = size.width, y = 0f),
                color = lineColor,
                strokeWidth = 2f
            )
        }
        Text(text = text, modifier = Modifier.padding(horizontal = 12.dp))
        Canvas(modifier = Modifier.weight(1f)) {
            drawLine(
                start = Offset(x = 0f, y = 0f),
                end = Offset(x = size.width, y = 0f),
                color = lineColor,
                strokeWidth = 2f
            )
        }
    }
}

@Composable
fun FacebookLoginButton(
    text: String,
    onSuccess: (FacebookCredentials) -> Unit
) {
    val context = LocalContext.current
    Button(
        onClick = {
            if (context is ActivityResultRegistryOwner) {
                val callbackManager = CallbackManager.Factory.create()
                val loginManager = LoginManager.getInstance()
                loginManager.registerCallback(
                    callbackManager,
                    object : FacebookCallback<LoginResult> {
                        override fun onCancel() {
                            Toast.makeText(context, "Login canceled!", Toast.LENGTH_LONG).show()
                        }

                        override fun onError(error: FacebookException) {
                            Log.e("Login", error.message ?: "Unknown error")
                            Toast.makeText(context, "Login failed with errors!", Toast.LENGTH_LONG).show()
                        }

                        override fun onSuccess(result: LoginResult) {
                            onSuccess(FacebookCredentials(result.accessToken.userId.toLong(), result.accessToken.token))
                        }
                    })
                LoginManager.getInstance().logIn(context, callbackManager, listOf("email"))
            } else {
                Toast.makeText(
                    context,
                    "This login should only happens with an AndroidX activity.",
                    Toast.LENGTH_LONG)
                    .show()
            }
        },
        modifier = Modifier.fillMaxWidth(),
        colors = ButtonDefaults.buttonColors(
            backgroundColor = Color(0xFF1778F2),
            contentColor = Color.White
        )
    ) {
        Text(text = text, style = MaterialTheme.typography.button)
    }
}

@Composable
@Preview
fun LoginScreenPreview() {

}