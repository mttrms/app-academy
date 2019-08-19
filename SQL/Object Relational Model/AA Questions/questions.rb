require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM users WHERE id = ?
    SQL

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT * FROM users WHERE fname = ? AND lname = ?
    SQL

    User.new(user.first)
  end

  def initialize(data)
    @id = data['id']
    @fname = data['fname']
    @lname = data['lname']
  end

  def save
    if self.id
      QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
        UPDATE users
        SET fname = ?, lname = ?
        WHERE id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
        INSERT INTO users (fname, lname)
        VALUES (?, ?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    self
  end

  def authored_questions
    Question.find_by_user_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end
end

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM questions WHERE id = ?
    SQL

    Question.new(question.first)
  end

  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT * FROM questions WHERE user_id = ?
    SQL

    Question.new(question.first)
  end

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @body = data['body']
    @user_id = data['user_id']
  end

  def save
    if self.id
      QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.user_id, self.id)
        UPDATE questions
        SET title = ?, body = ?, user_id = ?
        WHERE id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.user_id)
        INSERT INTO questions (title, body, user_id)
        VALUES (?, ?, ?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id

      self
    end
  end

  def author
    User.find_by_id(self.user_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(self.id)
  end

  def most_followed(num)
    Question.most_followed_questions(num)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end
  
  def most_liked(num)
    QuestionLike.most_liked_questions(num)
  end
end

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.* FROM users
      JOIN question_follows
      ON users.id = question_follows.user_id
      WHERE question_follows.question_id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.* FROM questions
      JOIN question_follows
      ON questions.id = question_follows.question_id
      WHERE question_follows.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(num)
    questions = QuestionsDatabase.instance.execute(<<-SQL, num)
      SELECT questions.* FROM questions
      JOIN question_follows
      ON questions.id = question_follows.question_id
      WHERE questions.id IN (
        SELECT question_id 
        FROM   question_follows 
        GROUP  BY question_id 
        ORDER  BY count(question_id)
        LIMIT  ?
        )
      GROUP BY question_id
    SQL

    questions.map { |question| Question.new(question) }
  end

  def initialize(data)
    @id = data['id']
    @user_id = data['user_id']
    @question_id = data['question_id']
  end
end

class Reply
  attr_accessor :id, :question_id, :body, :user_id, :reply_id

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM replies WHERE id = ?
    SQL

    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT * FROM replies WHERE user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT * FROM replies WHERE question_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(data)
    @id = data['id']
    @question_id = data['question_id']
    @body = data['body']
    @user_id = data['user_id']
    @reply_id = data['reply_id']
  end

  def save
    if self.id
      QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.body, self.user_id, self.reply_id, self.id)
        UPDATE replies
        SET question_id = ?, body = ?, user_id = ?, reply_id = ?
        WHERE id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.body, self.user_id, self.reply_id)
        INSERT INTO replies (question_id, body, user_id, reply_id)
        VALUES (?, ?, ?, ?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    self
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.reply_id)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT * FROM replies WHERE reply_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end
end

class QuestionLike
  attr_accessor :id, :user_id, :question_id

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT * FROM users
      JOIN question_likes
      ON users.id = question_likes.user_id
      WHERE question_id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    count = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT count(user_id) as num_likers
      FROM question_likes
      WHERE question_id = ?
    SQL

    count.first['num_likers']
  end

  def self.most_liked_questions(num)
    questions = QuestionsDatabase.instance.execute(<<-SQL, num)
      SELECT questions.* FROM questions
      JOIN question_likes
      ON questions.id = question_likes.question_id
      WHERE questions.id IN (
        SELECT question_id 
        FROM   question_likes
        GROUP  BY question_id 
        ORDER  BY count(question_id)
        LIMIT  ?
        )
      GROUP BY question_id
    SQL

    questions
  end

  def initialize(data)
    @id = data['id']
    @user_id = data['user_id']
    @question_id = data['question_id']
  end
end
