class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      render :new
    else
      session[:session_token] = @user.reset_session_token!
      redirect_to @user
    end
  end

  def destroy
    user = User.find_by_session_token(session[:session_token])
    user.reset_session_token!
    session[:session_token] = nil

    render json: 'Logged out'
  end
end
