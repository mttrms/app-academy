class CatsController < ApplicationController
  def index
    render json: Cat.all
  end

  def show
    render json: Cat.find(params[:id])
  end

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    cat = Cat.new(name: params[:cat][:name])
    if cat.save
      render json: cat
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end
end
