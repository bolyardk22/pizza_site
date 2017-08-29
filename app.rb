require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/topping_chooser' do
 	erb :toppins
end

post '/confirm_toppings' do
	session[:pizza_numb] = 1
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
	erb :confirm, locals:{size: session[:sizes], crust: session[:crusts], sauce: session[:sauces], cheese: session[:cheeses], meat: session[:meats], veggie: session[:veggies], pizza_num: session[:pizza_numb]}
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
	erb :final, locals:{size1: session[:size_choice], crust1: session[:crust_choice], sauce1: session[:sauce_choice], meat1: session[:meat_choice], veggie1: session[:veggie_choice], cheese1: session[:cheese_choice], size: session[:sizes], crust: session[:crusts], sauce: session[:sauces], cheese: session[:cheeses], meat: session[:meats], veggie: session[:veggies], pizza_num: session[:pizza_numb]}
end

post '/delivery' do
	current_pizza_array = params[:current_pizza]
	session[:current_pizza] = params[:current_pizza_array]
	session[:delivery_or_not] = params[:delivered]

	redirect '/check_out'
end

get '/check_out' do
	p session[:current_pizz]
	erb :total_page, locals: {current_pizza: session[:current_pizz], delivered: session[:delivery_or_not], size1: session[:size_choice], crust1: session[:crust_choice], sauce1: session[:sauce_choice], meat1: session[:meat_choice], veggie1: session[:veggie_choice], cheese1: session[:cheese_choice], size: session[:sizes], crust: session[:crusts], sauce: session[:sauces], cheese: session[:cheeses], meat: session[:meats], veggie: session[:veggies], pizza_num: session[:pizza_numb]}
end