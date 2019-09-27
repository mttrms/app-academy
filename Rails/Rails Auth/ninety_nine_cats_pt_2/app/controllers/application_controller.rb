class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    raise "No user logged in" if session[:session_token].nil?

    User.find_by(session_token: session[:session_token])
  end
end
