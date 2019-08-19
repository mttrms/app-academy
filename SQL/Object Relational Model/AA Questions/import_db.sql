PRAGMA foriegn_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
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

CREATE TABLE question_follows (
	id INTEGER PRIMARY KEY,
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
	id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
	question_id INTEGER NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO users (fname, lname) VALUES
	('Jacob', 'Degrom'),
	('Pete', 'Alonso'),
	('Jeff', 'McNeil');

INSERT INTO questions (title, body, user_id) VALUES
	('Help', 'What is baseball?', 1),
	('I have a question', 'Lorem Ipsum', 1),
	('Testing 123', 'This is the final question', 3);

INSERT INTO question_follows (user_id, question_id) VALUES
	(2, 1),
	(1, 1),
	(3, 1),
	(1, 2),
	(3, 2);

INSERT INTO replies (question_id, body, user_id, reply_id) VALUES
	(1, "Baseball is fun", 2, NULL),
	(1, "I agree", 3, 1);

INSERT INTO question_likes (user_id, question_id) VALUES
	(3, 1);
