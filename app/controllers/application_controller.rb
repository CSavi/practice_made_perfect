class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception 
    skip_before_action :verify_authenticity_token 
    helper_method :logged_in?, :current_user

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= Instructor.find_by_id(session[:user_id])
    end 

end
