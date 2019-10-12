class CapysController < ApplicationController
  def index
    @capys = Capy.all
    render :index
  end

  def show
    @capy = Capy.includes(:parties).find(params[:id])
    render :show
  end

  def new
    @capy = Capy.new
    render :new
  end

  def create
    @capy = Capy.new(capy_params)

    if @capy.save
      redirect_to capy_url(@capy)
    else
      flash.now[:errors] = @capy.errors.full_messages
      render :new
    end
  end

  private

  def capy_params
    params.require(:capy).permit(:name, :color)
  end
end
