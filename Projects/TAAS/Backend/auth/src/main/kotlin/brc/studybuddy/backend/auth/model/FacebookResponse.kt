package brc.studybuddy.backend.auth.model

import com.fasterxml.jackson.annotation.JsonProperty
import com.fasterxml.jackson.annotation.JsonSubTypes
import com.fasterxml.jackson.annotation.JsonTypeInfo

/* Main response wrapper */

/* Instruct Jackson with the classes that can use to deserialize the interface */
@JsonTypeInfo(use = JsonTypeInfo.Id.DEDUCTION, include = JsonTypeInfo.As.PROPERTY)
@JsonSubTypes(
    JsonSubTypes.Type(value = FacebookSuccess::class),
    JsonSubTypes.Type(value = FacebookError::class)
)
interface FacebookResponse

/* Successful Facebook response */
data class FacebookSuccess(
    val id: Long,
    val email: String?,
    @JsonProperty("last_name")
    val lastName: String?,
    @JsonProperty("first_name")
    val firstName: String?,
) : FacebookResponse

/* Error Facebook response */
data class FacebookError(
    val error: Error,
) : FacebookResponse {
    data class Error(val code: Int, val message: String)
}


