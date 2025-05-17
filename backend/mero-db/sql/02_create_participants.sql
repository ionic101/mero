CREATE TABLE IF NOT EXISTS participants (
    id             BIGINT     PRIMARY KEY,
    name           VARCHAR(255) NOT NULL,
    surname        VARCHAR(255) NOT NULL,
    birth_date     TIMESTAMP
);
