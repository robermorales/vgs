require 'sinatra'
require 'data_mapper'
require 'logger'
require 'sass'
require 'haml'

#require 'rubygems'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://root:toor@localhost/vgs")

class Project
	include DataMapper::Resource

	property :id,   Serial
	property :name, String
end

DataMapper.auto_upgrade!

get '/' do
	haml :index
end

get '/projects/index' do
	@projects = Project.all
	haml :project_index
end

# SASS stylesheet
get '/css/main.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :main
end
