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
      render json: flash
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to @goal
    else
      flash[:errors] = @goal.errors.full_messages
      render json: @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    user = @goal.user
    if @goal.destroy
      redirect_to user
    else
      redirect_to goal
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end
end
