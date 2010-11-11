class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def logged_in?
    session[:user_id]
  end
  helper_method :logged_in?
  
  def current_user
    if !@headless && session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user
  
  def user_is_admin?
    if current_user && current_user.is_admin
      return true
    end
    false
  end
  helper_method :user_is_admin?
  
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access this page."
    redirect_to root_path
  end
  
end
