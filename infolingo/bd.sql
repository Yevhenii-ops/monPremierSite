CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT NOT NULL UNIQUE,
password TEXT NOT NULL,
profile_photo TEXT,
badges TEXT[]
);

CREATE TABLE IF NOT EXISTS questions(
id INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER NOT NULL,
title TEXT NOT NULL,
content TEXT NOT NULL,
mark INTEGER DEFAULT 0,
date TEXT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS answers(
id INTEGER PRIMARY KEY AUTOINCREMENT,
question_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
content TEXT NOT NULL,
mark INTEGER DEFAULT 0,
FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS votes(
question_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
vote INTEGER NOT NULL,
FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE answer_votes (
    user_id INTEGER,
    answer_id INTEGER,
    vote INTEGER,
    FOREIGN KEY (answer_id) REFERENCES answers(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS learned_languages(
user_id INTEGER NOT NULL,
language TEXT NOT NULL,
niveau_de_matrise TEXT NOT NULL
);

/*DROP TABLE users;
DROP TABLE questions;
DROP TABLE answers;
DROP TABLE votes;
DROP TABLE learned_languages*/