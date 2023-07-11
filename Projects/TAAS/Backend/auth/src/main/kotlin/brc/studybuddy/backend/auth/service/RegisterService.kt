package brc.studybuddy.backend.auth.service

import brc.studybuddy.backend.auth.component.UsersWebClient
import brc.studybuddy.input.UserInput
import brc.studybuddy.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import reactor.core.publisher.Mono

@Service
class RegisterService {

    @Autowired
    lateinit var usersWebClient: UsersWebClient

    fun register(userInput: UserInput): Mono<User> = usersWebClient.insertUser(userInput)

}