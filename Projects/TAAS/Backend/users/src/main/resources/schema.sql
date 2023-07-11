--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS users
(
    id         SERIAL PRIMARY KEY,
    email      VARCHAR(128) UNIQUE NOT NULL,
    firstname  VARCHAR(128)        NOT NULL,
    lastname   VARCHAR(128),
    auth_type  VARCHAR(8)          NOT NULL,
    auth_value VARCHAR(256)        NOT NULL
);

--
-- Table structure for table `members`
--
CREATE TABLE IF NOT EXISTS members
(
    group_id INTEGER               NOT NULL,
    user_id  INTEGER               NOT NULL,
    is_owner BOOLEAN DEFAULT false NOT NULL,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--
-- Table structure for table `attendees`
--
CREATE TABLE IF NOT EXISTS attendees
(
    meeting_id INTEGER               NOT NULL,
    user_id    INTEGER               NOT NULL,
    is_host    BOOLEAN DEFAULT false NOT NULL,
    PRIMARY KEY (user_id, meeting_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
