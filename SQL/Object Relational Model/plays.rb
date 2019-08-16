require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    result = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT * FROM plays WHERE title = ?
    SQL

    result
  end

  def self.find_by_playwright(name)
    result = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT * FROM plays JOIN playwrights ON plays.playwright_id = playwrights.id WHERE name = ?
    SQL

    result
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year
  attr_reader :id

  def self.all
    result = PlayDBConnection.instance.execute(<<-SQL)
      SELECT * FROM playwrights
    SQL

    result.map { |data| Playwright.new(data) }
  end

  def self.find_by_name(name)
    result = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT * FROM playwrights WHERE name = ?
    SQL

    result
  end

  def initialize(properties)
    @id = properties['id']
    @name = properties['name']
    @birth_year = properties['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO playwrights (name, birth_year) VALUES (?, ?)
    SQL
    
    self
  end
  
  def update
    raise "#{self} not in dataqbase" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE playwrights SET name = ?, birth_year = ? WHERE id = ?
    SQL

    self
  end
  
  def get_plays
    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT * FROM plays WHERE playwright_id = ?
    SQL

    plays.map { |data| Play.new(data) }
  end
end
