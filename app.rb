require 'sinatra'
enable :sessions

get '/' do
  erb :sandwich_parts
end

post '/build' do
  parts = params[:parts]
  erb :sandwich_results, :locals=>{:parts=>parts}
end

get '/correct' do
    parts = params[:parts]
    toppings = params[:toppings]
    erb :areyousure, :locals=>{:parts=>parts, :toppings=>toppings}
end