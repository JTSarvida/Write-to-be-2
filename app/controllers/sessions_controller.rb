class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/register' do
    erb :'/sessions/register'
  end

  post '/register' do
    if !params[:password].empty? && !params[:username].empty? && !params[:email].empty?
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/users/show'
    else
      redirect '/register'
    end
  end

  post '/sessions' do
    login(params[:email])
    redirect '/affirmations'
  end

  get 'logout' do
    if logged_in?
      session.clear
    else
      redirect '/'
    end
  end


end
