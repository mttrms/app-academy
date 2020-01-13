class Api::StepsController < ApplicationController
  def show
    @step = Step.find(params[:id])
    render json: @step
  end

  def index
    @steps = Step.where(todo_id: params[:todo_id])
    render json: @steps
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: :bad_request
    end
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    @step = Step.find(params[:id])
    if @step.destroy
      render json: 'Delete successful.'
    else
      render json: @step
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :body, :done, :todo_id)
  end
end
