# frozen_string_literal: true

require_relative 'database_connection'

# Responsible for CRUD to database
class Entry
  attr_reader :id, :title, :content, :date

  def initialize(id, title, content, date)
    @id = id
    @title = title
    @content = content
    @date = date
  end
  
  def self.all
    connect_db
    results = @connection.exec('SELECT * FROM entries')
    @entries = results.map { |entry| Entry.new(
                                              entry['id'], 
                                              entry['title'], 
                                              entry['content'], 
                                              entry['date']
                                              ) 
                            }
  end

  def self.add(title, content)
    connect_db
    result = @connection.exec_params("INSERT INTO entries (title, content, date_created) 
    VALUES ($1, $2, $3) RETURNING id, title, content, date_created;", [title, content, Time.now])
    Entry.new(result[0]['id'], title, content, result[0]['date_created'])
  end

  private

  def self.connect_db
    @connection = if ENV['ENVIRONMENT'] == 'test'
                    PG.connect(dbname: 'diary_test')
                  else
                    PG.connect(dbname: 'diary')
                  end
  end
end
