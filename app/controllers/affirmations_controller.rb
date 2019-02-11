class AffirmationsController < ApplicationController

  get '/affirmations' do
    if logged_in?
      @affirmations = Affirmation.all
      erb :'/affirmations/index'
    else
      redirect '/login'
    end
  end

  get '/affirmations/new' do
    if logged_in?
      erb :'/affirmations/new'
    else
      redirect '/login'
    end
  end

  get '/affirmations/:id' do
    if logged_in?
      @affirmation = Affirmation.find_by_id(params[:id])
      erb :'affirmations/show'
    else
      redirect '/login'
    end
  end

  post '/affirmations' do
    if params[:affirmation]['content'].empty?
      redirect '/affirmations/new'
    else
      @affirmation = Affirmation.create(params[:affirmation])
      redirect 'users/show'
    end
  end

end
