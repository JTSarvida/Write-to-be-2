ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'require_all'
require 'sinatra/base'
require 'sinatra/flash'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_relative '../app/controllers/application_controller'
require_all 'app'
