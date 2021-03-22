
require 'sinatra'
require_relative 'gambler'
require_relative 'controller'

enable :sessions

configure do
	enable:session
	set:username, "user_1"
	set:password, "1234"
end

get '/login' do
  erb :login
end

post '/login' do
  if params[:username]==settings.username &&
  	 params[:password]==settings.password
  session[:admin] = true
  redirect to('/home')
  else
	erb:login
  end
end

get '/home' do 
  erb :home
end

post '/logout' do
	session.clear
  redirect '/login'
end

get '/view' do
    @gambler_new = Gambler.last
    erb :view_result
end




