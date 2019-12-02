class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	
	#by default, methods in application_controller.rb only accessible in all other contollers
	#by making these helper methods, they are now also accessible by all of our view too
	helper_method :current_user, :logged_in?
	
	def current_user
		#return current user if already found
		# OR if not already found, return user of this session if session exists with this user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def logged_in?
		#true if I have current user, else false
		!!current_user
	end
	
	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to preform that action"
			redirect_to root_path
		end
	end
end
