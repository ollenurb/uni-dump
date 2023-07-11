--
-- Table structure for table `groups`
--
CREATE TABLE IF NOT EXISTS groups
(
    id               SERIAL PRIMARY KEY,
    title            VARCHAR(128) UNIQUE NOT NULL,
    area_of_interest VARCHAR(128) NOT NULL,
    description      TEXT DEFAULT NULL
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
    FOREIGN KEY (group_id) REFERENCES groups (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
