require './config/environment'
class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "secret"
		register Sinatra::Flash
	end

	get '/' do

		@dailyaffirmations = Affirmation.all.take(10)
		if logged_in?
			erb :'/users/show'
		else
			erb :index
		end
	end

	helpers do
		def current_user
			@user = User.find(session[:user_id])
		end

		def logged_in?
			!!session[:user_id]
		end

		def redirect_if_not_logged_in
			if !logged_in?
				redirect '/login'
			end
		end

		def redirect_if_wrong_user
			@affirmation = Affirmation.find_by_id(params[:id])
			if current_user.id != @affirmation.user_id
				flash[:wronguser] = "You cannot edit or delete other user's affirmations"
        redirect "/affirmations/#{@affirmation.id}"
			end
		end
	end
end
