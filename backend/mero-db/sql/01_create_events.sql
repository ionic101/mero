CREATE TABLE IF NOT EXISTS events (
    id             BIGINT     PRIMARY KEY,
    name           VARCHAR(255) NOT NULL,
    login          VARCHAR(255) NOT NULL,
    password       VARCHAR(255) NOT NULL,
    map_url        VARCHAR(255),
    faq            TEXT
);
