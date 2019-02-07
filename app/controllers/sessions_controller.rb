class SessionsController < ApplicationController

  get '/signup' do
    erb :"users/register"
  end

end
