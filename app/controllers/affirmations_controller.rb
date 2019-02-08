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


end
