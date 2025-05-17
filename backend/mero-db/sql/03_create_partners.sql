CREATE TABLE IF NOT EXISTS partners (
    id             BIGINT     PRIMARY KEY,
    name           VARCHAR(255) NOT NULL,
    login          VARCHAR(255) NOT NULL UNIQUE,
    password       VARCHAR(255) NOT NULL
);
