require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    cols = DBSConnection.execute(<<-SQL)
      SELECT 
        *
      FROM 
        #{self.table_name}
      LIMIT 
        0
    SQL
    @columns = cols
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name 
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
        SELECT 
          #{table_name}.*
        FROM 
          #{table_name}
    SQL

      parse_all(results)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM 
        #{table_name}
      WHERE 
        #{table_name}.id = ?
    SQL

    parse_all(results.first)
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end 
    end
  end

  def attributes
    @attributes = attributes || @attributes = {}
  end

  def attribute_values
    # ...
  end

  def insert
    
    DBConnection.execute(<<-SQL, attributes)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        ?
    SQL

    self.id = DBConection
  end

  def update
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
