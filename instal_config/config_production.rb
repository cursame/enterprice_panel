require 'sinatra'
require 'active_record'
require "sqlite3"

ActiveRecord::Base.establish_connection(
  :adapter     => "postgresql",
  :database    => "HEROKU_POSTGRESQL_COBALT",
  :pool        => 1,
  :timeout     => 5000,
  :port        => 5432,
  :datetime    => "timestamp with time zone" ,
  :timestamp   => "timestamp with time zone" 
)

require  './instal_config/init_migrates'