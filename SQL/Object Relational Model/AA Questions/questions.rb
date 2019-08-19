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

  def initialize(data)
    @id = data['id']
    @fname = data['fname']
    @lname = data['lname']
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

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @body = data['body']
    @user_id = data['user_id']
  end
end

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

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

  def initialize(data)
    @id = data['id']
    @question_id = data['question_id']
    @body = data['body']
    @user_id = data['user_id']
    @reply_id = data['reply_id']
  end
end

class QuestionLike
  attr_accessor :id, :user_id, :question_id

  def initialize(data)
    @id = data['id']
    @user_id = data['user_id']
    @question_id = data['question_id']
  end
end
