class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_user_id
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end
 
  def log_in_user!(user)
    session[:session_token] = user.reset_session_token! 
  end

  def log_out_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_user!
    redirect_to new_session_url unless current_user
  end

  def current_user_id
    current_user ? current_user.id : nil
  end
end
