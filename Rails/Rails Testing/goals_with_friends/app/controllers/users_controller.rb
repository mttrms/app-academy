class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @goals = current_user == @user ? @user.goals : @user.goals.where(private: false)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
