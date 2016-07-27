# how to start the virtual server in terminal
# ruby main.rb

# how this works in terminal...type in terminal
# pry
# require 'httparty'
# HTTParty.get('http..')
# result = copyaboveline
# result["Title"]

require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do     # / is the location of the root aka home page
  erb :index
end

get '/about' do      # / is the location of the about page
  erb :about
end

get '/result' do       # grabs the result
  search = params['movie_search'].gsub(/\s+/, "+").strip.downcase
  @result = HTTParty.get("http://www.omdbapi.com/?t=#{ search }")
  @search = @result["Search"]
  erb :result
end

get '/display' do
  title = params['title'].gsub(/\s+/, "+").strip.downcase
  @display = HTTParty.get("http://www.omdbapi.com/?t=#{ title }")
  erb :display
end
