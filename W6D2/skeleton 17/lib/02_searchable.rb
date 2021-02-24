require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    
    results = DBConection.execute(<<-SQL, params)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        

    SQL
  end
end

class SQLObject
  extend Searchable
end
