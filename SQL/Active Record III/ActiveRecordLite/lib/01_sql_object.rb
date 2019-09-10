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
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
