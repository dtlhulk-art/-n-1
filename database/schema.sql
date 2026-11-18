PRAGMA foreign_keys = ON;

CREATE TABLE laws (
    id          INTEGER PRIMARY KEY,
    law_number  INTEGER NOT NULL UNIQUE,
    title       TEXT NOT NULL,
    summary     TEXT NOT NULL
);

CREATE TABLE sanctions (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL UNIQUE,
    kind        TEXT NOT NULL CHECK (kind IN ('restart', 'card')),
    description TEXT
);

CREATE TABLE offences (
    id          INTEGER PRIMARY KEY,
    law_id      INTEGER NOT NULL,
    name        TEXT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (law_id) REFERENCES laws(id)
);

CREATE TABLE offence_sanctions (
    offence_id  INTEGER NOT NULL,
    sanction_id INTEGER NOT NULL,
    PRIMARY KEY (offence_id, sanction_id),
    FOREIGN KEY (offence_id)  REFERENCES offences(id),
    FOREIGN KEY (sanction_id) REFERENCES sanctions(id)
);

CREATE TABLE glossary (
    id          INTEGER PRIMARY KEY,
    term        TEXT NOT NULL UNIQUE,
    definition  TEXT NOT NULL,
    law_id      INTEGER,
    FOREIGN KEY (law_id) REFERENCES laws(id)
);

CREATE INDEX idx_offences_law ON offences(law_id);
CREATE INDEX idx_offences_name ON offences(name);