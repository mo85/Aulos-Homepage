class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def logged_in?
      session[:user_id]
    end
    helper_method :logged_in?
end
