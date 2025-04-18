CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT NOT NULL UNIQUE,
password TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS questions(
id INTEGER PRIMARY KEY AUTOINCREMENT,
FOREIGN KEY (user_id) REFERENCES users(id),
content TEXT NOT NULL
mark INT NOT NULL
);

CREATE TABLE IF NOT EXISTS messages(
id INTEGER PRIMARY KEY AUTOINCREMENT,
FOREIGN KEY (question_id) REFERENCES questions(id)
FOREIGN KEY (user_id) REFERENCES users(id)
content TEXT NOT NULL
mark INTEGER NOT NULL
