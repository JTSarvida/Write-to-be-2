class AffirmationsController < ApplicationController

  get '/affirmations' do
    #if logged_in?
    #  @affirmations = Affirmation.all
    #  erb :'/affirmations/index'
  #  else
  #  end
  redirect_if_not_logged_in(:'/affirmations/index')
  end

  get '/affirmations/new' do
    if params["content"] == ""
      flash[:emptyinput] = "Please enter your affirmation."
    else
      flash[:emptyinput] = "Creating your affirmation!"
    end

    #if logged_in?
    #  erb :'/affirmations/new'
  #  else
  #    redirect '/login'
  #  end
    redirect_if_not_logged_in(:'/affirmations/new')
  end

  get '/affirmations/show' do
    #if logged_in?
    #  erb :'/affirmations/show'
  #  else
    #  redirect '/login'
    #end

    redirect_if_not_logged_in(:'/affirmations/show')
  end

  get '/affirmations/:id' do
    if current_user.id == Affirmation.find_by_id(params[:id]).user_id
      flash.now[:edit] = "Editing #{current_user.username}'s affirmation!"
      flash.now[:delete] = "Deleting #{current_user.username}'s affirmation!"
    else
      flash.now[:edit] = "You cannot edit or delete other user's affirmations"
      flash.now[:delete] = "You cannot edit or delete other user's affirmations"
    end

    #if logged_in?
    #  @affirmations = Affirmation.all
    #  @affirmation = Affirmation.find_by_id(params[:id])
    #  @user = User.find(@affirmation.user_id)
    #  erb :'/affirmations/single-affirmation'
  #  else
    #  redirect '/login'
    #end

    redirect_if_not_logged_in(:'/affirmations/single-affirmation')
  end

  post '/affirmations' do
    if params[:affirmation]['content'].empty?
      redirect '/affirmations/new'
    else
      @affirmation = current_user.affirmations.build(params[:affirmation])
      @affirmation.save
      # @affirmation = Affirmation.create(params[:affirmation])
      # current_user.affirmations << @affirmation
      redirect 'home'
    end
  end

  get '/affirmations/:id/edit' do

    #if logged_in?
    #  @affirmations = Affirmation.all
    #  @affirmation = Affirmation.find_by_id(params[:id])
    #  if current_user.id == @affirmation.user_id
    #    flash[:wronguser] = "Editing #{current_user.username}'s affirmation!"
    #    erb :'affirmations/edit'
    #  else
    #    flash[:wronguser] = "You cannot edit or delete other user's affirmations"
    #    redirect "/affirmations/#{@affirmation.id}"
    #  end
    #else
    #  redirect '/login'
    #end
    redirect_if_not_logged_in(:'/affirmations/single-affirmation')
    erb :'/affirmations/edit'
  end

  patch '/affirmations/:id' do
    #@affirmations = Affirmation.all
    #@affirmation = Affirmation.find_by_id(params[:id])
    #if logged_in?
    #  if params[:affirmation]["content"] == ""
    #    flash[:emptyinput] = "Please enter your desired edit"
    #    redirect "/affirmations/#{@affirmation.id}/edit"
    #  else
    #    if @affirmation.user_id == current_user.id
    #      flash[:wronguser] = "Editing #{current_user.username}'s affirmation!"
    #      @affirmation.update(params[:affirmation])
    #      redirect "/affirmations/#{@affirmation.id}"
    #    else
    #      flash[:wronguser] = "You cannot edit or delete other user's affirmations"
    #      redirect "/affirmations/#{@affirmation.id}/edit"
    #    end
    #  end
    #else
    #  redirect'/login'
    #end

    redirect_if_not_logged_in(:'/affirmations/edit')
    redirect_if_wrong_user(:'/affirmations/edit')
    redirect "/affirmations/#{@affirmation.id}"
  end

  delete '/affirmations/:id/delete' do
    #@affirmations = Affirmation.all
    #@affirmation = Affirmation.find_by_id(params[:id])
    #if logged_in?
    #  if current_user.id == @affirmation.user_id
    #    flash[:wronguser] = "Deleting #{current_user.username}'s affirmation!"
    #    @affirmation.delete
    #    redirect '/home'
    #  else
    #    flash[:wronguser] = "You cannot edit or delete other user's affirmations"
    #    redirect "/affirmations/#{@affirmation.id}"
    #  end
    #else
    #  redirect '/login'
    #end
    redirect_if_not_logged_in(:'/affirmations/single-affirmation')
    redirect_if_wrong_user(:'/users/show')
  end


end
