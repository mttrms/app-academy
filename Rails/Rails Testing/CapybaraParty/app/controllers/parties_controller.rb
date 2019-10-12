class PartiesController < ApplicationController
  def new
    @party = Party.new
    render :new
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      render :show
    else
      flash.now[:errors] = @party.errors.full_messages
      render :new
    end
  end

  def show
    @party = Party.includes(:guests, :capy).find(params[:id])
    render :show
  end

  private

  def party_params
    params.require(:party).permit(:occasion, :capy_id)
  end
end
