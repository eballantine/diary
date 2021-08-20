# frozen_string_literal: true

require 'PG'

# Responsible for connecting to database
class DatabaseConnection
  attr_reader :connection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
