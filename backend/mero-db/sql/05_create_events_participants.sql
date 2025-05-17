CREATE TABLE IF NOT EXISTS events_participants (
    id             BIGINT     PRIMARY KEY,
    token          BIGINT     NOT NULL UNIQUE,
    event_id       BIGINT     NOT NULL
        REFERENCES events(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    participant_id BIGINT     NOT NULL
        REFERENCES participants(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);