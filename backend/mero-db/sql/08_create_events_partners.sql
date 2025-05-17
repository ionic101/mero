CREATE TABLE IF NOT EXISTS events_partners (
    id             BIGINT     PRIMARY KEY,
    event_id       BIGINT     NOT NULL
        REFERENCES events(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    partner_id     BIGINT     NOT NULL
        REFERENCES partners(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
