class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      redirect_to :cats
    else
      render json: @user.errors.full_messages
    end
    # render json: user_params
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end