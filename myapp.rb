require 'sinatra'
require "sinatra/reloader" if development?

set :haml, :format => :html5

get '/' do
  haml :index
end

get '/dado/:num' do
  def win?
  rand(1..6)==params['num'].to_i
  end 
  if (win?)
    erb :Ganaste 
  else
    erb :Perdiste 
  end

 
end
get '/hh' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end
get '/resta' do
  def resta
  1-2
  end
  p "Hello resta! #{resta}"
end
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
   "Hello #{params['name']} hora #{@@hora}" 
end
@@hora=Time.now.to_i
get '/posts' do
  # matches "GET /posts?title=foo&author=bar"
  title = params['title']
  author = params['author']
  # uses title and author variables; query is optional to the /posts route
end