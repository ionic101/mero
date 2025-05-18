CREATE TABLE IF NOT EXISTS questions (
    id             BIGSERIAL     PRIMARY KEY,
    question       VARCHAR(1000) NOT NULL,
    answer         VARCHAR(1000),
    questioner_id  BIGINT     NOT NULL
        REFERENCES participants(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    answering_id   BIGINT
        REFERENCES participants(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
