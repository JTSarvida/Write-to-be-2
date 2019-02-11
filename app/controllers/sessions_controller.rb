class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/register' do
    erb :'/sessions/register'
  end

  post '/register' do
    
  end
  post '/sessions' do
    session[:email] = params[:email]
    session[:username] = params[:username]
    redirect '/affirmations'
  end


end
