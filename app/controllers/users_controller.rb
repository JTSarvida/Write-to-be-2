class UsersController < ApplicationController

  get '/home' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @dailyaffirmations = Affirmation.all.take(10)
      erb :'users/show'
    else
      redirect :'/login'
    end
  end

  get '/users/profile/:slug' do
    if logged_in?
      @profile = User.find_by_slug(params[:slug])
      erb :'users/profile'
    else
      redirect :'/login'
    end
  end



end
