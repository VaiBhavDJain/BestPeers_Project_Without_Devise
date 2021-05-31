class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info, :vaibhav_flash
  
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?
  
    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      current_user
    end
end


# tnymtamumygrnpdb