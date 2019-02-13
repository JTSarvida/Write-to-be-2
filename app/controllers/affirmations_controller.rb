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

  get '/affirmations/show' do
    if logged_in?
      erb :'/affirmations/show'
    else
      redirect '/login'
    end
  end

  get '/affirmations/:id' do
    if logged_in?
      @affirmations = Affirmation.all
      @affirmation = @affirmations[params[:id].to_i-1]
      @user = User.find(@affirmation.user_id)
      erb :'/affirmations/single-affirmation'
    else
      redirect '/login'
    end
  end

  post '/affirmations' do
    if params[:affirmation]['content'].empty?
      redirect '/affirmations/new'
    else
      @affirmation = Affirmation.create(params[:affirmation])
      current_user.affirmations << @affirmation
      redirect 'home'
    end
  end

  get '/affirmations/:id/edit' do
    if logged_in?
      @affirmations = Affirmation.all
      @affirmation = @affirmations.find(params[:id])
      if current_user.id == @affirmation.user_id
        erb :'affirmations/edit'
      else
        flash[:wronguser] = "You cannot edit other user's affirmations"
        redirect "/affirmations/#{@affirmation.id}"
      end
    else
      redirect '/login'
    end
  end

  patch '/affirmations/:id' do
    @affirmations = Affirmation.all
    @affirmation = @affirmations.find(params[:id])
    if logged_in?
      if params[:affirmation]["content"] == ""
        flash[:emptyinput] = "Please enter your desired edit"
        redirect "/affirmations/#{@affirmation.id}/edit"
      else
        if @affirmation.user_id == current_user.id
          @affirmation.update(params[:affirmation])
          redirect "/affirmations/#{@affirmation.id}"
        else
          flash[:wronguser] = "You cannot edit other user's affirmations"
          redirect "/affirmations/#{@affirmation.id}/edit"
        end
      end
    else
      redirect'/login'
    end 
  end


end
