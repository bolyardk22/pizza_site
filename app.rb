require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/topping_chooser' do
# 	session[:sizes] = params[:size]
# 	session[:crusts] = params[:crust]
# 	session[:sauces] = params[:sauce]
# 	session[:cheeses] = params[:cheese]
# 	session[:meats] = params[:meat]
# 	session[:veggies] = params[:veggie]
 	erb :toppins
end

post '/confirm_toppings' do
	session[:sizes] = params[:size]
	session[:crusts] = params[:crust]
	session[:sauces] = params[:sauce]
	session[:cheeses] = params[:cheese]
	session[:meats] = params[:meat]
	session[:veggies] = params[:veggie]

	if session[:meats] == nil 
		session[:meats] = Array["No Meat"]
	end

	if session[:veggies] == nil
		session[:veggies] = Array["No Veggies"]
	end

	redirect '/confirm'
end

get '/confirm' do 
	erb :confirm, locals:{size: session[:sizes], crust: session[:crusts], sauce: session[:sauces], cheese: session[:cheeses], meat: session[:meats], veggie: session[:veggies]}
end

post '/blah' do
	session[:sizes] = params[:size].to_a
	session[:crusts] = params[:crust]
	session[:sauces] = params[:sauce]
	session[:cheeses] = params[:cheese]
	session[:meats] = params[:meat]
	session[:veggies] = params[:veggie]
	redirect '/the_end'
end

get '/the_end' do
	erb :final
end