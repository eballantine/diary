# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/entry'
require './database_connection_setup'

# App controller
class Diary < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    erb :entries
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Entry.add(params[:title], params[:content])
    redirect('/')
  end

  get '/entries/:id' do
    @entries = Entry.all
    @entry = @entries.select do |entry|
      entry.id == params[:id]
    end.first
    erb :read
  end

  run! if app_file == $PROGRAM_NAME
end
