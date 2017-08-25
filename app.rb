require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/topping_chooser' do
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

	session[:size_choice] = params[:size_radio]
	session[:crust_choice] = params[:crust_radio]
    session[:sauce_choice] = params[:sauce_radio]
    session[:cheese_choice] = params[:cheese_radio]
    session[:meat_choice] = params[:meat_radio]
    session[:veggie_choice] = params[:veggie_radio]

	redirect '/the_end'
end

get '/the_end' do
	erb :final, locals:{size: session[:size_choice], crust: session[:crust_choice], sauce: session[:sauce_choice], meat: session[:meat_choice], veggie: session[:veggie_choice], cheese: session[:cheese_choice]}
end