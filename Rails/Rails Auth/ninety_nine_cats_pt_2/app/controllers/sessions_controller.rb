class SessionsController < ApplicationController
  before_action :redirect_logged_in_users, only: [:new, :create]
  
  def new
    render :new
  end

  def create
    login_user!(user_params[:user_name], user_params[:password])
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to :cats
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end