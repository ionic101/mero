CREATE TABLE IF NOT EXISTS masterclasses (
    id                       BIGSERIAL     PRIMARY KEY,
    name                     VARCHAR(255) NOT NULL,
    time_start               TIMESTAMP   NOT NULL,
    time_end                 TIMESTAMP   NOT NULL,
    description              VARCHAR(1000),
    max_count_participants   INT         NOT NULL,
    partner_id               BIGINT     NOT NULL
        REFERENCES partners(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
