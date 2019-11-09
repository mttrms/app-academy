class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)

    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    
    redirect_to new_session_path
  end
end
