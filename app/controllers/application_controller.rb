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

	end
end
