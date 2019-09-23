class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    render json: cat_params
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :gender, :color, :birth_date, :description)
  end
end