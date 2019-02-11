class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/register' do
    erb :'/sessions/register'
  end

  post '/register' do
    @users = User.all
    if !params[:password].empty? && !params[:username].empty? && !params[:email].empty?
      if @users.map {|user| user.username == params[:username] } || @users.map {|user| user.email == params[:email] }
        flash[:alreadyused] = 'This username or email address has already been used.'
        redirect '/register'
      else
        @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        session[:user_id] = @user.id
        redirect '/users/show'
      end
    else
      redirect '/register'
    end
  end

  post '/sessions' do
    login(params[:email])
    redirect '/affirmations'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect'/users/show'
    else
      flash[:message] = 'Incorrect login information.'
      redirect '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end


end
