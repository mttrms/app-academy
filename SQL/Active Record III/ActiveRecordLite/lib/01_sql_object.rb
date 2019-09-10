require_relative 'db_connection'
require 'active_support/inflector'
require 'pry'
require 'pry-byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @column_names unless @column_names.nil?

    @column_names = 
      DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      LIMIT 1
      SQL
      .first

    @column_names.map! { |column_name| column_name.to_sym }
  end

  def self.finalize!
    columns.each do |column_name|
      define_method(column_name) do
        attributes[column_name] ||= nil
      end

      define_method("#{column_name}=") do |value|
        attributes[column_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name.nil? ? ActiveSupport::Inflector.tableize(name) : @table_name
  end

  def self.all
    results = 
      DBConnection.execute(<<-SQL)
        SELECT *
        FROM #{table_name}
      SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result =
      DBConnection.execute(<<-SQL, id)
        SELECT *
        FROM #{table_name}
        WHERE id = ?
      SQL

    parse_all(result).first
  end

  def initialize(params = {})
    params.each do |k, v|
      raise Exception.new("unknown attribute '#{k}'") unless self.class.columns.include?(k.to_sym)
      self.send("#{k.to_sym}=", v)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |attribute|
      self.send(attribute)
    end
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.join(", ")
    question_marks = (['?'] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set = self.class.columns.drop(1).map do |column|
      "#{column.to_s} = ?"
    end.join(", ")
    
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set}
      WHERE
        id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
