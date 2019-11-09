class SubsController < ApplicationController
  before_action :validate_moderator, only: [:edit, :update]

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
    @sub = Sub.find(params[:id])
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
    @sub = Sub.find(params[:id])
    @sub.update(sub_params)

    redirect_to sub_path(@sub)
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def validate_moderator
    return if current_user == current_sub.moderator
    redirect_to sub_path(current_sub)
  end

  def current_sub
    Sub.find(params[:id])
  end
end
