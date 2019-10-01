class UsersController < ApplicationController
  before_action :redirect_logged_in_users, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      email = UserMailer.welcome_email(@user)
      email.deliver

      login_user!(user_params[:user_name], user_params[:password])
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
