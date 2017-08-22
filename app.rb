require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/topping_chooser' do
	erb :toppins
end
