package com.brc.studybuddy.presentation.groups.components

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.brc.studybuddy.R
import com.brc.studybuddy.data.model.Group

@Composable
fun NormalGroupItem(
    group: Group
) {
    Card(
        shape = RoundedCornerShape(8.dp),
        elevation = 4.dp,
        backgroundColor = MaterialTheme.colors.surface,
        modifier = Modifier
            .fillMaxWidth()
    ) {
        Column(Modifier.padding(16.dp)) {
            Text(
                text = group.title,
                style = MaterialTheme.typography.h6,
                overflow = TextOverflow.Ellipsis,
                maxLines = 1,
                modifier = Modifier.align(Alignment.CenterHorizontally)
            )

            Spacer(Modifier.height(8.dp))

            Text(
                text = group.areaOfInterest ?: "Other",
                style = MaterialTheme.typography.subtitle1,
                overflow = TextOverflow.Ellipsis,
                maxLines = 1,
                modifier = Modifier.align(Alignment.CenterHorizontally)
            )

            Spacer(Modifier.height(16.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    Icons.Default.MilitaryTech,
                    contentDescription = "Group Owner",
                    modifier = Modifier.alpha(ContentAlpha.medium),
                )
                Spacer(modifier = Modifier.width(4.dp))
                Text(
                    text = group.owner ?: "Owner",
                    style = MaterialTheme.typography.body1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.alpha(ContentAlpha.medium),
                    maxLines = 3
                )
            }

            Spacer(Modifier.height(16.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    Icons.Default.Group,
                    contentDescription = "Group Description",
                    modifier = Modifier.alpha(ContentAlpha.medium),
                )
                Spacer(modifier = Modifier.width(4.dp))
                Text(
                    text = "${group.participants ?: 0} participants",
                    style = MaterialTheme.typography.body1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.alpha(ContentAlpha.medium),
                    maxLines = 3
                )
            }

            Spacer(Modifier.height(16.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    Icons.Default.Description,
                    contentDescription = "Group Description",
                    modifier = Modifier.alpha(ContentAlpha.medium),
                )
                Spacer(modifier = Modifier.width(4.dp))
                Text(
                    text = group.description ?: "Group Description",
                    style = MaterialTheme.typography.body1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.alpha(ContentAlpha.medium),
                    maxLines = 3
                )
            }
        }
    }
}

@Preview
@Composable
fun PreviewNormalGroupItem() {
    NormalGroupItem(
        Group(
            0,
            "Titolo molto lungo per verificare che funzioni",
            "Eccoci qui ragazzi, adesso andiamo a fare una canna e mi viene una fame di flauti fortissima.",
            "Computer Science",
        )
    )
}