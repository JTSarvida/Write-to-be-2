class AffirmationsController < ApplicationController

  get '/affirmations' do
    erb :'/affirmations'
  end

  get '/affirmations/new' do
    erb :'/affirmations/new'
  end


end
