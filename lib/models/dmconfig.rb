require 'dm-core'
require 'dm-migrations'
require_relative 'book'
require_relative 'user'
require_relative 'collection'
require_relative 'book_item'

DataMapper::Logger.new($stdout, :debug)

connection_string = "postgres://localhost/library_development"
if ENV['RACK_ENV'] == 'production'
  connection_string = ENV['HEROKU_POSTGRESQL_COBALT_URL']
elsif ENV['RACK_ENV'] == 'test'
  connection_string = "postgres://localhost/library_test"
end

DataMapper.setup(:default, connection_string)
DataMapper.finalize
DataMapper.auto_upgrade!

