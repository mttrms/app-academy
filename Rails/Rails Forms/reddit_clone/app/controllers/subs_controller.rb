class SubsController < ApplicationController
  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    redirect_to new_session_path unless current_user
    @sub = Sub.new
  end

  def edit
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user

    if @sub.save
      redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def update
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
