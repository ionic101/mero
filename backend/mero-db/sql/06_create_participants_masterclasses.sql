CREATE TABLE IF NOT EXISTS participants_masterclasses (
    id               BIGSERIAL     PRIMARY KEY,
    participant_id   BIGINT     NOT NULL
        REFERENCES participants(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    masterclass_id  BIGINT     NOT NULL
        REFERENCES masterclasses(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);