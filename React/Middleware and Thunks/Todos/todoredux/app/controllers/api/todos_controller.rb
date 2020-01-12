class Api::TodosController < ApplicationController
  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: :bad_request
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: 'Delete successful.'
    else
      render json: @todo
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
