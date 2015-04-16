require 'sinatra'
require 'active_record'
require "sqlite3"

db = SQLite3::Database.new  "deploy.sqlite3" 

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "./deploy.sqlite3",
  :pool => 1,
  :timeout => 5000
)

require  './instal_config/init_migrates'






