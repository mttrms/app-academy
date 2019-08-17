PRAGMA foriegn_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	fname TEXT NOT NULL,
	lname TEXT NOT NULL
);


CREATE TABLE questions (
	id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	body TEXT NOT NULL,
	user_id INTEGER NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
	user_id INTEGER NOT NULL,
	question_id INTEGER NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
	id INTEGER PRIMARY KEY,
	question_id INTEGER NOT NULL,
	body TEXT NOT NULL,
	user_id INTEGER NOT NULL,
	reply_id INTEGER,

	FOREIGN KEY (question_id) REFERENCES questions(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
	user_id INTEGER NOT NULL,
	question_id INTEGER NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (question_id) REFERENCES questions(id)
);
