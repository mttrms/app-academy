class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:email],
      params[:password]
    )
    
    if @user.nil?
      render :new
    else
      session[:session_token] = user.reset_session_token!
      redirect_to user_path(user)
    end
  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])
    @user.reset_session_token!
    session[:session_token] = nil

    render text: 'Logged out'
  end
end
