require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/topping_chooser' do
	erb :toppins
end

post '/topping_chooser' do
	session[:sizes] = params[:size]
	session[:crusts] = params[:crust]
	session[:sauces] = params[:sauce]
	session[:cheeses] = params[:cheese]
	session[:meats] = params[:meat]
	session[:veggies] = params[:veggie]
	redirect 'confirm_toppings'
end

get '/confirm_toppings' do 
	erb :confirm, locals:{size: session[:sizes], crust: session[:crusts], sauce: session[:sauces], cheese: session[:cheeses], meat: session[:meats], veggie: session[:veggies]}
end

post '/confirm_toppings' do
end