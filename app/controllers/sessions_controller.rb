class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/register' do
    erb :'/sessions/register'
  end

end
