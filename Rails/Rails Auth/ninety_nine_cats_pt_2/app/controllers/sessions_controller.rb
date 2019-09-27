class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to :cats
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end