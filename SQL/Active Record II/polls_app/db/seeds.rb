# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: 'mttrms' }, { username: 'dhh' }, { username: 'jdegrom' }, { username: 'dwright' }])
polls = Poll.create([{ title: 'Sports', user_id: 1 }, { title: 'Fav Movies', user_id: 3 }, { title: 'What kind of food?', user_id: 1 }, { title: 'Vacations', user_id: 2 }])
poll_one_questions = Question.create([{ text: 'Baseball?', poll_id: 1 }, { text: 'Football?', poll_id: 1}, { text: 'Soccer?', poll_id: 1 }])
poll_two_questions = Question.create([{ text: 'Drama?', poll_id: 2 }, { text: 'Comedy?', poll_id: 2}, { text: 'Horror?', poll_id: 2 }])
poll_three_questions = Question.create([{ text: 'Beach?', poll_id: 3 }, { text: 'Mountains?', poll_id: 3}, { text: 'Disney?', poll_id: 3 }])

AnswerChoice.create([{ text: 'yes', question_id: 1 }, { text: 'no', question_id: 1 }])
AnswerChoice.create([{ text: 'yes', question_id: 2 }, { text: 'no', question_id: 2 }])
AnswerChoice.create([{ text: 'yes', question_id: 3 }, { text: 'no', question_id: 3 }])
AnswerChoice.create([{ text: 'yes', question_id: 4 }, { text: 'no', question_id: 4 }])
AnswerChoice.create([{ text: 'yes', question_id: 5 }, { text: 'no', question_id: 5 }])
AnswerChoice.create([{ text: 'yes', question_id: 6 }, { text: 'no', question_id: 6 }])
AnswerChoice.create([{ text: 'yes', question_id: 7 }, { text: 'no', question_id: 7 }])
AnswerChoice.create([{ text: 'yes', question_id: 8 }, { text: 'no', question_id: 8 }])
AnswerChoice.create([{ text: 'yes', question_id: 9 }, { text: 'no', question_id: 9 }])
AnswerChoice.create([{ text: 'yes', question_id: 10 }, { text: 'no', question_id: 10 }])

Response.create(user_id: 4, answer_choice_id: 1)
Response.create(user_id: 4, answer_choice_id: 4)
Response.create(user_id: 4, answer_choice_id: 6)
Response.create(user_id: 4, answer_choice_id: 7)

Response.create(user_id: 3, answer_choice_id: 14)
Response.create(user_id: 3, answer_choice_id: 16)
Response.create(user_id: 3, answer_choice_id: 1)
Response.create(user_id: 3, answer_choice_id: 19)
