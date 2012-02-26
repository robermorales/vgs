require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'logger'
require 'sass'
require 'haml'

get '/' do
	haml :layout
	'Hello world!'
end

# SASS stylesheet
get '/stylesheets/style.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end

