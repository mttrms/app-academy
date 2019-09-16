class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
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
