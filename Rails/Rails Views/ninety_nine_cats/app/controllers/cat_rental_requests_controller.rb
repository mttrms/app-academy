class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
  end

  def create
    @cat = Cat.find(cat_rental_request_params[:cat_id])
    # fail
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

    if @cat_rental_request.save
      redirect_to cat_url(@cat)
    else
      render json: @cat_rental_request.errors.full_messages
    end
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:cat_rental_request][:id])
    @cat_rental_request.approve!

    redirect_to cat_url(params[:id])
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:cat_rental_request][:id])
    @cat_rental_request.deny!

    redirect_to cat_url(params[:id])
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end