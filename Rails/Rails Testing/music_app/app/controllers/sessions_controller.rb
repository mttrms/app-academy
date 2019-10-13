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
      log_in_user!(@user)
      redirect_to @user
    end
  end

  def destroy
    user = current_user
    user.reset_session_token!
    session[:session_token] = nil

    render json: 'Logged out'
  end
end
