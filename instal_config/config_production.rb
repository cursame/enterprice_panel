require 'sinatra'
require 'active_record'
require "pg"

ActiveRecord::Base.establish_connection(
  :adapter     => "postgresql",
  :host        => "ec2-107-22-166-233.compute-1.amazonaws.com",
  :database    => "d1qjvnlkr2nchf",
  :user        => "xfstixpuqpcziu",
  :password    => "avJTTKiK7LrBKssND5U-0GCuwK",
  :pool        => 1,
  :timeout     => 5000,
  :port        => 5432,
  :datetime    => "timestamp with time zone" ,
  :timestamp   => "timestamp with time zone" 
)

require  './instal_config/init_migrates'