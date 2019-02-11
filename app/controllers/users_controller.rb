class UsersController < ApplicationController

get '/users/:slug' do
  @user = User.find_by_slug(params[:slug])
  @dailyaffirmations = Affirmations.all.take(10)
  erb :'/users/show'
end


end
