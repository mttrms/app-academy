class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end
  
  def login_user!(username, password)
    user = User.find_by_credentials(username, password)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to :cats
  end

  def redirect_logged_in_users
    redirect_to :cats if current_user
  end
end
