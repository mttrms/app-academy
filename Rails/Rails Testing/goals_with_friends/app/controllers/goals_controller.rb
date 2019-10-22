class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      redirect_to goal_path(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end
end
