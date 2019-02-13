class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/register' do
    erb :'/sessions/register'
  end

  post '/register' do
    @users = User.all
    @usernames = []
    @users.each {|user| @usernames << user.username}
    if !params[:password].empty? && !params[:username].empty? && !params[:email].empty?
      if @usernames.include?(params[:username]) || @usernames.include?(params[:email])
        flash[:alreadyused] = 'This username or email address has already been used.'
        redirect '/register'
      else
        @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        session[:user_id] = @user.id
        redirect '/home'
      end
    else
      flash[:alreadyused] = 'Please enter a username, email, and password.'
      redirect '/register'
    end
  end

  post '/sessions' do
    login(params[:email])
    redirect '/affirmations'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:emptyinput] = "Please don't leave any field blank"
      redirect '/'
    else
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect'/home'
      else
        flash[:message] = 'Incorrect login information.'
        redirect '/'
      end
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
